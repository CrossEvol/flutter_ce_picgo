import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/utils/flutter_toast_ext.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/shared_preferences_keys.dart';
import '../../utils/shared_preferences_ext.dart';

class PicGoSettingView extends StatefulWidget {
  const PicGoSettingView({super.key});

  @override
  State<PicGoSettingView> createState() => _PicGoSettingViewState();
}

class _PicGoSettingViewState extends State<PicGoSettingView> {
  bool isUploadedRename = false;
  bool isTimestampRename = false;
  bool isUploadedTip = false;
  bool isForceDelete = false;
  bool isNeedUpdate = false;

  @override
  void initState() {
    super.initState();
    isUploadedRename =
        prefs?.getBool(SharedPreferencesKeys.settingIsUploadedRename) ?? false;
    isTimestampRename =
        prefs?.getBool(SharedPreferencesKeys.settingIsTimestampRename) ?? false;
    isUploadedTip =
        prefs?.getBool(SharedPreferencesKeys.settingIsUploadedTip) ?? false;
    isForceDelete =
        prefs?.getBool(SharedPreferencesKeys.settingIsForceDelete) ?? false;
    fToast.init(context);
    _getLatestVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PicGo设置'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (BuildContext context) {
          return ListView(
            children: <Widget>[
              ListTile(
                title: const Text('上传前重命名'),
                trailing: CupertinoSwitch(
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: isUploadedRename,
                  onChanged: (value) {
                    save(SharedPreferencesKeys.settingIsUploadedRename, value);
                    setState(() {
                      isUploadedRename = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('时间戳重命名'),
                trailing: CupertinoSwitch(
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: isTimestampRename,
                  onChanged: (value) {
                    save(SharedPreferencesKeys.settingIsTimestampRename, value);
                    setState(() {
                      isTimestampRename = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('开启上传提示'),
                trailing: CupertinoSwitch(
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: isUploadedTip,
                  onChanged: (value) async {
                    if (value) {
                      /// Local Notification 请求权限
                      // await LocalNotificationUtil.getInstance()
                      //     .requestPermissions();
                    }
                    save(SharedPreferencesKeys.settingIsUploadedTip, value);
                    setState(() {
                      isUploadedTip = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('仅删除本地图片'),
                trailing: CupertinoSwitch(
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: isForceDelete,
                  onChanged: (value) {
                    save(SharedPreferencesKeys.settingIsForceDelete, value);
                    setState(() {
                      isForceDelete = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('主题设置'),
                onTap: () {
                  context.go('/setting/picgo/theme');
                },
              ),
              ListTile(
                title: const Text('版本更新'),
                onTap: () {
                  _handleUpdateTap();
                },
                trailing: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Container(
                    width: 8,
                    height: 8,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                        color: isNeedUpdate ? Colors.red : Colors.transparent,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              ),
              ListTile(
                title: const Text('清除缓存'),
                onTap: () {
                  _handleClearCache();
                },
              )
            ],
          );
        },
      ),
    );
  }

  save(String key, bool value) async {
    prefs
        .setBool(key, value)
        .then((value) => fToast.showSuccessToast(text: '保存成功', duration: 1))
        .onError((error, stackTrace) =>
            fToast.showErrorToast(text: '保存失败', duration: 1));
  }

  _getLatestVersion() async {
    // try {
    //   Response res = await PicgoApi.getLatestVersion();
    //   PackageInfo info = await PackageInfo.fromPlatform();
    //   int version = int.parse(info.buildNumber);
    //   int remoteVersion = 0;
    //   if (Platform.isAndroid) {
    //     remoteVersion = int.parse('${res.data["Android"]["versionCode"]}');
    //   } else if (Platform.isIOS) {
    //     remoteVersion = int.parse('${res.data["iOS"]["versionCode"]}');
    //   }
    //   if (version < remoteVersion) {
    //     setState(() {
    //       isNeedUpdate = true;
    //     });
    //   }
    // } catch (e) {}
  }

  /// 无论有无更新都进行跳转，不允许放置蒲公英链接
  _handleUpdateTap() async {
    if (Platform.isAndroid) {
      launch('https://github.com/PicGo/flutter-picgo/releases');
    } else if (Platform.isIOS) {
      launch('https://apps.apple.com/cn/app/flutter-picgo/id1519714305');
    }
  }

  /// 清空缓存
  _handleClearCache() async {
    /// extended_image
    try {
      bool clear = await clearDiskCachedImages();
      if (clear) {
        // Toast.show('清除成功', context);
      } else {
        throw ('clear fail');
      }
    } catch (e) {
      // Toast.show('清除失败', context);
    }
  }
}
