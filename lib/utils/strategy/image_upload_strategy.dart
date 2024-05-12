import 'dart:io';

import '../../models/uploaded.dart';

abstract class ImageUploadStrategy {

  /// 上传照片，根据策略来实现上传的图片
  Future<Uploaded> upload(File file, String renameImage);

  Future<Uploaded> delete(Uploaded uploaded);

}