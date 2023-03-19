import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({super.key});

  @override
  State<CounterButton> createState() => CounterButtonState();
}

class CounterButtonState extends State<CounterButton> {
  int _counter = 0;

  void reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          _counter++;
        });
      },
      child: Text(
        _counter.toString(),
        style: TextStyle(fontSize: 35),
      ),
    );
  }
}
