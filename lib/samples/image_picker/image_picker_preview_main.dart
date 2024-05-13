import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => _MediaModel(),
    child: const MaterialApp(
      home: _MyApp(),
    ),
  ));
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const _UploadView()));
              },
              child: const Icon(Icons.cloud_upload_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<_MediaModel>(
              builder: (context, mm, child) {
                return FloatingActionButton(
                  heroTag: 'preview',
                  onPressed: () async {
                    final XFile? pickedFile = await _picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    setState(() {
                      mediaFile = pickedFile;
                    });
                    mm.imagePath = pickedFile!.path;
                  },
                  child: const Icon(Icons.photo_outlined),
                );
              },
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
  const _UploadView({super.key});

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
        body: Consumer<_MediaModel>(
          builder: (context, mm, child) {
            return kIsWeb
                ? Image.network(
                    mm.imagePath,
                    width: 100,
                    height: 100,
                  )
                : Image.file(
                    File(mm.imagePath),
                    width: 100,
                    height: 100,
                  );
          },
        ));
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

class _MediaModel extends ChangeNotifier {
  String _imagePath = '';

  String get imagePath => _imagePath;

  set imagePath(String value) {
    _imagePath = value;
    notifyListeners();
  }
}
