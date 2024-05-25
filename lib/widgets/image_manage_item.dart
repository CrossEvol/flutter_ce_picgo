import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/utils/dir_util.dart';
import 'package:path/path.dart';

class ImageManageItem extends StatelessWidget {
  final String name;

  const ImageManageItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    var file = File(join(appDirectory, name));
    if (file.existsSync()) {
      var fileImage = FileImage(file);
    } else {
      // TODO: should request the content data and save it
    }
    return Image(image: FileImage(file));
  }
}
