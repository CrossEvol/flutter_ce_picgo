import 'dart:developer';

import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/constants/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

extension SharedPreferencesExtension on SharedPreferences {
  Future<String> getDefaultStorage() async {
    return getString(SharedPreferencesKeys.settingDefaultStorage) ??
        ImageStorageType.github;
  }

  Future<void> setDefaultStorage(String type) async {
    setString(SharedPreferencesKeys.settingDefaultStorage, type);
  }
}

Future<void> useSharedPreferences() async {
  prefs = await SharedPreferences.getInstance();
}

Future<void> testSharedPreferences() async {
  log(await prefs.getDefaultStorage());
  prefs.setDefaultStorage(ImageStorageType.gitee);
  log(await prefs.getDefaultStorage());
}
