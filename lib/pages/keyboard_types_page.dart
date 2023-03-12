import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class keyboardTypesPage extends StatelessWidget {
  const keyboardTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(25),
        children: [
          const TextField(
            //  keyboardType: TextInputType.emailAddress,nos permite que el texto sea tipo email
            //  por lo que muestra el teclado una arroba
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              label: Text('Email'),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 20,
          ),
          const TextField(
            //  keyboardType: TextInputType.phone,nos permite que el texto sea tipo phone
            //  por lo que muestra el teclado numeros
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              label: Text('Phone'),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const TextField(
            //  keyboardType: TextInputType.numberWithOptions,nos permite que el texto sea tipo phone
            //  por lo que muestra el teclado numeros decimales
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
              signed: true,
            ),
            decoration: InputDecoration(
              label: Text('Números decimales'),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            //  keyboardType: TextInputType.phone,nos permite que el texto sea tipo letras
            //  por lo que muestra el teclado letras

            // esto hace que no se pongan mayusculas por defecto
            autocorrect: false,
            // esto hace que no se pongan mayusculas por defecto pero para android
            enableSuggestions: false,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              label: Text('Name'),
              border: OutlineInputBorder(),
            ),
            onSubmitted: (value) {
              print('pulso boton del teclado');
            },
            textInputAction: TextInputAction.go,
          ),
        ],
      ),
    );
  }
}
