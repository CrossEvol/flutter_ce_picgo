import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ce_picgo/bloc/image_manage/image_manage_bloc.dart';
import 'package:flutter_ce_picgo/utils/dir_util.dart';
import 'package:flutter_ce_picgo/utils/flutter_toast_ext.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:flutter_ce_picgo/widgets/image_manage_item.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoManageScreen extends StatefulWidget {
  final String storageType;

  final List<ImageItemVO> images;

  const RepoManageScreen(
      {super.key, required this.images, required this.storageType});

  @override
  State<RepoManageScreen> createState() => _RepoManageScreenState();
}

class ImageItemVO {
  int id;
  String name;
  String remoteUrl;
  bool selected;

  ImageItemVO({
    required this.id,
    required this.name,
    required this.remoteUrl,
    required this.selected,
  });
}

class _RepoManageScreenState extends State<RepoManageScreen> {
  int get selectedCount =>
      widget.images.where((element) => element.selected).toList().length;

  int get totalCount => widget.images.length;

  _RepoManageScreenState();

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
                await openDocument('$appStorageDirectory/${widget.storageType}');
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
                          MaterialStateProperty.all(const Size(100.0, 40.0)),
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
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Theme.of(context).colorScheme.error),
                      minimumSize:
                          MaterialStateProperty.all(const Size(120.0, 40.0)),
                    ),
                    child: Text(
                      '确认($selectedCount/$totalCount)',
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Adjust column count as desired
        ),
        itemCount: totalCount,
        itemBuilder: (context, index) {
          var image = widget.images[index];
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Stack(
              children: [
                ImageManageItem(
                  name: image.name,
                  remoteUrl: image.remoteUrl,
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
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      // MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  Future<void> openDocument(String filePath) async {
    final url = 'file:///$filePath';
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      logger.w(e);
      fToast.showErrorToast(text: 'Open File Failed.');
    }
    // if (await canLaunchUrl(Uri.parse(url))) {
    //   await launchUrl(Uri.parse(url));
    // } else {
    //   // Handle the case where no app can open the file
    //   fToast.showErrorToast(text: 'No Permission');
    // }
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
}
