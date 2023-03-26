import 'package:flutter/material.dart';

// generamos una extencion de buildcontext para obtener las dimenciones de pantalla
// las extensiones no pueden tener propiedades
// primero defino el nombre camelcase de estencion, luego digo donde se aplicara esta
// extension;
extension ScreenUtilsExtension on BuildContext {
  MediaQueryData get mediaQueryData {
    final mediquery = findAncestorWidgetOfExactType<MediaQuery>();
    return mediquery!.data;
  }

  double get statusBarHeight {
    return mediaQueryData.viewPadding.top;
  }

  Size? get screenSize {
    return mediaQueryData.size;
  }
}
