import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  // defino una fecha de hoy
  late DateTime _date, _initialDate;

  @override
  void initState() {
    super.initState();

    // le doy el valor a la fecha en el init state

    _initialDate = DateTime(1993, 4, 10);
    _date = _initialDate;

    // el initial date no puede ser partir en un dia que no esta siendo
    // retornado en el selectableDayPredicate , y como el initialDate
    // esta partiendo en 1993 4 10 osea sabado, el programa se caera
    // por lo que en ciclo while decimos :
    // mientras la condicion sea falsa, osea no pueda cumplirse ,
    // (si mi initial date es sabado no se cumpliria la funcion de _selectableDayPredicate
    // ) mientras la condicion sea falsa, en el init state digo que le sume 1 al initialDate
    // para que no entre en el error, y como estoy quitando sabado y domingo
    // el initialdate seria igual a lunes
    // como los dias cortados son sabado y domingo me convenia el ciclo while
    // por que a lo mas dara dos vueltas el ciclo
    while (!_selectableDayPredicate(_initialDate)) {
      _initialDate = _initialDate.add(
        const Duration(days: 1),
      );
      _date = _initialDate;
    }

    if (!_selectableDayPredicate(_initialDate)) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _selectTime,
            icon: const Icon(Icons.watch_sharp),
          ),
          IconButton(
            onPressed: _selectDate,
            icon: const Icon(Icons.calendar_month),
          ),
          IconButton(
            // si la fecha seleccionada a initial date que vale 2 de feb de 1993
            // habilita el boton de guardado
            // puedo hacerlo asi o mejor aun una funcion como esta abajo
            // onPressed: _date != _initialDate ? () {} : null,

            // como la funcion _save es del mismo tipo que onPresed no es
            // necesario poner parentesis
            onPressed: _save,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SafeArea(
        child: CalendarDatePicker(
          // podemos decidir con que calendario comenzar
          // initialCalendarMode: DatePickerMode.year,
          // llamo a la fecha y digo que esa sera la inicial
          // la fecha inicial no puede ser mayor a la final
          initialDate: _date,
          firstDate: DateTime(1900, 5),
          // LA FECHA FINALMNO PUEDE SER MENOR A LA FECHA INICIAL
          lastDate: DateTime.now(),
          onDateChanged: (date) {
            // al realizar la funcion _save no necesito set state
            // setState(() {
            //   _date = date;
            // });
            _date = date;
          },

          // con este parametro puedo desahbilitar los dias que necesite
          selectableDayPredicate: _selectableDayPredicate,
          // para deshbilitar los sabados del mes digo que returne los dias
          // que son distitnos de 6, y 6 = sabado lo mismo para domingo
          // si yo pongo como fecha inicial un sabado initialday
          // y lo deshabilito me dara error
        ),
      ),
    );
  }

  bool _selectableDayPredicate(DateTime date) {
    return date.weekday != 6 && date.weekday != 7;
  }

  void _save() {
    if (_initialDate != _date) {
      print(_date);
    }

    Navigator.pop(context);
  }

  void _selectDate() async {
    // al usar esta funcion se levanta un modal de calendario
    final date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1900, 5),
        lastDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.input);

    if (date != null) {
      setState(() {
        _date = date;
      });
    }
  }

  void _selectTime() async {
    final timeOfDay = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        // puedo mostrar el reloj con la hora actual o  bien
        // pasarle parametros
        // initialTime: TimeOfDay.now(),
        initialTime: const TimeOfDay(
          hour: 0,
          minute: 0,
        ),
        // asi podemos hacer que el dialogo de la hora no pueda
        // cerrarse pulsando en cualquier parte fuera del dialogo
        // se puede usar tambien en showdatepicker
        builder: (_, child) {
          return WillPopScope(
            child: child!,
            onWillPop: () async => false,
          );
        },
        hourLabelText: 'hora',
        minuteLabelText: 'minutos',
        cancelText: 'Cancelar',
        confirmText: 'Aceptar');

    if (timeOfDay != null) {
      setState(() {
        print(timeOfDay);
      });
    }
  }
}
