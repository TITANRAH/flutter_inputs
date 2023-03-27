import 'package:flutter/material.dart';
import 'package:inputs/state_managment/notifier.dart';

// PROVIDER :

// PASO 1 : CREAR STATEFULL WIDGET NOMBRE PROIVDER
// PASO 2: TIPARLOS GENERICOS TODOS
// PASO 3: CREAMOS EL PROVIDER NOTIFIER
// PASO 4: CREAMOS  LO QUE NECESITA PROVIDER NOTIFIER Y TIPAMOS CON ESA CLASE AL
// DATO GENERICO DE T

class Provider<T extends ProviderNotifier> extends StatefulWidget {
  const Provider({
    Key? key,
    required this.child,
    required this.create,
  }) : super(key: key);

  final Widget child;
  final T Function() create;

  @override
  State<Provider<T>> createState() => _ProviderState<T>();

  static T of<T extends ProviderNotifier>(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<_InheritedWidget<T>>();
    assert(provider != null);
    return provider!.notifier;
  }
}

class _ProviderState<T extends ProviderNotifier> extends State<Provider<T>> {
  late final T _notifier;

  @override
  void initState() {
    super.initState();

    _notifier = widget.create();
  }

  @override
  void dispose() {
    // ignore: invalid_use_of_protected_member
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedWidget(
      notifier: _notifier,
      child: widget.child,
    );
  }
}

class _InheritedWidget<T extends ProviderNotifier> extends InheritedWidget {
  final T notifier;

  const _InheritedWidget({
    Key? key,
    required Widget child,
    required this.notifier,
  }) : super(
          key: key,
          child: child,
        );

  // este metodo se encarga de notificar a los widget hijos cuando las propiedades
  // de este widget cambiam
  @override
  bool updateShouldNotify(_) {
    return false;
  }
}
