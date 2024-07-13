import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ce_picgo/bloc/image_cache/image_cache_bloc.dart';
import 'package:flutter_ce_picgo/bloc/upload_image/upload_image_bloc.dart';
import 'package:flutter_ce_picgo/utils/flutter_toast_ext.dart';
import 'package:flutter_ce_picgo/widgets/home_page_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:provider/provider.dart';

import '../constants/image_storage_type.dart';
import '../models/enums/uploaded_state.dart';
import '../models/uploaded_image.dart';
import '../utils/faker_util.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _mediaFileList;
  bool isVideo = false; // unnecessary field

  String? _retrieveDataError;
  dynamic _pickImageError;

  void _setImageFileListFromFile(XFile? value) {
    _mediaFileList = value == null ? null : [...?_mediaFileList, value!];
  }

  _AlbumScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomePageAppBar(
          title: '相册',
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                onPressed: () async {
                  if (_mediaFileList == null) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                                title: const Text('AlertDialog Title'),
                                content: const SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text('This is a demo alert dialog.'),
                                      Text(
                                          'Would you like to approve of this message?'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Confirm'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      context.go('/upload');
                                    },
                                  ),
                                ]));
                    return;
                  } else {
                    if (_mediaFileList!.isNotEmpty) {
                      _mediaFileList?.forEach((element) {
                        context.read<ImageCacheBloc>().add(ImageCacheEventPut(
                            key: element.path, xFile: element));
                      });
                      context.read<UploadImageBloc>().add(UploadImageEventAdd(
                          uploadedImages: _mediaFileList!
                              .map((e) => UploadedImage(
                                  id: 0,
                                  filepath: e.path,
                                  storageType: ImageStorageType.github.name,
                                  url: '',
                                  name:
                                      '${DateTime.now().microsecondsSinceEpoch}-${faker.lorem.word()}.jpg',
                                  state: UploadState.uploading,
                                  createTime: DateTime.now(),
                                  uploadTime: DateTime.now()))
                              .toList()));
                    }
                  }

                  fToast.showSuccessToast(
                      text: 'Waiting...',
                      duration: _mediaFileList != null
                          ? _mediaFileList!.length ~/ 2
                          : 2);
                  Future.delayed(
                      Duration(
                          seconds: _mediaFileList != null
                              ? _mediaFileList!.length ~/ 2
                              : 0), () {
                    setState(() {
                      _mediaFileList = null;
                    });
                    context.go('/upload');
                  });
                },
                heroTag: 'upload',
                tooltip: 'Upload Image to cloud',
                child: Icon(
                  Icons.cloud_upload_outlined,
                  size: 28.0,
                  color: Colors.white,
                  weight: FontWeight.w700.value.toDouble(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                onPressed: () async {
                  try {
                    final XFile? pickedFile = await _picker.pickImage(
                      source: ImageSource.gallery,
                      // maxWidth: maxWidth,
                      // maxHeight: maxHeight,
                      // imageQuality: quality,
                    );
                    setState(() {
                      _setImageFileListFromFile(pickedFile);
                    });
                  } catch (e) {
                    setState(() {
                      _pickImageError = e;
                    });
                  }
                },
                heroTag: 'preview',
                tooltip: 'Pick Image from gallery',
                child: Icon(
                  Icons.photo_outlined,
                  size: 28.0,
                  color: Colors.white,
                  weight: FontWeight.w700.value.toDouble(),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
              ? FutureBuilder<void>(
                  future: retrieveLostData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<void> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Text(
                          'You have not yet picked an image.',
                          textAlign: TextAlign.center,
                        );
                      case ConnectionState.done:
                        return _handlePreview();
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
              : _handlePreview(),
        ));
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_mediaFileList != null) {
      return Semantics(
        label: 'image_picker_example_picked_images',
        child: ListView.builder(
          key: UniqueKey(),
          itemBuilder: (BuildContext context, int index) {
            final String? mime = lookupMimeType(_mediaFileList![index].path);

            // Why network for web?
            // See https://pub.dev/packages/image_picker_for_web#limitations-on-the-web-platform
            return Semantics(
              label: 'image_picker_example_picked_image',
              child: kIsWeb
                  ? Image.network(_mediaFileList![index].path)
                  : (mime == null || mime.startsWith('image/')
                      ? Image.file(
                          File(_mediaFileList![index].path),
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            return const Center(
                                child:
                                    Text('This image type is not supported'));
                          },
                        )
                      : _buildInlineVideoPlayer(index)),
            );
          },
          itemCount: _mediaFileList!.length,
        ),
      );
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Widget _buildInlineVideoPlayer(int index) {
    return const Center(child: Text('Video Upload has not been implemented!'));
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
      } else {
        isVideo = false;
        setState(() {
          if (response.files == null) {
            _setImageFileListFromFile(response.file);
          } else {
            _mediaFileList = response.files;
          }
        });
      }
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  Widget _handlePreview() {
    if (isVideo) {
      return _previewVideo();
    } else {
      return _previewImages();
    }
  }

  @override
  void initState() {
    super.initState();
    fToast.init(context);
  }

  @override
  void dispose() {
    fToast.removeQueuedCustomToasts();
    super.dispose();
  }

  Widget _previewVideo() {
    throw UnimplementedError('Preview Video has not been implemented.');
  }
}
