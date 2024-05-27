import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/utils/flutter_toast_ext.dart';
import 'package:flutter_ce_picgo/widgets/image_manage_item.dart';

class RepoManageScreen extends StatefulWidget {
  // final String storageType;

  final List<ImageItemVO> images;

  const RepoManageScreen({
    super.key,
    required this.images,
    /*required this.storageType*/
  });

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
  // final List<ImageItem> images = List.generate(
  //     18,
  //     (index) => ImageItem(
  //         id: index,
  //         url: 'https://avatars.githubusercontent.com/u/67866644?v=4',
  //         selected: false));

  int get selectedCount =>
      widget.images.where((element) => element.selected).toList().length;

  int get totalCount => widget.images.length;

  _RepoManageScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RepoManage'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
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
                      fToast.showErrorToast(text: 'UnImplemented');
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
