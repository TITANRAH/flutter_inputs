import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inputs/constants/countries.dart';
import 'package:inputs/mixins/after_first_layout_mixin.dart';
import 'package:inputs/utils/screen_utils.dart';

class CounterPageContext extends StatefulWidget {
  const CounterPageContext({super.key});

  @override
  State<CounterPageContext> createState() => _CounterPageContextState();
}

// llamo al mixin, sobrescribo el metodo que falta
class _CounterPageContextState extends State<CounterPageContext> with AfterFirstLayoutMixin {
  int counter = 30;
  final _textKey = GlobalKey();
  final safeAreaKey = GlobalKey();

// //LE SACO EL OR Y TIRA ERROR QUE SE SOLUCIONA ESCRIBIENDO ASYNC, TAMBIEN PUEDO
// QUITAR EL FUTURE

// metodo que pertenece al mixin que realice y que puedo utilizar en cualquier parte
// me sirve para poder asegurarme que se renderiza el widget al menos una vez
  @override
  void onAfterFirstLayout() async {
    print('PRIMERO EL INIT DEL mixin');
    printTextSize();
  }

  @override
  Widget build(BuildContext context) {
    print('luego el print del widget');
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _increment();
          });
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            printTextSize();
          });
        },
      ),
      body: SafeArea(
        key: safeAreaKey,
        child: Center(
          child: Text(
            key: _textKey,
            '$counter',
            style: TextStyle(fontSize: counter.toDouble()),
          ),
        ),
      ),
    );
  }

  void _increment() {
    setState(() {
      counter++;
    });
  }

  // puedo obtener las dimensiones del texto o de un widget cualquier
  // accediendo a su key
  // hay que hacer un casting ya que RenderBox permite hacerlo
  void printTextSize() {
    final renderBox = _textKey.currentContext!.findRenderObject() as RenderBox;

    final screenSize = context.screenSize;

    // podemos saber la posicion de un widget en este caso el punto de referencia es la
    // esquina superior izquierda offset 0 , 0
    // pero si le paso el screenSize referente al metodo en utils para saber las dimensiones
    // la referencia de la posicion es el centro
    final position = renderBox.localToGlobal(
      // Offset(
      //   screenSize!.width * 0.5,
      //   screenSize.height * 0.5,
      // ),

      // si no se le pasa acestor, tomara las referencias del widget padre
      Offset.zero,
      // el ancestor es el safe area
      ancestor: safeAreaKey.currentContext!.findRenderObject(),
    );

    print(renderBox.size);
    print(' valores respecto a la esquina superior izquierda $position');
  }
}
