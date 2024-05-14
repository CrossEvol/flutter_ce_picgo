import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/models/uploaded_image.dart';
import 'package:flutter_ce_picgo/samples/preview_then_upload/upload_image_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../database/db_interface.dart';
import '../../models/enums/uploaded_state.dart';
import '../../utils/logger_util.dart';
import '../../utils/shared_preferences_ext.dart';
import '../handle_upload/handle_upload_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initLogger();

  logger.i('configure the usage of SharedPreferences...');
  await useSharedPreferences();

  logger.i('configure the database provider...');
  dbProvider = DbInterface();
  await dbProvider.init();
  uploadedImages = getUploadedImages();

  if (!kIsWeb && Platform.isWindows) {
    appWindow.size = const Size(375, 667);
    logger.i('Platform is windows, configure the appWindow successfully...');
  } else {
    logger.i(
        'Platform is not windows, unnecessary to configure the appWindow...');
  }
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) => UploadImageBloc()..add(UploadImageEventLoad()))
    ],
    child: const MaterialApp(
      home: _MyApp(),
    ),
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

class _MyApp extends StatefulWidget {
  const _MyApp({super.key});

  @override
  State<_MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {
  XFile? mediaFile;
  final ImagePicker _picker = ImagePicker();
  String? _retrieveDataError;

  _MyAppState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyApp'),
      ),
      body: Center(
        child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
            ? FutureBuilder<void>(
                future: retrieveLostData(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Text(
                        'You have not yet picked an image.',
                        textAlign: TextAlign.center,
                      );
                    case ConnectionState.done:
                      return _previewImage();
                    case ConnectionState.active:
                      if (snapshot.hasError) {
                        return Text(
                          'Pick image/video error: ${snapshot.error}}',
                          textAlign: TextAlign.center,
                        );
                      } else {
                        return const Text(
                          'You have not yet picked an image.',
                          textAlign: TextAlign.center,
                        );
                      }
                  }
                },
              )
            : _previewImage(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              heroTag: 'upload',
              onPressed: () {
                if (mediaFile == null) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text('Empty Media'),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text('confirm'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ));
                  return;
                }
                context.read<UploadImageBloc>().add(UploadImageEventAdd(
                    uploadedImage: UploadedImage(
                        id: 0,
                        filepath: mediaFile!.path,
                        storageType: ImageStorageType.github,
                        url: '',
                        name: '${DateTime.now().microsecondsSinceEpoch}.jpg',
                        state: UploadState.uploading,
                        createTime: DateTime.now(),
                        uploadTime: DateTime.now())));
                setState(() {
                  mediaFile = null;
                });
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const _UploadView()));
              },
              child: const Icon(Icons.cloud_upload_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              heroTag: 'preview',
              onPressed: () async {
                final XFile? pickedFile = await _picker.pickImage(
                  source: ImageSource.gallery,
                );
                setState(() {
                  mediaFile = pickedFile;
                });
              },
              child: const Icon(Icons.photo_outlined),
            ),
          ),
        ],
      ),
    );
  }

  Widget _previewImage() {
    return mediaFile != null
        ? Semantics(
            child: kIsWeb
                ? Image.network(mediaFile!.path)
                : Image.file(File(mediaFile!.path)))
        : const Text(
            'You have not yet picked an image.',
            textAlign: TextAlign.center,
          );
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        return;
      } else {
        setState(() {
          if (response.files == null) {
            mediaFile = response.file;
          } else {
            mediaFile = response.files?.first;
          }
        });
      }
    } else {
      _retrieveDataError = response.exception!.code;
    }
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

class _UploadView extends StatefulWidget {
  const _UploadView();

  @override
  State<_UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<_UploadView> {
  _UploadViewState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UploadView'),
      ),
      body: BlocBuilder<UploadImageBloc, UploadImageState>(
        builder: (context, state) {
          if (state.images.isEmpty) {
            return const Center(child: Text('Empty List'));
          }

          return ListView.builder(
              itemCount: state.images.length,
              itemBuilder: (context, index) {
                var image = state.images[index];
                if (image.state == UploadState.uploading) {
                  logger.w('start a delayed task...');
                  Future.delayed(const Duration(seconds: 3), () {
                    logger.w('complete a delayed task...');
                    context.read<UploadImageBloc>().add(UploadImageEventUpdate(
                        filepath: image.filepath,
                        state: UploadState.completed));
                  });
                }
                return UploadItem(uploadedImage: state.images[index]);
              });
        },
      ),
    );
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
    path = !kIsWeb ? widget.uploadedImage.filepath : widget.uploadedImage.url;
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
