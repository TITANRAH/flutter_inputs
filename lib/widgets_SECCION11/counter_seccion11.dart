import 'package:flutter/material.dart';
import 'package:inputs/pages/inherited_widget_SECCION11/home_counter_inherited.dart';
// import 'package:inputs/pages/inherited_widget_SECCION11/home_counter_inherited.dart';
import 'package:inputs/widgets_SECCION11/animated_text.dart';

class CounterSeccion11 extends StatelessWidget {
  const CounterSeccion11({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('counter seccion 11');
    // accedo al estado de un widget usando context hacia atras por ejem,
    // este widget es hijo de homeinheritdpage pero necesito recuperar info de este
    // widget padre asi lo hacemos:
    // podemos obtener los valores del widget padre realizando geetters en el
    // debo quitar la palabra const para que no pida el const en el padre
    // hago lo mismo en el otro widget que nececsita que le pasen parametros que es animated text
    // final homeInheritedPage = context.findAncestorStateOfType<HomeInheritedPageState>()!;
    //lo comneto por que cambiaremos a inherit widget

    // solo puedo utilizar este metodo con clases que extiendan de inheritedwidget en este caso
    // myhomeprovider creado en home_counter_inherited.dart es de este tipo
    final homeProvider = MyHomePageCounterProvider.of(context);

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: homeProvider.color,
      ),
      child: const Center(
        child: AnimatedText(),
      ),
    );
  }
}
