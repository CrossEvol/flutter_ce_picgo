import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ce_picgo/bloc/image_cache/image_cache_bloc.dart';
import 'package:flutter_ce_picgo/bloc/image_manage/image_manage_bloc.dart';
import 'package:flutter_ce_picgo/bloc/settings/settings_bloc.dart';
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

  @override
  void initState() {
    super.initState();
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
              BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  return ListTile(
                    title: const Text('优先加载网络图片'),
                    trailing: CupertinoSwitch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      value: state.preferLoadNetworkImages,
                      onChanged: (value) {
                        context.read<SettingsBloc>().add(TogglePreferLoadNetworkImagesEvent(preferLoadNetworkImages: value));
                      },
                    ),
                  );
                },
              ),
              BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  return ListTile(
                    title: const Text('上传前重命名'),
                    trailing: CupertinoSwitch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      value: state.canRenameUploaded,
                      onChanged: (value) {
                        context.read<SettingsBloc>().add(ToggleCanRenameUploadedEvent(canRenameUploaded: value));
                      },
                    ),
                  );
                },
              ),
              BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  return ListTile(
                    title: const Text('时间戳重命名'),
                    trailing: CupertinoSwitch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      value: state.useTimestampForRenaming,
                      onChanged: (value) {
                        context.read<SettingsBloc>().add(ToggleUseTimestampForRenamingEvent(useTimestampForRenaming: value));
                      },
                    ),
                  );
                },
              ),
              BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  return ListTile(
                    title: const Text('开启上传提示'),
                    trailing: CupertinoSwitch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      value: state.useTipsForUploaded,
                      onChanged: (value) async {
                        if (value) {
                          /// Local Notification 请求权限
                          // await LocalNotificationUtil.getInstance()
                          //     .requestPermissions();
                        }
                        context.read<SettingsBloc>().add(ToggleUseTipsForUploadedEvent(useTipsForUploaded: value));
                      },
                    ),
                  );
                },
              ),
              BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  return ListTile(
                    title: const Text('仅删除本地图片'),
                    trailing: CupertinoSwitch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      value: state.shouldForceDelete,
                      onChanged: (value) {
                        context.read<SettingsBloc>().add(ToggleShouldForceDeleteEvent(shouldForceDelete: value));
                      },
                    ),
                  );
                },
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
                trailing: BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            color: state.needUpdate ? Colors.red : Colors.transparent,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    );
                  },
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

  _getLatestVersion() async {
    var latestVersionExpiry =
        prefs.getString(SharedPreferencesKeys.latestVersionExpiry.name) ??
            DateTime.now().subtract(Durations.short1).toString();
    var expiry = DateTime.parse(latestVersionExpiry);
    if (expiry.compareTo(DateTime.now()) > 0) {
      // var latestVersion = prefs.getString(SharedPreferencesKeys.latestVersion);
      return;
    }

    try {
      var latestVersion = await PicgoApi.getLatestVersion();
      prefs.setString(SharedPreferencesKeys.latestVersion.name, latestVersion);
      prefs.setString(SharedPreferencesKeys.latestVersionExpiry.name,
          DateTime.now().add(const Duration(hours: 24)).toString());
      PackageInfo info = await PackageInfo.fromPlatform();
      String version = info.buildNumber;
      if (version.compareTo(latestVersion) < 0) {
        context.read<SettingsBloc>().add(const ToggleNeedUpdateEvent(needUpdate: true));
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
      BlocProvider.of<ImageManageBloc>(context)
          .add(const ImageManageEventReset());
      fToast.showSuccessToast(text: '清除成功', duration: 1);
    } catch (e) {
      logger.e(e);
      fToast.showSuccessToast(text: '清除失败', duration: 1);
    }
  }
}