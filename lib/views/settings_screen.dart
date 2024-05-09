import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/home_page_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String version = "";

  @override
  void initState() {
    super.initState();
    _getVersion();
  }

  void _getVersion() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      version = info.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(title: '设置'),
      body: ListView(
        children: <Widget>[
          // 图标面板
          SizedBox(
            width: double.infinity,
            height: 160.0,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/rocket_logo.jpg',
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text('v$version'),
                ),
              ],
            ),
          ),
          // 菜单列表
          ListTile(
            title: const Text('图床设置'),
            onTap: () {
              context.go('/settings/pb');
              // Application.router.navigateTo(context, Routes.settingPb,
              //     transition: TransitionType.cupertino);
            },
            trailing: const Icon(Icons.arrow_right),
          ),
          ListTile(
            title: const Text('PicGo设置'),
            onTap: () {
              // Application.router.navigateTo(context, Routes.settingPicgo,
              //     transition: TransitionType.cupertino);
            },
            trailing: const Icon(Icons.arrow_right),
          ),
          ListTile(
            title: const Text('关于Flutter-PicGo'),
            onTap: () {
              launchUrl(Uri.parse('https://github.com/hackycy/flutter-picgo'));
            },
            trailing: const Icon(Icons.arrow_right),
          ),
          ListTile(
            title: const Text('建议或报告问题'),
            onTap: () {
              launchUrl(Uri.parse(
                  'https://github.com/CrossEvol/flutter_ce_picgo/issues'));
            },
            trailing: const Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
  }
}
