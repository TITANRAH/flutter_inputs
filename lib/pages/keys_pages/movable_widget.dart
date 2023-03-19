import 'package:flutter/material.dart';
import 'package:inputs/widgets/counter_button.dart';

class MovablePage extends StatefulWidget {
  const MovablePage({super.key});

  @override
  State<MovablePage> createState() => _MovablePageState();
}

class _MovablePageState extends State<MovablePage> {
  bool _inBody = true;

  // global key para abrir el drawer en el iconbutton

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // tipo el global a utilizar con la clase a llamar

  // pasos del global :

  // 1 creo un widget llamado counterbutton que se usa para aumentar
  // un contador en 1
  // 2 creo una variable que es el un global key y la tipo con el state del widget
  // a usar en este caso CounterButtonState
  // 3 coloco el key que corresponde al widget que estoy llamando CounterButton(
  //               key: counterkey,
  //             )
  // 4 en el widget creo un metodo para resetear el contador a cero
  // 5 con el globalkey tipado puedo acceder a los metodos creados en esta clase

  // podemos aacceder a los estados de un widget asi con global key

  final counterkey = GlobalKey<CounterButtonState>();
  @override

  // la idea aca es que tengo un contador en scaffold con el boton contador
  // que aumenta en 1, cuando lo pulso suma de 1 en 1 pero al moverlo hacia appbar
  // el estado vuelve a 0 no sirven las keys como en los listview

  // la forma de moverlo es simplemente esconderlo y mostrarlo mediante un bool
  // y un switch en el appbar

  //PARA MANTENER EL ESTADO USAREMOS UN GLOBALKEY

  // la diferencia es que el local key (key value key) preserva el estado
  // solo en widget de tipo lista

  // pero el global key preserva el esgado independiente que este en una lista
  // solo si es statefullwidget puedo usar los globalkeys
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        // para poder abrir el drawer cuando sobrescribo el leading
        // poniendo mi propio leading
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),

        // SI COMENTAMOS ESTE TITLE QUE CONTIENE EL BUTTON EL ESTADO DEL BUTTON QUE ESTA
        // EN EL BODY NO MANTENDRA SU ESTADO AL MOVER EL SWITCH O HACER CUALQUIER COSA
        // QUE SIGINIFIQUE RENDERIZAR LA PANTALLA, ESTO SE DEBE A QUE COMO FLUTTER
        // NO ENCUENTRA OTRO COUNTER BUTTON CON LA MISMA KEY NO NOTA QUE EL TRASLADO
        // POR LO QUE DESTRUYE EL WIDGET Y REGRESA AL VALOR 0
        // POR LO QUE AL USAR ESTO DEBE HABER OTRO WIDGET CON LA MISMA KEY PARA
        // QUE NO VUELVA A SU ESTADO ORIGINAL

        title: !_inBody
            ? CounterButton(
                key: counterkey,
              )
            : null,
        actions: [
          TextButton(
            onPressed: () {
              // traigo el estado del widget gracias al globalkey
              // la idea es llamar al metodo reset declarado en el widget counter
              // print('estado que viene desde el widget counter ${counterkey.currentState}');

              // llamo a traves del global key a la clase que contiene el metodo a usar
              // la casteo y le digo que es de tipo de counterbuttonstate y llamo al metodo
              // de esta clase
              counterkey.currentState?.reset();
            },
            child: const Text(
              'reset',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Switch(
            value: _inBody,
            onChanged: (value) {
              setState(() {
                _inBody = value;
              });
            },
          ),
        ],
      ),
      body: _inBody ? CounterButton(key: counterkey) : null,
    );
  }
}
