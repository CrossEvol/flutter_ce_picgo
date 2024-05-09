import 'dart:convert';

import 'package:flutter_ce_picgo/constants/table_name_keys.dart';
import 'package:flutter_ce_picgo/database/db_provider.dart';

import '../../models/image_storage_setting.dart';

abstract class ImageStorageSettingPageContract {
  void loadPb(List<PBSetting> settings);

  void loadError(String errorMsg);

  void transferError(String e);

  void transferSuccess();

  void exportConfigSuccess(String config);

  void exportConfigError(String message);
}

class ImageStorageSettingPagePresenter {
  ImageStorageSettingPageContract _view;

  ImageStorageSettingPagePresenter(this._view);

  doLoadPb() async {
    var list = await dbProvider.db.query(PB_SETTING_TABLE);
    // try {
    //   var sql = Sql.setTable('pb_setting');
    //   var list = await sql.get();
    //   var realList = list.map((map) {
    //     return PBSetting.fromMap(map);
    //   }).toList();
    //   _view.loadPb(realList);
    // } catch (e) {
    //   _view.loadError('${e.toString()}');
    // }
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
