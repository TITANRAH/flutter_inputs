import 'dart:ffi';

import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(
              () {
                _counter++;
              },
            );
          },
        ),
        body: Center(
          child: AnimatedSwitcher(
            // para cambiar las animaciones uso transitionbuilder
            // si no lo uso por defecto usa fadetransition
            // DONDE CHILD SERA EL WIDGET CHILD QUE EN ESTE CASO
            // ES CIRCULAR PROGRESS O TEXT SEGUN LA CONDICION
            transitionBuilder: (child, animation) {
              // return FadeTransition(
              //   opacity: animation,
              //   child: child,
              // );

              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            duration: Duration(milliseconds: 200),

            // PARA PRIMER EJERCISIO, LUEGO COMENTE
            // child: _counter % 2 == 0
            //     ? CircularProgressIndicator()
            //     : Text(
            //         _counter.toString(),
            //         style: TextStyle(
            //           fontSize: 25,
            //         ),
            //       ),

            // si no le pusiera un key a este widget text,
            // la animacion de flutter no haria efecto, por que no
            // sabria que es un widget distinto para renderizar
            // no asi con el anterior ejemplo donde habia otro widget para
            // que determinaba un cambio de widget
            child: Text(
              _counter.toString(),
              key: ValueKey(_counter),
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ));
  }
}
