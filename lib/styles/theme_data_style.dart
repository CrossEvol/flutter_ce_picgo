import 'package:flutter/material.dart';

class ThemeDataStyle {
  
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.lightBlueAccent.shade200,
      secondary: Colors.indigoAccent.shade200,
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade800,
      primary: Colors.deepPurple.shade600,
      secondary: Colors.deepPurple.shade800,
    ),
  );

}