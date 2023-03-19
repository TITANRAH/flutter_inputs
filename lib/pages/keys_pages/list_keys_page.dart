import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inputs/widgets/counter_button.dart';

class ListKeysPage extends StatefulWidget {
  const ListKeysPage({super.key});

  @override
  State<ListKeysPage> createState() => _ListKeysPageState();
}

class _ListKeysPageState extends State<ListKeysPage> {
  bool _enabledEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // tengo un listview en el cial tengo un email y un password
          // tambien tengo una variable bool enabledemail en true
          // puse un widget switch en el appbar y en su value puse esta variable
          // bool enabledEmail, luego en el onchanged del switch dije que _enabledEmail
          // es igual al value, y el swich da true o falso, lo que condincionara
          // que se muestre o no mi email
          Switch(
            value: _enabledEmail,
            onChanged: (value) {
              setState(
                () {
                  _enabledEmail = value;
                },
              );
            },
          ),
        ],
      ),
      body: ListView(
        // sin no pusiera un key en password, al esconder el email que tiene ya algo escrito
        // eso escrito pasaria a ser el valor de password, lo que es un error, para evitarlo
        // usamos key y le damos un valor y eso no ocurre
        padding: EdgeInsets.all(15),
        children: [
          if (_enabledEmail) Text('text1'),
          Text('text2'),
          if (_enabledEmail)
            const TextField(
              decoration: InputDecoration(
                label: Text('Email'),
              ),
            ),
          const TextField(
            key: Key('pass'),
            decoration: InputDecoration(
              label: Text('Password'),
            ),
          ),
          const CounterButton(key: Key('counter1')),
          const CounterButton(
            // para preservar ele stado del widget en caso de que vaya a cambiar
            // su posicion, como la condicion de arriba si cambia la posocion
            // pierden el estado por endela informacion
            // para evitarlo usamos keys pero si no tuvieramos una condicion
            // que cambiara la posicion del widget no seria neccesario
            key: Key('counter2'),
          ),
        ],
      ),
    );
  }
}
