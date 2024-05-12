import 'dart:io';
import 'dart:math';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/router/router.dart';
import 'package:flutter_ce_picgo/utils/shared_preferences_ext.dart';

import 'database/db_interface.dart';
import 'utils/logger_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initLogger();

  logger.i('configure the usage of SharedPreferences...');
  await useSharedPreferences();

  logger.i('configure the database provider...');
  dbProvider = DbInterface();
  await dbProvider.init();

  if (!kIsWeb && Platform.isWindows) {
    appWindow.size = const Size(375, 667);
    logger.i('Platform is windows, configure the appWindow successfully...');
  }else{
    logger.i('Platform is not windows, unnecessary to configure the appWindow...');
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
