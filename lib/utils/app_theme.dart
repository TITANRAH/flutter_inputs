import 'package:flutter/material.dart';

import 'material_color_generator.dart';

ThemeData getThemeData(BuildContext context) {
  return ThemeData(
    primarySwatch: generateMaterialColor(
      Color.fromARGB(255, 171, 212, 168),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(
        Colors.white,
      ),
      fillColor: MaterialStateProperty.all(
        Colors.pinkAccent,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
