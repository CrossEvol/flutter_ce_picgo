import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ce_picgo/database/db_provider.dart';
import 'package:flutter_ce_picgo/views/image_storage_settings_views/image_storage_setting_presenter.dart';

import '../../models/image_storage_setting.dart';

class ImageStorageSettingScreen extends StatefulWidget {
  const ImageStorageSettingScreen({super.key});

  @override
  State<ImageStorageSettingScreen> createState() => _ImageStorageSettingScreenState();
}

class _ImageStorageSettingScreenState extends State<ImageStorageSettingScreen>
    implements ImageStorageSettingPageContract {
  List<PBSetting> _settings = [];
  String _errorTip = '暂无图床数据';

  late ImageStorageSettingPagePresenter _presenter;

  _ImageStorageSettingScreenState() {
    _presenter = ImageStorageSettingPagePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _presenter.doLoadPb();
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
                    // Application.router.navigateTo(
                    //     context, _settings[index].path,
                    //     transition: TransitionType.cupertino);
                  },
                  trailing: const Icon(Icons.arrow_right),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        tooltip: '导出配置',
        onPressed: () {
          _presenter.doExportConfig();
        },
        child: const Icon(IconData(0xe62c, fontFamily: 'iconfont')),
      ),
    );
  }

  /// 扫描二维码
  _scanCode() async {
    // var status = await PermissionUtils.requestCemera();
    // if (status == PermissionStatus.granted) {
    //   var result = await BarcodeScanner.scan();
    //   if (result.type == ResultType.Barcode) {
    //     _presenter.doTransferJson(result.rawContent);
    //   }
    // } else {
    //   PermissionUtils.showPermissionDialog(context);
    // }
  }

  @override
  void loadError(String errorMsg) {
    setState(() {
      _errorTip = errorMsg;
    });
  }

  @override
  void loadPb(List<PBSetting> settings) {
    setState(() {
      _settings = settings;
    });
  }

  @override
  void transferError(String e) {
    // Toast.show(e, context, duration: Toast.LENGTH_LONG);
  }

  @override
  void transferSuccess() {
    // Toast.show('配置已转换', context);
  }

  @override
  void exportConfigSuccess(String config) {
    Clipboard.setData(ClipboardData(text: config));
    // Toast.show('已将配置导出至剪切板', context);
  }

  @override
  void exportConfigError(String message) {
    // Toast.show('导出失败 : $message', context);
  }
}
