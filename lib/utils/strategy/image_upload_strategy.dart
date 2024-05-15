import 'dart:io';

import 'package:flutter_ce_picgo/models/uploaded_image.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/enums/uploaded_state.dart';
import '../../models/uploaded.dart';

abstract class ImageUploadStrategy {
  /// 上传照片，根据策略来实现上传的图片
  Future<Uploaded> upload(File file, String renameImage);

  Future<Uploaded> delete(Uploaded uploaded);

  Future<(String url, UploadState state)> upload0(UploadedImage uploadedImage);

  Future<(String url, UploadState state)> upload1({required XFile xFile,required String rename});

  Future<UploadedImage> delete0(UploadedImage uploadedImage);
}
