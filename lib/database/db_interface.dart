import 'package:flutter_ce_picgo/models/enums/uploaded_state.dart';
import 'package:flutter_ce_picgo/models/image_storage_setting.dart';
import 'package:flutter_ce_picgo/models/uploaded_image.dart';

import 'db_interface_stub.dart'
    if (dart.library.html) 'hive_db_provider.dart'
    if (dart.library.io) 'non_web_db_provider.dart';

late DbInterface dbProvider;

typedef RemoveUploadImageVO = (
  int id,
  String filepath,
  String storageType,
  String name
);

abstract interface class DbInterface {
  factory DbInterface() => getInstance();

  Future<void> init({bool isCreate = false});

  Future<List<ImageStorageSetting>> getAllSettings();

  Future<void> saveImageStorageSettingConfig(
      {required String type, required String config});

  Future<String> getImageStorageSettingConfig({required String type});

  Future<String> getImageStorageSettingName({required String type});

  Future<void> saveUploadedImage(UploadedImage uploadedImage);

  Future<List<UploadedImage>> getUploadedImages();

  Future<bool> removeUploadImage(RemoveUploadImageVO removeUploadImageVO);

  Future<bool> updateUploadedImage(
      {required String filepath,
      String? url,
      String? name,
      UploadState? state});
}
