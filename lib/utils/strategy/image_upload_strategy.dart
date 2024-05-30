import 'package:flutter_ce_picgo/models/uploaded_image.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/interfaces/interface.dart';
import '../../models/enums/uploaded_state.dart';
import '../../models/get_image_result.dart';

typedef UploadResult = (String url, UploadState state, String sha);

typedef DeleteResult = UploadedImage;

abstract class ImageUploadStrategy<
    Config extends IConfig,
    Content extends IContent,
    Download extends IDownload> {
  Future<UploadResult> upload({required XFile xFile, required String rename});

  Future<DeleteResult> delete(UploadedImage uploadedImage);

  Future<List<GetImagesResult>> getImages(Config config) async {
    throw UnimplementedError();
  }

  Future<Content> downloadImage(
      {required Config config,
      required String src,
      required String dest}) async {
    throw UnimplementedError();
  }

  Future<bool> removeImage(
      {required Config config, required Download download}) async {
    throw UnimplementedError();
  }
}
