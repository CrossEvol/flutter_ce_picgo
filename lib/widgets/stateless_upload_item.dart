import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ce_picgo/utils/flutter_toast_ext.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/enums/uploaded_state.dart';
import '../models/uploaded_image.dart';
import 'upload_item/thumbnail/upload_thumbnail.dart';

class StatelessUploadItem extends StatelessWidget {
  final String name;
  final UploadState uploadState;
  final String path;
  final FToast fToast;
  final String downloadUrl;

  StatelessUploadItem(
      {super.key, required UploadedImage uploadedImage, required this.fToast})
      : name = uploadedImage.name,
        uploadState = uploadedImage.state,
        path = !kIsWeb ? uploadedImage.filepath : uploadedImage.url,
        downloadUrl = uploadedImage.url;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 50,
        width: 50,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(8)),
          child: UploadThumbnail().createUploadThumbnail(path),
          // child: kIsWeb
          //     ? Image.network(
          //         path,
          //         // mm.imagePath,
          //         width: 50,
          //         height: 50,
          //       )
          //     : Image.file(
          //         File(path),
          //         // File(mm.imagePath),
          //         width: 50,
          //         height: 50,
          //       ),
        ),
      ),
      title: Text(
        name,
        // widget.rename,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textWidthBasis: TextWidthBasis.parent,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      subtitle: Text(
        '上传状态：${uploadState.toText()}',
        maxLines: 1,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: buildStateTip(),
      onTap: () {
        _handleTap();
      },
    );
  }

  /// 处理点击事件
  void _handleTap() {
    if (uploadState == UploadState.completed) {
      Clipboard.setData(ClipboardData(text: downloadUrl));
      fToast.showSuccessToast(text: '已复制到剪切板');
      // Toast.show('已复制到剪切板', context);
    } else {
      fToast.showErrorToast(text: '当前状态无法操作');
      // Toast.show('当前状态无法操作', context);
    }
  }

  Widget buildStateTip() {
    switch (uploadState) {
      case UploadState.uploading:
      case UploadState.saving:
        return const SizedBox(
          width: 16,
          height: 16,
          child: CupertinoActivityIndicator(),
        );
      case UploadState.completed:
        return const Icon(
          Icons.done,
          size: 16,
          color: Colors.green,
        );
      case UploadState.uploadFailed:
      case UploadState.saveFailed:
      default:
        return GestureDetector(
          child: const Icon(
            Icons.error,
            color: Colors.red,
            size: 16,
          ),
          onTap: () {
            // _startUpload();
          },
        );
    }
  }
}

extension on UploadState {
  String toText() {
    return switch (this) {
      UploadState.uploading => '上传中',
      UploadState.saving => '保存中',
      UploadState.completed => '已完成',
      UploadState.uploadFailed => '上传失败',
      UploadState.saveFailed => '保存失败',
      _ => '未知'
    };
  }
}
