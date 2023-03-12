import 'package:flutter/material.dart';
import 'package:inputs/app_routes.dart';
import 'package:inputs/utils/material_color_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: appRoutes,
      theme: ThemeData(
        // estilo para appbar y demases
        primarySwatch: generateMaterialColor(
          Color.fromARGB(255, 171, 212, 168),
        ),

        // estilos para checkbox
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(
            Colors.white,
          ),
          overlayColor: MaterialStateProperty.all(
            Colors.blueGrey.withOpacity(0.2),
          ),
          fillColor: MaterialStateProperty.all(
            Colors.pinkAccent,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),

        // ESTILOS PARA RADIO
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(
            Colors.pinkAccent,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final keys = appRoutes.keys.toList();

    // esto lo hacemos por que mostraremos el contenido principal en base a rutas
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (_, index) {
          final routeName = keys[index];
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, routeName);
            },
            title: Text(routeName),
          );
        },
        itemCount: keys.length,
      ),
    );
  }
}
