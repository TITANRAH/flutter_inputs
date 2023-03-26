// show state significa que no traigas todo el paquete solo necesario
import 'dart:async';

import 'package:flutter/widgets.dart' show State, StatefulWidget, WidgetsBinding;

mixin AfterFirstLayoutMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {

      onAfterFirstLayout();
    });
  }

  // void onAfterFirstLayout();

  FutureOr<void> onAfterFirstLayout();
}
