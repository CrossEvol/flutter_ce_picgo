import 'package:flutter/material.dart';

class ThemeDataStyle {
  
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: Colors.white,
      primary: Colors.lightBlueAccent.shade200,
      secondary: Colors.indigoAccent.shade200,
      error: Colors.redAccent.shade200
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade800,
      primary: Colors.deepPurple.shade600,
      secondary: Colors.deepPurple.shade800,
      error: Colors.red.shade900
    ),
  );

}