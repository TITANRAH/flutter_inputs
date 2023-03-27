// SIMPLEMENTE TIPAMOS UN NOMBRE CUALQUIERA Y LE DEFINIMOS LO QUE NECESITEMOS
// EN ESTE CASO ES UNA FUNCION VOID Y LA USAMOS EN LA VARIABLE LIST COMO UN ALIAS
import 'package:flutter/foundation.dart';
import 'package:inputs/state_managment/provider.dart';

typedef VoidCallback = void Function();

abstract class ProviderNotifier {
  final List<VoidCallback> _listeners = [];

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  @protected
  void notify() {
    for (final listener in _listeners) {
      listener();
    }
  }

  // protected el metodo dispose unicamente puede ser llamado dentro de la denficion de esta clase 
  // que extiende de ProviderNotifier
//  mustCallSuper agrega una advertencia cuando se quiera sobrescribir el mtodo dispose 
//  sin llamar a super. dispose

  @protected
  @mustCallSuper
  void dispose() {
    _listeners.clear();
  }
}

// EXPLICACION DE PROVIDER

// CUANDO TENGAMOS EN LA VISTA WIDGETS QUE QUIEREN ESCUCHAR LOS CAMBIOS EN NUESTRO PROVIDER 
// EL QUE VA A NOTIFICAR QUE SE PRODUJO UN CAMBIO ES UNA INSTANCIA DE LA CLASE 
// PROVIDERNOTIFIER 
// Y LOS WIDGETS QUE QUIERAN ESCUCHAR ESTOS CAMBIOS DESDE PROVIDER NOTIFIER 
// VAN A TENER QUE CREAR UNA FUNCION Y ESRTA FUNCION SERA GUARDADA EN LISTENERS 
// CADA VEZ QUE ALGO CAMBIE EN PROVIDER EN LISTENRES LLAMAREMOS A LA FUNCION CREADA EN EL WIDGET 
// Y CUANDO SE EJECUTE ESA FUNCION EN EL WIDGET SE VA A LLAMAR A SET STATE DE UN STAFULLWIGET


