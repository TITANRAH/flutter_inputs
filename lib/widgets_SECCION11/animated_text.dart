import 'package:flutter/material.dart';
import 'package:inputs/pages/inherited_widget_SECCION11/home_counter_inherited.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final homeInheritedPage = context.findAncestorStateOfType<HomeInheritedPageState>()!;

    final homeProvider = MyHomePageCounterProvider.of(context);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: Text(
        homeProvider.counter.toString(),
        key: UniqueKey(),
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
