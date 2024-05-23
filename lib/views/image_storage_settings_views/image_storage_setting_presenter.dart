import 'dart:convert';

import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:json2yaml/json2yaml.dart';

import '../../database/db_interface.dart';
import '../../models/image_storage_setting.dart';

abstract class ImageStorageSettingPageContract {
  void loadPb(List<ImageStorageSetting> settings);

  void loadError(String errorMsg);

  void transferError(String e);

  void transferSuccess();

  void exportConfigSuccess(String config);

  void exportConfigError(String message);
}

class ImageStorageSettingPagePresenter {
  final ImageStorageSettingPageContract _view;

  ImageStorageSettingPagePresenter(this._view);

  doLoadPb() async {
    try {
      var settings = await dbProvider.getAllSettings();
      _view.loadPb(settings);
    } catch (e) {
      _view.loadError(e.toString());
    }
  }

  /// transfer picgo json config to flutter-picgo
  doTransferJson(String jsonStr) async {
    // try {
    //   Map<String, dynamic> map = json.decode(jsonStr);
    //   map.forEach((key, value) async {
    //     var config = json.encode(value);
    //     await ImageUploadUtils.savePBConfig(key, config);
    //   });
    //   // success
    //   _view.transferSuccess();
    // } catch (e) {
    //   _view.transferError('转换失败，请确认配置无误');
    // }
  }

  /// 导出所有配置
  doExportConfig() async {
    try {
      var githubConfigJson = await dbProvider.getImageStorageSettingConfig(
          type: ImageStorageType.github);
      var giteeConfigJson = await dbProvider.getImageStorageSettingConfig(
          type: ImageStorageType.gitee);
      Map<String, dynamic> map = {};
      map.putIfAbsent('github', () => jsonDecode(githubConfigJson));
      map.putIfAbsent('gitee', () => jsonDecode(giteeConfigJson));
      _view.exportConfigSuccess(json2yaml(map));
    } catch (e) {
      logger.e(e);
      _view.exportConfigError('$e');
    }
    // try {
    //   var sql = Sql.setTable(TABLE_NAME_PBSETTING);
    //   var list = await sql.get();
    //   Map<String, dynamic> map = {};
    //   list.forEach((element) {
    //     var pbItem = PBSetting.fromMap(element);
    //     if (!isBlank(pbItem.config)) {
    //       map[pbItem.type] = json.decode(pbItem.config);
    //     }
    //   });
    //   _view.exportConfigSuccess(json.encode(map));
    // } catch (e) {
    //   _view.exportConfigError('$e');
    // }
  }
}
