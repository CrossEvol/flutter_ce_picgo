import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:flutter_ce_picgo/utils/flutter_toast_ext.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:flutter_ce_picgo/utils/shared_preferences_ext.dart';

import '../../models/config.dart';

/// 图床设置页面基类，使用该类则需要遵循规则，可自动将数据转化成配置页面，自动生成输入框等以及保存方法
abstract class BasePBSettingPageState<T extends StatefulWidget>
    extends State<T> {
  Map<String, TextEditingController> controllers = {};
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    fToast.init(context);
    loadConfig();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: isSupportManage
            ? <Widget>[
                IconButton(
                  icon: const Icon(IconData(0xe6ab, fontFamily: 'iconfont')),
                  onPressed: () {
                    if (validate) {
                      handleManage();
                    }
                  },
                )
              ]
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            // 配置列表根据List Configs自动生成
            _generateConfigRow(),
            const SizedBox(height: 10),
            // 保存以及设置默认图床按钮
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.primary)),
                      child: const Text('保存'),
                      onPressed: () {
                        if (validate) {
                          save();
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.secondary)),
                      child: const Text('设为默认图床'),
                      onPressed: () {
                        if (validate) {
                          setDefaultPB();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                tip,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[400]),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 生成配置输入框
  Widget _generateConfigRow() {
    if (configs == null || configs.isEmpty) {
      return const Column(
        children: <Widget>[
          SizedBox(height: 20),
          Center(
            child: Text('无需配置'),
          )
        ],
      );
    }
    _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Column(
        children: configs.asMap().keys.map((i) {
          if (configs[i].name.isEmpty) {
            throw ArgumentError('name must be not null');
          }
          // new TextEditingController
          TextEditingController controller =
              TextEditingController(text: configs[i].value);
          // add
          controllers[configs[i].name] = controller;
          // text TextFormField
          return Column(
            children: <Widget>[
              SizedBox(height: i == 0 ? 0 : 5),
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: configs[i].label,
                  hintText: configs[i].placeholder,
                ),
                keyboardType: TextInputType.text,
                validator: configs[i].needValidate
                    ? (value) {
                        if (value == null || value == '') {
                          return '必填项不能为空';
                        }
                        return null;
                      }
                    : null,
              )
            ],
          );
        }).toList(),
      ),
    );
  }

  List<Config> configs = [];

  // 子类主动调用
  setConfigs(List<Config> configs) {
    if (configs != null) {
      setState(() {
        this.configs = configs;
      });
    }
  }

  /// 当前图床类型
  String get pbType;

  /// 子类AppBar Title
  String get title;

  /// 子类根据config String自定义需求
  onLoadConfig(String config);

  /// 表单验证
  bool get validate => _formKey?.currentState?.validate() ?? true;

  /// 子类可重写更改文本
  String get tip => '请先保存配置后再进行管理';

  /// 是否支持管理
  bool get isSupportManage => false;

  /// 子类重写，点击IconButton回调方法
  void handleManage() {}

  /// 保存配置
  save() async {
    if (pbType.isEmpty) {
      return;
    }
    try {
      Map<String, dynamic> configMap = {};
      controllers.forEach((key, value) {
        configMap[key] = value.text.trim();
      });
      String configStr = json.encode(configMap);
      try {
        await dbProvider.saveImageStorageSettingConfig(
            type: pbType, config: configStr);
        fToast.showSuccessToast(text: '保存成功');
      } catch (e) {
        logger.e(e);
        fToast.showErrorToast(text: '保存失败');
      }
    } catch (e) {
      fToast.showErrorToast(text: '$e');
    }
  }

  /// 加载图床配置
  loadConfig() async {
    try {
      var configStr =
          await dbProvider.getImageStorageSettingConfig(type: pbType);
      onLoadConfig(configStr);
    } catch (e) {
      fToast.showErrorToast(text: '$e');
    }
  }

  /// 配置默认图床
  setDefaultPB() async {
    if (pbType.isNotEmpty) {
      await prefs.setDefaultStorage(pbType);
      fToast.showSuccessToast(text: '设置成功');
    }
  }
}
