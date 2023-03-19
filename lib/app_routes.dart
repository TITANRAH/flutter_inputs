import 'package:flutter/material.dart';
import 'package:inputs/pages/calendar_page.dart';
import 'package:inputs/pages/check_box_page.dart';
import 'package:inputs/pages/keyboard_types_page.dart';
import 'package:inputs/pages/keys_pages/animated_text.dart';
import 'package:inputs/pages/keys_pages/list_keys_page.dart';
import 'package:inputs/pages/keys_pages/list_page_keys.dart';
import 'package:inputs/pages/keys_pages/movable_widget.dart';
import 'package:inputs/pages/keys_pages/numbers_page.dart';
import 'package:inputs/pages/radio_page.dart';
import 'package:inputs/pages/slider_page.dart';
import 'package:inputs/pages/text_field_page.dart';
import 'package:inputs/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.textField: (_) => const TextFieldPage(),
    Routes.keyboardTypes: (_) => const keyboardTypesPage(),
    Routes.checkBox: (_) => const CheckBoxPage(),
    Routes.radio: (_) => const RadioPage(),
    Routes.slider: (_) => const SliderPage(),
    Routes.calendar: (_) => const CalendarPage(),
    Routes.animatedText: (_) => const AnimatedText(),
    Routes.listKeys: (_) => const ListKeysPage(),
    Routes.numbersPage: (_) => const NumbersPage(),
    Routes.movablePage: (_) => const MovablePage(),
    Routes.listPageKeys: (_) => const ListPageKeys(),
  };
}
