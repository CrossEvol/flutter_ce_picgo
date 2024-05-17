import 'package:flutter_ce_picgo/models/enums/theme_mode.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('theme mode enum tests', () {
    for (var value in ['light', 'dark', 'system','unknown']) {
      var themeMode = value.toThemeMode();
      print(themeMode.toText());
    }
  });
}
