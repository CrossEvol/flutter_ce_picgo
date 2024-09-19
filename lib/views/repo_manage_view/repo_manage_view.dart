import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ce_picgo/bloc/image_manage/image_manage_bloc.dart';
import 'package:flutter_ce_picgo/bloc/selected_images/selected_images_bloc.dart';
import 'package:flutter_ce_picgo/models/downloaded_image.dart';
import 'package:flutter_ce_picgo/utils/dir_util.dart';
import 'package:flutter_ce_picgo/utils/flutter_toast_ext.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:url_launcher/url_launcher.dart';

import 'image_item_stack.dart';
import 'models.dart';
import 'remove_action.dart';

class RepoManageView extends StatefulWidget {
  final String storageType;

  const RepoManageView({super.key, required this.storageType});

  @override
  State<RepoManageView> createState() => _RepoManageViewState();
}

class _RepoManageViewState extends State<RepoManageView> {
  _RepoManageViewState();

  @override
  void initState() {
    super.initState();
    fToast.init(context);
    context
        .read<ImageManageBloc>()
        .add(ImageManageEventLoad(storageType: widget.storageType));
    context.read<SelectedImagesBloc>().add(const SelectedImagesResetEvent());
  }

  List<ImageItemGroup> groupImagesByParentPath(List<DownloadedImage> images) {
    final Map<String, List<ImageItemVO>> groupedMap = {};
    for (var image in images
        .map((e) => ImageItemVO(
            id: e.id,
            name: e.name,
            remoteUrl: e.remoteUrl,
            downloadUrl: e.downloadUrl ?? '',
            selected: false,
            parentPath: e.parentPath))
        .toList()) {
      if (!groupedMap.containsKey(image.parentPath)) {
        groupedMap[image.parentPath] = [];
      }
      groupedMap[image.parentPath]!.add(image);
    }
    return groupedMap.entries
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
            child: RemoveAction(
              storageType: widget.storageType,
            ),
          ),
        ],
      ),
      body: BlocBuilder<ImageManageBloc, ImageManageState>(
        builder: (context, state) {
          if (state.status == ImageManageStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          var groupedImages = state.imageItemGroups;
          return ListView.builder(
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
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Adjust column count as desired
                    ),
                    itemCount: group.items.length,
                    itemBuilder: (context, index) {
                      var image = group.items[index];
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ImageItemStack(image: image),
                      );
                    },
                  ),
                ],
              );
            },
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
