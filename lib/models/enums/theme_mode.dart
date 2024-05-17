import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

enum LocalThemeMode {
  light,
  dark,
  system,
}

extension CurrentThemeModeExt on LocalThemeMode {
  String toText() {
    return switch (this) {
      LocalThemeMode.light => '浅色模式',
      LocalThemeMode.dark => '深色模式',
      LocalThemeMode.system => '跟随系统'
    };
  }

  ThemeMode themeMode(){
    return switch(this){
      LocalThemeMode.light => ThemeMode.light,
      LocalThemeMode.dark => ThemeMode.dark,
      LocalThemeMode.system => ThemeMode.system
    };
  }
}

extension StringExt on String {
  LocalThemeMode toThemeMode() {
    return EnumToString.fromString(LocalThemeMode.values, this) ??
        LocalThemeMode.system;
  }
}
