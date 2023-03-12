import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  String? _better;
  String? _gender;

  void _onBeatterChanged(String? value) {
    setState(() {
      _better = value;
    });

    print(_better);
  }

  void _onGenderChanged(String? value) {
    setState(() {
      _gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Text('Witch is better?'),
            RadioListTile<String>(
              value: 'flutter',
              title: const Text('flutter'),
              groupValue: _better,
              contentPadding: EdgeInsets.zero,
              // CUANDO LA FUNCION ES DEL MISMO TIPO QUE EL CALLBACK A DEFINIR
              // PODEMOS PASARLA COMO PARAMETRO,
              // EN ESTE CASO ON CHANGED ES LO MISMO QUE DEFINI ARRIVA QUE _ONBEA
              onChanged: _onBeatterChanged,
            ),

            // si lo dejo sin tiparlo como string tendria que trabajar
            // con valores enteros
            RadioListTile<String>(
              value: 'react native',
              contentPadding: EdgeInsets.zero,
              title: const Text('react native'),
              groupValue: _better,
              onChanged: _onBeatterChanged,
            ),
            Divider(),
            Text('What is your gender?'),

            // TENGO QUE CAMBIAR LA VARIABLE QUE CONTIENE LA PREGUNTA
            // EN ESTE CASI ES OTRA PREGUNTA ASI QUE MI VARIABLE ES _GENDER

            RadioListTile<String>(
              value: 'male',
              contentPadding: EdgeInsets.zero,
              title: const Text('male'),
              groupValue: _gender,
              onChanged: _onGenderChanged,
            ),

            RadioListTile<String>(
              value: 'female',
              contentPadding: EdgeInsets.zero,
              title: const Text('female'),
              groupValue: _gender,
              onChanged: _onGenderChanged,
            ),
          ],
        ),
      ),
    );
  }
}
