import 'dart:io';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ce_picgo/bloc/image_cache/image_cache_bloc.dart';
import 'package:flutter_ce_picgo/bloc/upload_image/upload_image_bloc.dart';
import 'package:flutter_ce_picgo/constants/shared_preferences_keys.dart';
import 'package:flutter_ce_picgo/utils/env_util.dart';
import 'package:flutter_ce_picgo/utils/flutter_toast_ext.dart';
import 'package:flutter_ce_picgo/utils/shared_preferences_ext.dart';
import 'package:flutter_ce_picgo/widgets/home_page_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:provider/provider.dart';

import '../constants/image_storage_type.dart';
import '../models/enums/uploaded_state.dart';
import '../models/uploaded_image.dart';
import '../utils/faker_util.dart';

class DecoratedXFile {
  final XFile file;
  String name;

  String get path => file.path;

  DecoratedXFile({required this.file, required this.name});
}

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  final ImagePicker _picker = ImagePicker();
  List<DecoratedXFile>? _mediaFileList;
  bool isVideo = false;
  final _validImageExtensions = [
    '.jpg',
    '.jpeg',
    '.png',
    '.gif',
    '.bmp',
    '.webp'
  ];

  String? _retrieveDataError;
  dynamic _pickImageError;

  void _setImageFileListFromFile(XFile? value) {
    if (value != null) {
      addMediaFile([value]);
    }
  }

  void _updateFileName(int index, String newName) {
    setState(() {
      newName = newName.trim();
      bool hasValidExtension =
          _validImageExtensions.any((ext) => newName.endsWith(ext));

      if (!hasValidExtension) {
        newName += '.jpg';
      }

      _mediaFileList![index].name = newName;
    });
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
                            key: element.file.path, xFile: element.file));
                      });
                      context.read<UploadImageBloc>().add(UploadImageEventAdd(
                          uploadedImages: _mediaFileList!
                              .map((e) => UploadedImage(
                                  id: 0,
                                  filepath: e.path,
                                  storageType: ImageStorageType.github.name,
                                  url: '',
                                  name: e.name,
                                  state: UploadState.uploading,
                                  createTime: DateTime.now(),
                                  uploadTime: DateTime.now()))
                              .toList()));
                    }
                  }

                  // Use Builder to get the correct context
                  Builder(
                    builder: (BuildContext context) {
                      fToast.showSuccessToast(
                        text: 'Waiting...',
                        duration: _mediaFileList != null
                            ? _mediaFileList!.length ~/ 2
                            : 2,
                      );
                      return Container(); // Return an empty container
                    },
                  );

                  Future.delayed(
                      Duration(
                          seconds: _mediaFileList != null
                              ? _mediaFileList!.length ~/ 2
                              : 0), () {
                    setState(() {
                      _mediaFileList = null;
                    });
                  });
                  context.go('/upload');
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
                  await _pickImage();
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
                          return Column(
                            children: [
                              Image.asset(
                                  'assets/images/empty_upload_files.png',
                                  fit: BoxFit.cover),
                              const Text(
                                'You have not yet picked an image.',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          );
                        }
                    }
                  },
                )
              : _handlePreview(),
        ));
  }

  Future<void> _pickImage() async {
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
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_mediaFileList != null) {
      return Column(
        children: [
          Expanded(
            child: Semantics(
              label: 'image_picker_example_picked_images',
              child: ListView.builder(
                key: UniqueKey(),
                itemBuilder: (BuildContext context, int index) {
                  final String? mime =
                      lookupMimeType(_mediaFileList![index].path);

                  return Semantics(
                    label: 'image_picker_example_picked_image',
                    child: kIsWeb
                        ? Image.network(_mediaFileList![index].path)
                        : (mime == null || mime.startsWith('image/')
                            ? ImagePreviewWidget(
                                file: _mediaFileList![index],
                                onNameChanged: (newName) =>
                                    _updateFileName(index, newName),
                              )
                            : _buildInlineVideoPlayer(index)),
                  );
                },
                itemCount: _mediaFileList!.length,
              ),
            ),
          ),
          isDesktop()
              ? DropTargetWidget(
                  onTap: _pickImage,
                  onFilesDropped: (files) {
                    setState(() {
                      addMediaFile(files);
                    });
                  },
                )
              : Container(),
        ],
      );
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return isDesktop()
          ? Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  DropTargetWidget(
                    onTap: _pickImage,
                    onFilesDropped: (files) {
                      setState(() {
                        addMediaFile(files);
                      });
                    },
                  ),
                  const Text(
                    'You have not yet picked an image.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : const Text(
              'You have not yet picked an image.',
              textAlign: TextAlign.center,
            );
    }
  }

  void addMediaFile(List<XFile> files) {
    _mediaFileList = _mediaFileList ?? [];
    _mediaFileList!.addAll(
        files.map((file) => DecoratedXFile(file: file, name: file.name)));
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
            _mediaFileList = response.files
                ?.map((file) => DecoratedXFile(file: file, name: file.name))
                .toList();
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

class ImagePreviewWidget extends StatefulWidget {
  final DecoratedXFile file;
  final ValueChanged<String> onNameChanged;

  const ImagePreviewWidget(
      {super.key, required this.file, required this.onNameChanged});

  @override
  State<ImagePreviewWidget> createState() => ImagePreviewWidgetState();
}

class ImagePreviewWidgetState extends State<ImagePreviewWidget> {
  bool _isEditing = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.file.name;
  }

  @override
  Widget build(BuildContext context) {
    var canRename =
        prefs.getBool(SharedPreferencesKeys.settingIsUploadedRename.name) ??
            false;
    if (!canRename) {
      return Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                _controller.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.file(
              File(widget.file.path),
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return const Center(
                    child: Text('This image type is not supported'));
              },
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
      child: Column(
        children: [
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                _isEditing = true;
              });
            },
            child: _isEditing
                ? Focus(
                    onFocusChange: (hasFocus) {
                      if (!hasFocus) {
                        setState(() {
                          widget.onNameChanged(_controller.text);
                          _isEditing = false;
                        });
                      }
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            maxLines: null,
                            onSubmitted: (value) {
                              setState(() {
                                _isEditing = false;
                              });
                              widget.onNameChanged(value);
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.generating_tokens,
                            color: Colors.lightBlue,
                          ),
                          onPressed: () {
                            setState(() {
                              var randomName = '${faker.lorem.word()}.jpg';
                              _controller.text = randomName;
                              _isEditing = false;
                            });
                            widget.onNameChanged(_controller.text);
                          },
                        ),
                      ],
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      _controller.text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
          Image.file(
            File(widget.file.path),
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              return const Center(
                  child: Text('This image type is not supported'));
            },
          ),
        ],
      ),
    );
  }
}

class DropTargetWidget extends StatelessWidget {
  final Function(List<XFile>) onFilesDropped;
  final Function() onTap;

  const DropTargetWidget(
      {super.key, required this.onFilesDropped, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: DropTarget(
        onDragDone: (detail) async {
          if (detail.files.isNotEmpty) {
            onFilesDropped(detail.files);
          }
        },
        onDragUpdated: (details) {},
        onDragEntered: (detail) {},
        onDragExited: (detail) {},
        child: Container(
          width: 220,
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              size: 40,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
