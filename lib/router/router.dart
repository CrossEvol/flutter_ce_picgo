import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/views/album_screen.dart';
import 'package:flutter_ce_picgo/views/barcode_view.dart';
import 'package:flutter_ce_picgo/views/image_storage_settings_views/gitee_page/gitee_page.dart';
import 'package:flutter_ce_picgo/views/image_storage_settings_views/github/github_page.dart';
import 'package:flutter_ce_picgo/views/picgo_setting_views/picgo_setting_view.dart';
import 'package:flutter_ce_picgo/views/picgo_setting_views/theme_setting_view.dart';
import 'package:flutter_ce_picgo/views/settings_screen.dart';
import 'package:flutter_ce_picgo/views/upload_screen.dart';
import 'package:go_router/go_router.dart';

import '../views/home_screen.dart';
import '../views/image_storage_settings_views/image_storage_setting_screen.dart';
import '../views/repo_manage_screen.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'album',
          builder: (BuildContext context, GoRouterState state) {
            return const AlbumScreen();
          },
        ),
        GoRoute(
          path: 'settings',
          builder: (BuildContext context, GoRouterState state) {
            return const SettingsScreen();
          },
        ),
        GoRoute(
          path: 'settings/pb',
          builder: (BuildContext context, GoRouterState state) {
            return const ImageStorageSettingScreen();
          },
        ),
        GoRoute(
          path: 'settings/pb/github',
          builder: (BuildContext context, GoRouterState state) {
            return const GithubPage();
          },
        ),
        GoRoute(
          path: 'settings/pb/gitee',
          builder: (BuildContext context, GoRouterState state) {
            return const GiteePage();
          },
        ),
        GoRoute(
          path: 'upload',
          builder: (BuildContext context, GoRouterState state) {
            return const UploadScreen();
          },
        ),
        GoRoute(
          path: 'setting/picgo',
          builder: (BuildContext context, GoRouterState state) {
            return const PicGoSettingView();
          },
        ),
        GoRoute(
          path: 'setting/picgo/theme',
          builder: (BuildContext context, GoRouterState state) {
            return const ThemeSettingView();
          },
        ),
        GoRoute(
          path: 'barcode',
          builder: (BuildContext context, GoRouterState state) {
            return const BarCodeView();
          },
        ),
        GoRoute(
          path: 'repo/:type',
          builder: (BuildContext context, GoRouterState state) {
            return RepoManageScreen(
              storageType: state.pathParameters['type']!,
            );
          },
        ),
      ],
    ),
  ],
);
