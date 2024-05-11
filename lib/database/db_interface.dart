
import 'package:flutter_ce_picgo/models/image_storage_setting.dart';

late DbInterface dbProvider;

abstract interface class DbInterface {

  Future<void> init({bool isCreate = false});

  Future<List<ImageStorageSetting>> getAllSettings();

  Future<void> saveImageStorageSettingConfig({required String type, required String config});

  Future<String> getImageStorageSettingConfig({required String type});
}
