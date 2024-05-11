import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/router/router.dart';
import 'package:flutter_ce_picgo/utils/shared_preferences_ext.dart';

import 'database/db_interface.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await useSharedPreferences();

  dbProvider = DbInterface();
  await dbProvider.init();

  if (!kIsWeb && Platform.isWindows) {
    appWindow.size = const Size(375, 667);
  }

  runApp(const MyApp());

  if (!kIsWeb && Platform.isWindows) {
    appWindow.show();
    doWhenWindowReady(() {
      final win = appWindow;
      const initialSize = Size(375, 667);
      win.minSize = initialSize;
      win.maxSize = initialSize;
      win.size = initialSize;
      win.alignment = Alignment.center;
      win.title = "Flutter PicGo";
      win.show();
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter CE PicGo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
