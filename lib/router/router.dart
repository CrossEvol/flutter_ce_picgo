import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/views/album_screen.dart';
import 'package:flutter_ce_picgo/views/handle_upload_page.dart';
import 'package:flutter_ce_picgo/views/image_storage_settings_views/gitee_page/gitee_page.dart';
import 'package:flutter_ce_picgo/views/image_storage_settings_views/github/github_page.dart';
import 'package:flutter_ce_picgo/views/settings_screen.dart';
import 'package:go_router/go_router.dart';

import '../views/home_screen.dart';
import '../views/image_storage_settings_views/image_storage_setting_screen.dart';

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
            return const HandleUploadPage();
          },
        ),
      ],
    ),
  ],
);
