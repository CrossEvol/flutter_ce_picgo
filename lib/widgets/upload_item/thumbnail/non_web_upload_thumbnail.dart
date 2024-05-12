import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/widgets/upload_item/thumbnail/upload_thumbnail.dart';

import '../load_state_widget.dart';

UploadThumbnail getInstance() => NonWebUploadThumbnail();

class NonWebUploadThumbnail implements UploadThumbnail {
  @override
  Widget createUploadThumbnail(String filepath) {
    return ExtendedImage.file(
      File(filepath),
      width: 50,
      height: 50,
      fit: BoxFit.cover,
      // border: Border.all(color: Colors.grey, width: 1.0),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      loadStateChanged: (state) => watchLoadStateWidget(state),
    );
  }
}
