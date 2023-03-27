import 'package:flutter/material.dart';
import 'package:inputs/state_managment/notifier.dart';
import 'package:inputs/state_managment/provider.dart';

class Consumer<T extends ProviderNotifier> extends StatefulWidget {
  const Consumer({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(BuildContext context, T notfier) builder;

  @override
  State<Consumer<T>> createState() => _ConsumerState();
}

class _ConsumerState<T extends ProviderNotifier> extends State<Consumer<T>> {
  late final T _notifier;

  bool _initialized = false;
  @override
  void initState() {
    super.initState();
  }

  // ES EL SEGUNDO CICLO DE VIDA DE FLUTTER
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _notifier = Provider.of<T>(context);
      _notifier.addListener(_listener);
      _initialized = true;
    }
  }

  void _listener() {
    setState(() {});
  }

  @override
  void dispose() {
    _notifier.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      _notifier,
    );
  }
}
