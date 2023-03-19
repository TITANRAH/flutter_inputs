import 'package:flutter/material.dart';

class ListPageKeys extends StatefulWidget {
  const ListPageKeys({super.key});

  @override
  State<ListPageKeys> createState() => _ListPageKeysState();
}

class _ListPageKeysState extends State<ListPageKeys> {
  // DEFINIMOS UN GlobalKey
  final listkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(
        builder: (_, orientation) {
          // PONGO EL LISTVIEW EN UNA VARIABLE
          final listview = ListView.builder(
            key: listkey,
            itemCount: 1000,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text('$index'),
              );
            },
          );

          // SI CAMBIAMOS LA ORIENTACION A HORIZONTAL SE VERA
          if (orientation == Orientation.portrait) {
            return Column(
              children: [
                const Text('PORTRAIT'),
                Expanded(child: listview),
              ],
            );
          }
          // ORIENTACION VERTICAL EN CASO DE QUE NO SEA PORTRAIT U HORIZONTAL
          return Row(
            children: [
              const Expanded(
                child: Text('LANDSCAPE'),
              ),
              Expanded(child: listview),
            ],
          );
        },
      ),
    );
  }
}
