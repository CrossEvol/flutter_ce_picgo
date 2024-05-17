import 'package:flutter/material.dart';

class ThemeDataStyle {
  
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.lightBlueAccent.shade200,
      secondary: Colors.lightBlue.shade300,
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.deepPurple.shade700,
      secondary: Colors.deepPurple.shade900,
    ),
  );

}