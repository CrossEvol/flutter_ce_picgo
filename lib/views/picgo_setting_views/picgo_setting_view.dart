import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ce_picgo/bloc/image_cache/image_cache_bloc.dart';
import 'package:flutter_ce_picgo/utils/flutter_toast_ext.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/picgo_api.dart';
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
                  handleUpdateTap();
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
              BlocConsumer<ImageCacheBloc, ImageCacheState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return ListTile(
                    title: const Text('清除缓存'),
                    onTap: () {
                      handleClearCache();
                    },
                  );
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
    var latestVersionExpiry =
        prefs.getString(SharedPreferencesKeys.latestVersionExpiry);
    var expiry = DateTime.parse(latestVersionExpiry!);
    if (expiry.compareTo(DateTime.now()) > 0) {
      // var latestVersion = prefs.getString(SharedPreferencesKeys.latestVersion);
      return;
    }

    try {
      var latestVersion = await PicgoApi.getLatestVersion();
      prefs.setString(SharedPreferencesKeys.latestVersion, latestVersion);
      prefs.setString(SharedPreferencesKeys.latestVersionExpiry,
          DateTime.now().add(const Duration(hours: 24)).toString());
      PackageInfo info = await PackageInfo.fromPlatform();
      String version = info.buildNumber;
      if (version.compareTo(latestVersion) < 0) {
        setState(() {
          isNeedUpdate = true;
        });
      }
    } catch (e) {
      logger.e(e);
    }
  }

  /// 无论有无更新都进行跳转，不允许放置蒲公英链接
  handleUpdateTap() async {
    if (kIsWeb) {
      launchUrl(
          Uri.parse('https://github.com/CrossEvol/flutter_ce_picgo/releases'));
    } else {
      if (Platform.isAndroid || Platform.isWindows) {
        launchUrl(Uri.parse(
            'https://github.com/CrossEvol/flutter_ce_picgo/releases'));
      } else if (Platform.isIOS) {
        throw UnimplementedError('UnSupport');
        // launchUrl(Uri.parse('https://apps.apple.com/cn/app/flutter-picgo/id1519714305'));
      }
    }
  }

  /// 清空缓存
  handleClearCache() async {
    try {
      BlocProvider.of<ImageCacheBloc>(context)
          .add(const ImageCacheEventClear());
      fToast.showSuccessToast(text: '清除成功', duration: 1);
    } catch (e) {
      logger.e(e);
      fToast.showSuccessToast(text: '清除失败', duration: 1);
    }
  }
}
