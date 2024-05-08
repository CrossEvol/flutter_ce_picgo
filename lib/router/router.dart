import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/views/AlbumScreen.dart';
import 'package:flutter_ce_picgo/views/SettingsScreen.dart';
import 'package:go_router/go_router.dart';

import '../views/HomeScreen.dart';

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
      ],
    ),
  ],
);
