import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/models/uploaded_image.dart';

import '../../database/db_interface.dart';
import '../../utils/logger_util.dart';
import '../../utils/shared_preferences_ext.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initLogger();

  logger.i('configure the usage of SharedPreferences...');
  await useSharedPreferences();

  logger.i('configure the database provider...');
  dbProvider = DbInterface();
  // await dbProvider.init();

  if (!kIsWeb && Platform.isWindows) {
    appWindow.size = const Size(375, 667);
    logger.i('Platform is windows, configure the appWindow successfully...');
  } else {
    logger.i(
        'Platform is not windows, unnecessary to configure the appWindow...');
  }

  runApp(const MaterialApp(
    home: MyApp(),
  ));

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyApp'),
        ),
        body: const Text('MyApp'));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class UploadItem extends StatefulWidget {
  final UploadedImage uploadedImage;

  const UploadItem({super.key, required this.uploadedImage});

  @override
  State<UploadItem> createState() => _UploadItemState();
}

class _UploadItemState extends State<UploadItem> {
  late String name;
  late UploadState uploadState;
  late String path;

  _UploadItemState();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 50,
        width: 50,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(8)),
          child: kIsWeb
              ? Image.network(
                  path,
                  // mm.imagePath,
                  width: 50,
                  height: 50,
                )
              : Image.file(
                  File(path),
                  // File(mm.imagePath),
                  width: 50,
                  height: 50,
                ),
        ),
      ),
      title: Text(
        name,
        // widget.rename,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textWidthBasis: TextWidthBasis.parent,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      subtitle: Text(
        '上传状态：${uploadState.toText()}',
        maxLines: 1,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: buildStateTip(),
      onTap: () {
        // _handleTap();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    name = widget.uploadedImage.name;
    uploadState = widget.uploadedImage.state;
    path = widget.uploadedImage.filepath.isNotEmpty
        ? widget.uploadedImage.filepath
        : widget.uploadedImage.url;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildStateTip() {
    switch (uploadState) {
      case UploadState.uploading:
      case UploadState.saving:
        return const SizedBox(
          width: 16,
          height: 16,
          child: CupertinoActivityIndicator(),
        );
      case UploadState.completed:
        return const Icon(
          Icons.done,
          size: 16,
          color: Colors.green,
        );
      case UploadState.uploadFailed:
      case UploadState.saveFailed:
      default:
        return GestureDetector(
          child: const Icon(
            Icons.error,
            color: Colors.red,
            size: 16,
          ),
          onTap: () {
            // _startUpload();
          },
        );
    }
  }
}

extension on UploadState {
  String toText() {
    return switch (this) {
      UploadState.uploading => '上传中',
      UploadState.saving => '保存中',
      UploadState.completed => '已完成',
      UploadState.uploadFailed => '上传失败',
      UploadState.saveFailed => '保存失败',
      _ => '未知'
    };
  }
}
