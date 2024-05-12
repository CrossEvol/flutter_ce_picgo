import 'dart:io';
import 'package:dio/dio.dart';

abstract class UploadItemContract {
  uploadSuccess(String url);

  uploadFailed(String errorMsg);
}

class UploadItemPresenter {
  UploadItemContract _view;

  UploadItemPresenter(this._view);

  /// 根据配置上传图片
  void doUploadImage(File file, String renameImage) async {
    // 读取配置
    // try {
    //   String pbType = await ImageUploadUtils.getDefaultPB();
    //   var uploader =
    //       ImageUploadUtils(UploadStrategyFactory.getUploadStrategy(pbType));
    //   var uploadedItem = await uploader.upload(file, renameImage);
    //   if (uploadedItem != null) {
    //     _view.uploadSuccess(uploadedItem.path);
    //   } else {
    //     _view.uploadFaild('上传失败！请重试');
    //   }
    // } on DioError catch (e) {
    //   _view.uploadFaild('${e.message}');
    // } catch (e) {
    //   _view.uploadFaild('$e');
    // }
  }
}
