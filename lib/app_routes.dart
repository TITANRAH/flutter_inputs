import 'package:flutter/material.dart';
import 'package:inputs/main.dart';
import 'package:inputs/pages/calendar_page.dart';
import 'package:inputs/pages/check_box_page.dart';
import 'package:inputs/pages/context/contador_prueba_context.dart';
import 'package:inputs/pages/context/home_page.dart';
import 'package:inputs/pages/context/splash_page.dart';
import 'package:inputs/pages/inherited_widget_SECCION11/home_counter_inherited.dart';
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

import 'pages/context/product_page.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.textField: (_) => const TextFieldPage(),
    Routes.keyboardTypes: (_) => const keyboardTypesPage(),
    Routes.checkBox: (_) => const CheckBoxPage(),
    Routes.radio: (_) => const RadioPage(),
    Routes.slider: (_) => const SliderPage(),
    Routes.calendar: (_) => const CalendarPage(),
    // keys
    Routes.animatedText: (_) => const AnimatedText(),
    Routes.listKeys: (_) => const ListKeysPage(),
    Routes.numbersPage: (_) => const NumbersPage(),
    Routes.movablePage: (_) => const MovablePage(),
    Routes.listPageKeys: (_) => const ListPageKeys(),

    // context
    Routes.homePage: (_) => const HomePageContext(),
    Routes.productPage: (_) => const ProductPageContext(),
    Routes.splashPage: (_) => const SplashPageContext(),
    Routes.counterPage: (_) => const CounterPageContext(),

    //inherited widget
    Routes.homeInheritedWidget: (_) => const HomeInheritedPage(),
  };
}
