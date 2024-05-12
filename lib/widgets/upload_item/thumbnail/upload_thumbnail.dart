import 'package:flutter/material.dart';

import 'upload_thumbnail_stub.dart'
    if (dart.library.html) 'web_upload_thumbnail.dart'
    if (dart.library.io) 'non_web_upload_thumbnail.dart';

abstract class UploadThumbnail {
  factory UploadThumbnail() => getInstance();

  Widget createUploadThumbnail(String filepath);
}
