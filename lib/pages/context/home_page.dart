import 'package:flutter/material.dart';
import 'package:inputs/utils/screen_utils.dart';

class HomePageContext extends StatelessWidget {


    
  const HomePageContext({super.key});



  @override
  Widget build(BuildContext context) {
    // queremos recuperar un material app por que es el widget padre
    // ENCERRAMOS EN LA PROPUEDAD HOME DE MAIN AL WIDGET PRINCIPAL DE HOME EN UN
    // SIZBOX Y AHORA SI DETECTA QUE EL WIDGET PADRE ES UN SIZEBOX
    // recuperamos el valor impuesto en el widget padre escrito en main home:
    // al ser width de 400 me entrega ese dato
    // esta funcion de find acestor solo recupera el valor del widget mas cercano

    // final sizebox = context.findAncestorWidgetOfExactType<SizedBox>();

    // el media query es un widget padre no implicito por lo que podemos acceder sin problema
    // final mediquery = context.findAncestorWidgetOfExactType<MediaQuery>();

    // defini una funcion para retornar el mediaqueri.data.size
    // y me la traje, esta en utilis sreeen_size.dart
    final screenSize = context.screenSize;
    // print('object ${mediquery.data.size}');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('ancho ${screenSize!.width} x alto ${screenSize.height}'),
      ),
    );
  }
}
