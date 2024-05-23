import 'dart:convert';

import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:json2yaml/json2yaml.dart';
import 'package:yaml/yaml.dart';

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
  doTransferJson(String yamlStr) async {
    try {
      var yamlMap = loadYaml(yamlStr);
      var jsonMap = jsonDecode(jsonEncode(yamlMap)) as Map<String, dynamic>;
      jsonMap.forEach((key, value) async {
        if (value != null && value.toString().isNotEmpty) {
          var safeMap = {};
          for (var entry in (value as Map<String, dynamic>).entries) {
            safeMap.putIfAbsent(entry.key, () => entry.value ?? '');
          }
          await dbProvider.saveImageStorageSettingConfig(
              type: key, config: jsonEncode(safeMap));
        }
      });
      _view.transferSuccess();
    } catch (e) {
      _view.transferError('转换失败，请确认配置无误');
    }
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
  }
}
