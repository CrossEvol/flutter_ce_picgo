import 'package:flutter/material.dart';

import 'upload_thumbnail.dart';

UploadThumbnail getInstance() => WebUploadItemThumbnail();

class WebUploadItemThumbnail implements UploadThumbnail {
  @override
  Widget createUploadThumbnail(String filepath) {
    return const Icon(Icons.ac_unit);
  }
}
