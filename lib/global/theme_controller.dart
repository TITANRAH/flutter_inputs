import 'package:inputs/state_managment/notifier.dart';

class ThemeController extends ProviderNotifier {
  bool _isDarkEnabled = false;
  bool get isDarkEnabled => _isDarkEnabled;

  void toogleTheme() {
    _isDarkEnabled = !_isDarkEnabled;
    notify();
  }
}
