import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inputs/mixins/after_first_layout_mixin.dart';
import 'package:inputs/pages/context/home_page.dart';

class SplashPageContext extends StatefulWidget {
  const SplashPageContext({super.key});

  @override
  State<SplashPageContext> createState() => _SplashPageContextState();
}

class _SplashPageContextState extends State<SplashPageContext> with AfterFirstLayoutMixin<SplashPageContext> {
  // LO COMENTE POR QUE CREE UN MIXIN GENERAL PARA TODA LA APP
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   // esto me serivira para realizar alguna accion solo si el widget ya se rendereizo
  //   // podemos ademas con essto saber si el usuario salio de la app o entro nuevamente como cuando camboa de app
  //   // en medio del uso de la app

  //   // toda acccion se realizara despues de renderizado el widget
  //   // al realizarlo con widgetsBinding.instance
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _init();
  //   });

  // }

  // sobreescribi el metodo del mixin creado
  @override
  void onAfterFirstLayout() {
    Future<void> _init() async {
      // check session
      // FUTURE DELAYED SIRVE PARA DAR UN TIEMPO ANTES DE ALGO
      // Future.delayed(
      //   Duration(milliseconds: 100),
      // );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomePageContext(),
        ),
      );

      //   showDialog(
      //       context: context,
      //       builder: (_) => AlertDialog(
      //             content: Text('hello'),
      //           ));
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
