import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ce_picgo/bloc/image_cache/image_cache_bloc.dart';
import 'package:flutter_ce_picgo/bloc/theme_state/theme_bloc.dart';
import 'package:flutter_ce_picgo/bloc/upload_image/upload_image_bloc.dart';
import 'package:flutter_ce_picgo/models/enums/theme_mode.dart';
import 'package:flutter_ce_picgo/router/router.dart';
import 'package:flutter_ce_picgo/utils/shared_preferences_ext.dart';

import 'database/db_interface.dart';
import 'styles/theme_data_style.dart';
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
  } else {
    logger.i(
        'Platform is not windows, unnecessary to configure the appWindow...');
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => UploadImageBloc()..add(UploadImageEventLoad())),
        BlocProvider(create: (_) => ImageCacheBloc()),
        BlocProvider(create: (_) => ThemeBloc()),
      ],
      child: BlocConsumer<ThemeBloc, ThemeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Flutter CE PicGo',
            theme: ThemeDataStyle.light,
            darkTheme: ThemeDataStyle.dark,
            themeMode:
                BlocProvider.of<ThemeBloc>(context).state.themeMode.themeMode(),
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
