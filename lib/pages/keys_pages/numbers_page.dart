import 'dart:ui';

import 'package:flutter/material.dart';

class NumbersPage extends StatefulWidget {
  const NumbersPage({super.key});

  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  final List<int> _numbers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // AGREGO UNA LISTA DE 100 NUMEROS A LA LISTA NUMBERS
    _numbers.addAll(
      List.generate(100, (index) => index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // tomo un elemento de una lista y lo piuedo cambiar de posicion
        child: ReorderableListView.builder(
            onReorder: (oldIndex, newIndex) {
              print('index original oldIndex :$oldIndex');
              print('index nuevo newIndex:$newIndex');

              // esto siginifca que al hacer el ordenamiento tome un elemento
              // y lo movi hacia abajo eso significa que oldindex es menor que newindex
              if (oldIndex < newIndex) {
                // si muevo el 0 al 1 el nuevo index sera de 2 al restarle 1 quedara en 1
                // por lo que esa sera su nueva posicion
                newIndex -= 1;
                print('index nuevo menos 1 newIndex: $newIndex');
              }
              // aqui digo que item es igual al elemento removido que en este caso es old index
              final item = _numbers.removeAt(
                oldIndex,
              );

              // luego inserto ese item en el nuevo indice de esta forma:
              _numbers.insert(newIndex, item);
            },
            itemCount: _numbers.length,
            itemBuilder: (_, index) {
              final value = _numbers[index];

              return ListTile(
                key: ValueKey(value),
                title: Text(
                  '$value',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
