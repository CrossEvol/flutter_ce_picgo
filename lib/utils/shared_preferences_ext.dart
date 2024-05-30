import 'package:flutter/foundation.dart';
import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/constants/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

extension SharedPreferencesExtension on SharedPreferences {
  Future<String> getDefaultStorage() async {
    return getString(SharedPreferencesKeys.settingDefaultStorage.name) ??
        ImageStorageType.github.name;
  }

  Future<void> setDefaultStorage(String type) async {
    setString(SharedPreferencesKeys.settingDefaultStorage.name, type);
  }
}

Future<void> useSharedPreferences() async {
  prefs = await SharedPreferences.getInstance();
  if (kDebugMode) {
    prefs.remove(SharedPreferencesKeys.settingDefaultStorage.name);
  }
}
