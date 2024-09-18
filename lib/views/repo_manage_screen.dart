import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ce_picgo/bloc/image_manage/image_manage_bloc.dart';
import 'package:flutter_ce_picgo/utils/dir_util.dart';
import 'package:flutter_ce_picgo/utils/flutter_toast_ext.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:flutter_ce_picgo/widgets/image_manage_item.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageItemGroup {
  String parentPath;
  List<ImageItemVO> items;

  ImageItemGroup(this.parentPath, this.items);
}

class ImageItemVO {
  int id;
  String name;
  String remoteUrl;
  bool selected;
  String parentPath;

  ImageItemVO({
    required this.id,
    required this.name,
    required this.remoteUrl,
    required this.selected,
    required this.parentPath,
  });
}

class RepoManageScreen extends StatefulWidget {
  final String storageType;

  final List<ImageItemVO> images;

  const RepoManageScreen(
      {super.key, required this.images, required this.storageType});

  @override
  State<RepoManageScreen> createState() => _RepoManageScreenState();
}

class _RepoManageScreenState extends State<RepoManageScreen> {
  List<ImageItemGroup> groupedImages = [];

  int get selectedCount =>
      widget.images.where((element) => element.selected).toList().length;

  int get totalCount => widget.images.length;

  _RepoManageScreenState();

  @override
  void initState() {
    super.initState();
    fToast.init(context);
    groupImagesByParentPath();
  }

  void groupImagesByParentPath() {
    final Map<String, List<ImageItemVO>> groupedMap = {};
    for (var image in widget.images) {
      if (!groupedMap.containsKey(image.parentPath)) {
        groupedMap[image.parentPath] = [];
      }
      groupedMap[image.parentPath]!.add(image);
    }
    groupedImages = groupedMap.entries
        .map((entry) => ImageItemGroup(entry.key, entry.value))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () async {
                await openDocument(
                    '$appStorageDirectory/${widget.storageType}');
              },
              icon: Icon(
                Icons.file_open,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: selectedCount == 0
                ? FilledButton.tonal(
                    onPressed: null,
                    style: ButtonStyle(
                      minimumSize:
                          WidgetStateProperty.all(const Size(100.0, 40.0)),
                    ),
                    child: const Text('确认'),
                  )
                : FilledButton(
                    onPressed: () {
                      context.read<ImageManageBloc>().add(
                          ImageManageEventDelete(
                              storageType: widget.storageType,
                              ids: widget.images
                                  .where((element) => element.selected)
                                  .map((e) => e.id)
                                  .toList()));
                      // fToast.showErrorToast(text: 'UnImplemented');
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith(
                          (states) => Theme.of(context).colorScheme.error),
                      minimumSize:
                          WidgetStateProperty.all(const Size(120.0, 40.0)),
                    ),
                    child: Text(
                      '确认($selectedCount/$totalCount)',
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: groupedImages.length,
        itemBuilder: (context, groupIndex) {
          var group = groupedImages[groupIndex];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  group.parentPath,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Adjust column count as desired
                ),
                itemCount: group.items.length,
                itemBuilder: (context, index) {
                  var image = group.items[index];
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Stack(
                      children: [
                        ImageManageItem(
                          name: image.name,
                          remoteUrl: image.remoteUrl,
                          parentPath: image.parentPath,
                        ),
                        image.selected
                            ? GestureDetector(
                                onDoubleTap: () {
                                  setState(() {
                                    image.selected = false;
                                  });
                                },
                                child: Container(
                                  color: Colors.grey.withOpacity(
                                      0.5), // Adjust opacity for desired mask intensity
                                ),
                              )
                            : Container(),
                        Positioned(
                          top: 2.0, // Adjust position
                          right: 2.0, // Adjust position
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            side: const BorderSide(color: Colors.white, width: 2.0),
                            checkColor: Colors.white,
                            activeColor: Theme.of(context).colorScheme.error,
                            // fillColor: MaterialStateProperty.resolveWith(getColor),
                            value: image.selected,
                            onChanged: (bool? value) {
                              setState(() {
                                image.selected = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      // MaterialState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  Future<void> openDocument(String filePath) async {
    final url = 'file:///$filePath';
    if (Platform.isWindows) {
      try {
        await launchUrl(Uri.parse(url));
      } catch (e) {
        logger.w(e);
        fToast.showErrorToast(text: 'Open File Failed.');
      }
    } else if (Platform.isAndroid) {
      Clipboard.setData(ClipboardData(text: url));
      fToast.showSuccessToast(text: 'Copy the Path!$url');
    }
  }

  @override
  void dispose() {
    fToast.removeQueuedCustomToasts();
    super.dispose();
  }
}
