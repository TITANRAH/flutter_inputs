import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  // el valor iniicial debe estar siempre en el rango de min y max
  double _value = 10;
  double _value2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              // puedo poner simplemente el widget el slider y modificarlo
              // globalmente desde el main en el sliderthemdata o bien
              // envolver el slider aca en un widget sliderthem invocar a sliderthemedata
              // y realizarlo aca o boen en las dos partes como esta realizado actualmente
              // asi mismo para check box radios etc
              SliderTheme(
                data: const SliderThemeData(
                  trackHeight: 4,
                ),
                child: Slider(
                  onChangeStart: (_) {
                    print('comienza');
                  },
                  onChangeEnd: (_) {
                    print('termina');
                  },
                  min: 0,
                  max: 10,
                  label: _value2.toString(),
                  value: _value2,
                  divisions: 10,
                  onChanged: (value) {
                    setState(() {
                      // flortodoble redondea un double
                      _value2 = value.floorToDouble();
                    });
                  },
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    height: 200,
                    // con este widget pongo el slider vertical
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Slider(
                        min: 10,
                        max: 100,
                        label: _value.toString(),
                        value: _value,
                        divisions: 98,
                        onChanged: (value) {
                          setState(() {
                            // flortodoble redondea un double
                            _value = value.floorToDouble();
                          });
                        },
                      ),
                    ),
                  ),
                  Text('text')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
