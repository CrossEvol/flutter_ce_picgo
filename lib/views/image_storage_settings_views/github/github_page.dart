import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:go_router/go_router.dart';

import '../../../models/config.dart';
import '../../../models/github_config.dart';
import '../base_pb_page_state.dart';

class GithubPage extends StatefulWidget {
  const GithubPage({super.key});

  @override
  BasePBSettingPageState<GithubPage> createState() => _GithubPageState();
}

class _GithubPageState extends BasePBSettingPageState<GithubPage> {
  @override
  onLoadConfig(String config) {
    List<Config> configs = [];
    Map<String, dynamic> map;
    if (config.isEmpty) {
      map = GithubConfig.none().toJson();
    } else {
      map = GithubConfig.fromJson(json.decode(config)).toJson();
    }
    map.forEach((key, value) {
      late Config config;
      if (key == 'repo') {
        config = Config(
            label: '设定仓库名',
            placeholder: '例如 hackycy/picBed',
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
            placeholder: '例如：http://xxx.yyy.cloudcdn.cn',
            value: value,
            name: '',
            needValidate: false);
      } else if (key == 'branch') {
        config = Config(
            label: '确认分支名',
            placeholder: '例如 master',
            value: value,
            needValidate: true,
            name: '');
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
  String get pbType => ImageStorageType.github;

  @override
  String get title => 'Github图床';

  @override
  bool get isSupportManage => true;

  @override
  handleManage() {
    context.go('');
    // Application.router.navigateTo(context,
    //     '${Routes.settingPbGitubRepo}?path=${Uri.encodeComponent("/")}',
    //     transition: TransitionType.cupertino);
  }
}
