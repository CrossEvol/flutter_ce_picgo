import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

typedef LocalThemeMode = ThemeMode;

extension CurrentThemeModeExt on LocalThemeMode {
  String toText() {
    return switch (this) {
      LocalThemeMode.light => '浅色模式',
      LocalThemeMode.dark => '深色模式',
      LocalThemeMode.system => '跟随系统'
    };
  }
}

extension StringExt on String {
  LocalThemeMode toThemeMode() {
    return EnumToString.fromString(LocalThemeMode.values, this) ??
        LocalThemeMode.system;
  }
}
