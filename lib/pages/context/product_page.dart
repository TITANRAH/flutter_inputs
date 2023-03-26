import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inputs/main.dart';
import 'package:inputs/utils/string_utils.dart';

import '../../utils/screen_utils.dart';

class ProductPageContext extends StatefulWidget {
  const ProductPageContext({super.key});

  @override
  State<ProductPageContext> createState() => _ProductPageContextState();
}

class _ProductPageContextState extends State<ProductPageContext> {
  @override
  Widget build(BuildContext context) {
    // al generar la extencion de las dimenciones podemos acceder a esta funcion

    // convertire la funcion en un getter
    final screenSize = context.screenSize;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showMessage(context);
      }),

      // COMENTAMOS PARA HACER EL VIDEO 207
      // body: Column(
      //   children: [
      //     Container(
      //       // quiero que el container ocupe la mitad del dispositivo
      //       // tambien puede ser asi :
      //       // height: screenSize.height/2 ,
      //       height: screenSize!.height * 0.5,
      //       color: Colors.grey,
      //       child: Center(
      //         // prueba de funcion para status bar altura
      //         // valor del status bar trayendo el getters desde utils
      //         // child: Text(context.statusBarHeight.toString()),

      //         // prueba para verificar email
      //         // verifica si contiene un @ el estring
      //         child: Text('text'.isEmail.toString()),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  void showMessage(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const HomePage(),
      ),
    );
    // showDialog(
    //   context: context,
    //   builder: (_) {
    //     final dialogKey = GlobalKey();
    //     return AlertDialog(
    //       key: dialogKey,
    //       content: Text('hellow'),
    //       actions: [
    //         TextButton(
    //           onPressed: () async {
    //             // minimiza el dialogo y a su vez destruye la ruta anterior
    //             await Navigator.pushReplacement(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (_) => HomePage(),
    //               ),
    //             );

    //             if (dialogKey.currentWidget != null) {
    //               context.size;
    //             }
    //           },
    //           child: Text('go to home'),
    //         )
    //       ],
    //     );
    //   },
    // );
  }
}
