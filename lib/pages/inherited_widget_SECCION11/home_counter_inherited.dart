import 'package:flutter/material.dart';

import 'package:inputs/global/theme_controller.dart';
import 'package:inputs/main.dart';
import 'package:inputs/state_managment/consumer.dart';
import 'package:inputs/state_managment/notifier.dart';
import 'package:inputs/state_managment/provider.dart';
import 'dart:math' as math;

import '../../widgets_SECCION11/counter_seccion11.dart';

class MyHomePageController extends ProviderNotifier {
  int _counter = 0;
  Color _color = Colors.blue;
  double _fontSize = 30;

  double get fontSize => _fontSize;
  Color get color => _color;
  int get counter => _counter;

  void increment() {
    _counter++;
    final index = math.Random().nextInt(Colors.primaries.length - 1);
    _color = Colors.primaries[index];
    notify();
  }

  void increaseFontSize() {
    _fontSize++;
    notify();
  }
}

class HomeInheritedPage extends StatelessWidget {
  const HomeInheritedPage({Key? key}) : super(key: key);

  // lo comento por que cambiaremos a inheritedwidget
  // int get counter => _counter;
  // Color get color => _color;

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);

    print('themeController hashcode: ${themeController.hashCode}');

    return Provider<MyHomePageController>(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Consumer<ThemeController>(builder: (_, controller) {
              return Switch(
                activeColor: Colors.redAccent,
                value: controller.isDarkEnabled,
                onChanged: (_) {
                  controller.toogleTheme();
                },
              );
            }),
            Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Provider.of<MyHomePageController>(context).increaseFontSize();
                },
                icon: const Icon(Icons.font_download),
              );
            }),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CounterSeccion11(),
              Consumer<MyHomePageController>(
                builder: (_, controller) => Text(
                  controller.fontSize.toString(),
                  style: TextStyle(fontSize: controller.fontSize),
                ),
              )

              // lo comento por que cambiaremos a inheritedwidget
              // CounterSeccion11(),

              // este context no es el del widget padre es del widget builder
              // Builder(
              //   builder: (context) {
              //     MyHomePageCounterProvider.of(context);
              //     return Text('lala');
              //   },
              // )
            ],
          ),
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              Provider.of<MyHomePageController>(context).increment();
            },
          );
        }),
      ),
      create: () => MyHomePageController(),
    );
  }
}

// class MyHomePageCounterProvider extends InheritedWidget {
//   final int counter;
//   final Color color;

//   const MyHomePageCounterProvider({
//     Key? key,
//     required this.counter,
//     required this.color,
//     required Widget child,
//   }) : super(
//           key: key,
//           child: child,
//         );

//   // updateShouldNotify se encarga de notificar a los widgets que se suscribieron a los cambios de un widget padre
//   // por medio de su contexto, solo hay que tener cuidado con renderizar widgets de forma innecesaria
//   // por ejemplo si el texto cambia que es el fontsize , no es necesario cambiar el widget animated text
//   // ni contador text
//   @override
//   bool updateShouldNotify(MyHomePageCounterProvider oldWidget) {
//     print('oldwidget ${oldWidget.counter}');
//     print('current widget $counter');

//     // esto retorna true por lo que se renderizan los widgets y muestra el cambio del contador
//     // todos los widgets hijos se actualizaran siempre y cuando la condicion se cumpla
//     // por ejemplo con el texto fontSize , puede cambiar al presionar el icon button del appbar
//     // pero esta codicion no tiene nada que ver, el antiguo widget en cuanto al contador
//     // es igual al actual contador por lo que la condicion no se cumple
//     // en vez de retornar true mejor validar especificamente lo que necesitemos
//     return oldWidget.counter != counter || oldWidget.color != color;
//   }

//   // este metodo estatico solo puede ser llamado desde los hijos de un widget
//   static MyHomePageCounterProvider of(BuildContext context) {
//     final provider = context.dependOnInheritedWidgetOfExactType<MyHomePageCounterProvider>();

//     // si el contexto es utilizado por un widget hijo retorna el provider
//     assert(provider != null, 'invalid context, Could not find with the passed context');

//     return provider!;
//   }
