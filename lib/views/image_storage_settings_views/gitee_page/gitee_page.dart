import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:go_router/go_router.dart';

import '../../../models/config.dart';
import '../../../models/gitee_config.dart';
import '../base_pb_page_state.dart';

class GiteePage extends StatefulWidget {
  const GiteePage({super.key});

  @override
  BasePBSettingPageState<GiteePage> createState() => _GiteePageState();
}

class _GiteePageState extends BasePBSettingPageState<GiteePage> {
  @override
  onLoadConfig(String config) {
    List<Config> configs = [];
    Map<String, dynamic> map;
    if (config.isEmpty) {
      map = GiteeConfig.none().toJson();
    } else {
      map = GiteeConfig.fromJson(json.decode(config)).toJson();
    }
    map.forEach((key, value) {
      late Config config;
      if (key == 'owner') {
        config = Config(
            label: '设定仓库所属空间地址',
            placeholder: '例如 hackycy',
            needValidate: true,
            value: value,
            name: '');
      } else if (key == 'repo') {
        config = Config(
            label: '设定仓库名',
            placeholder: '例如 picBed',
            needValidate: true,
            value: value,
            name: '');
      } else if (key == 'token') {
        config = Config(
            label: '设定Token',
            placeholder: 'Token',
            needValidate: true,
            value: value,
            name: '');
      } else if (key == 'customUrl') {
        config = Config(
            label: '设定自定义域名',
            placeholder: '例如：http://xxx.yyy.cloudcdn.cn，不推荐',
            value: value,
            name: '',
            needValidate: false);
      } else if (key == 'branch') {
        config = Config(
            label: '确认分支名',
            placeholder: '不填默认master，建议填写',
            value: value,
            name: '',
            needValidate: false);
      } else if (key == 'path') {
        config = Config(
            label: '指定存储路径',
            placeholder: '例如img/',
            value: value,
            name: '',
            needValidate: false);
      }
      config.name = key;
      configs.add(config);
    });
    setConfigs(configs);
  }

  @override
  String get pbType => ImageStorageType.gitee.name;

  @override
  String get title => 'Gitee图床';

  @override
  bool get isSupportManage => true;

  @override
  void handleManage() {
    context.go('/repo/${ImageStorageType.gitee.name}');
  }
}
