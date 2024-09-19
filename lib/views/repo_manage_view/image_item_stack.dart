import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ce_picgo/bloc/selected_images/selected_images_bloc.dart';
import 'package:flutter_ce_picgo/common/interfaces/interface.dart';
import 'package:flutter_ce_picgo/constants/shared_preferences_keys.dart';
import 'package:flutter_ce_picgo/utils/shared_preferences_ext.dart';
import 'package:flutter_ce_picgo/views/repo_manage_view/image_item_network.dart';
import 'package:flutter_ce_picgo/views/repo_manage_view/image_item_local.dart';

import 'models.dart';

class ImageItemStack extends StatefulWidget implements ImageItemWidget {
  final ImageItemVO image;

  const ImageItemStack({super.key, required this.image});

  @override
  State<ImageItemStack> createState() => _ImageItemStackState();
}

class _ImageItemStackState extends State<ImageItemStack> {
  _ImageItemStackState();

  @override
  Widget build(BuildContext context) {
    var preferLoadNetworkImages =
        prefs.getBool(SharedPreferencesKeys.preferLoadNetworkImages.name) ??
            false;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          preferLoadNetworkImages
              ? ImageItemNetwork(
                  name: widget.image.name,
                  remoteUrl: widget.image.remoteUrl,
                  downloadUrl: widget.image.downloadUrl)
              : ImageItemLocal(
                  name: widget.image.name,
                  remoteUrl: widget.image.remoteUrl,
                  parentPath: widget.image.parentPath,
                ),
          widget.image.selected
              ? GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      widget.image.selected = false;
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
              value: widget.image.selected,
              onChanged: (bool? value) {
                setState(() {
                  widget.image.selected = value!;
                  if (widget.image.selected) {
                    context
                        .read<SelectedImagesBloc>()
                        .add(SelectedImagesAddEvent(id: widget.image.id));
                  } else {
                    context
                        .read<SelectedImagesBloc>()
                        .add(SelectedImagesRemoveEvent(id: widget.image.id));
                  }
                });
              },
            ),
          ),
        ],
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
