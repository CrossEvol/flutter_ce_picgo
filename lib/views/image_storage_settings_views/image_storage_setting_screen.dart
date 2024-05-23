import 'dart:io';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ce_picgo/views/image_storage_settings_views/image_storage_setting_presenter.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../models/image_storage_setting.dart';
import '../../utils/flutter_toast_ext.dart';

class ImageStorageSettingScreen extends StatefulWidget {
  const ImageStorageSettingScreen({super.key});

  @override
  State<ImageStorageSettingScreen> createState() =>
      _ImageStorageSettingScreenState();
}

class _ImageStorageSettingScreenState extends State<ImageStorageSettingScreen>
    implements ImageStorageSettingPageContract {
  List<ImageStorageSetting> _settings = [];
  String _errorTip = '暂无图床数据';

  late ImageStorageSettingPagePresenter _presenter;

  _ImageStorageSettingScreenState() {
    _presenter = ImageStorageSettingPagePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _presenter.doLoadPb();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('图床设置'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(IconData(0xe685, fontFamily: 'iconfont')),
            onPressed: () async {
              await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('关于使用二维码扫描说明'),
                      content: const Text(
                          '该功能是为了方便使用了PicGo PC端的用户。\n\n在PC端已经配置好的用户可以使用PicGo新版的生成图床配置二维码功能。\n\n然后使用Flutter-PicGo直接扫描即可进行配置转换。'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('已了解，去扫描'),
                          onPressed: () {
                            Navigator.pop(context);
                            _scanCode();
                          },
                        )
                      ],
                    );
                  });
            },
          ),
        ],
      ),
      body: _settings.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: Text(
                  _errorTip,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          : ListView.builder(
              itemCount: _settings.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_settings[index].name),
                  onTap: () {
                    context.go(_settings[index].path);
                    // Application.router.navigateTo(
                    //     context, _settings[index].path,
                    //     transition: TransitionType.cupertino);
                  },
                  trailing: const Icon(Icons.arrow_right),
                );
              },
            ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(left: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              tooltip: '扫描配置',
              heroTag: 'scan',
              backgroundColor: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                context.go('/barcode');
              },
              child: const Icon(Icons.document_scanner_sharp),
            ),
            FloatingActionButton(
              tooltip: '导出配置',
              heroTag: 'export',
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                _presenter.doExportConfig();
              },
              child: const Icon(IconData(0xe62c, fontFamily: 'iconfont')),
            ),
          ],
        ),
      ),
    );
  }

  /// 扫描二维码
  Future<void> _scanCode() async {
    if (kIsWeb) {
      return fToast.showErrorToast(text: 'ScanCode UnSupport Web!');
    } else if (Platform.isWindows) {
      return fToast.showErrorToast(text: 'ScanCode UnSupport Desktop!');
    }
    if ((await Permission.camera.request()).isGranted) {
      var result = await BarcodeScanner.scan();
      if (result.type == ResultType.Barcode) {
        _presenter.doTransferJson(result.rawContent);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('警告'),
                content: Text('无法正常访问，因为没有权限'),
                actions: <Widget>[
                  TextButton(
                    child: Text('去设置'),
                    onPressed: () {
                      openAppSettings();
                    },
                  ),
                ],
              );
            });
      }
    }
  }

  @override
  void loadError(String errorMsg) {
    setState(() {
      _errorTip = errorMsg;
    });
  }

  @override
  void loadPb(List<ImageStorageSetting> settings) {
    setState(() {
      _settings = settings;
    });
  }

  @override
  void transferError(String e) {
    fToast.showErrorToast(text: e);
  }

  @override
  void transferSuccess() {
    fToast.showSuccessToast(text: '配置已转换');
  }

  @override
  void exportConfigSuccess(String config) {
    Clipboard.setData(ClipboardData(text: config));
    fToast.showSuccessToast(text: '已将配置导出至剪切板');
  }

  @override
  void exportConfigError(String message) {
    fToast.showErrorToast(text: '导出失败 : $message');
  }
}
