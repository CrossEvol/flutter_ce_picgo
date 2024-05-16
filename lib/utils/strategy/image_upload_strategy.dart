import 'package:flutter_ce_picgo/models/uploaded_image.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/enums/uploaded_state.dart';

typedef UploadResult = (String url, UploadState state, String sha);

typedef DeleteResult = UploadedImage;

abstract class ImageUploadStrategy {
  Future<UploadResult> upload({required XFile xFile, required String rename});

  Future<DeleteResult> delete(UploadedImage uploadedImage);
}
