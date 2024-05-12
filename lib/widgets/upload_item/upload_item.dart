import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ce_picgo/utils/flutter_toast_ext.dart';

import 'load_state_widget.dart';
import 'upload_item_presenter.dart';

enum UploadState {
  /// 上传中
  uploading,

  /// 保存中
  saving,

  /// 已完成
  complete,

  /// 上传失败
  uploadFail,

  /// 保存失败
  saveFail
}

class UploadItem extends StatefulWidget {
  final File file;
  final String rename;
  final bool needNotify;

  const UploadItem(this.file, this.rename,
      {super.key, this.needNotify = false});

  @override
  State<UploadItem> createState() => _UploadItemState();
}

class _UploadItemState extends State<UploadItem> implements UploadItemContract {
  late UploadState _state;
  late UploadItemPresenter _presenter;
  String _uploadedImageUrl = '';

  @override
  void initState() {
    super.initState();
    fToast.init(context);
    _state = UploadState.uploading;
    _presenter = UploadItemPresenter(this);
    _startUpload();
  }

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
          child: ExtendedImage.file(
            File(widget.file.path),
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            // border: Border.all(color: Colors.grey, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            loadStateChanged: (state) => watchLoadStateWidget(state),
          ),
        ),
      ),
      title: Text(
        widget.rename,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textWidthBasis: TextWidthBasis.parent,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      subtitle: Text(
        '上传状态：${stateToText()}',
        maxLines: 1,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: buildStateTip(),
      onTap: () {
        _handleTap();
      },
    );
  }

  Widget buildStateTip() {
    switch (_state) {
      case UploadState.uploading:
      case UploadState.saving:
        return const SizedBox(
          width: 16,
          height: 16,
          child: CupertinoActivityIndicator(),
        );
      case UploadState.complete:
        return const Icon(
          Icons.done,
          size: 16,
          color: Colors.green,
        );
      case UploadState.uploadFail:
      case UploadState.saveFail:
      default:
        return GestureDetector(
          child: const Icon(
            Icons.error,
            color: Colors.red,
            size: 16,
          ),
          onTap: () {
            _startUpload();
          },
        );
    }
  }

  /// 状态转文字
  String stateToText() => _state.toText();

  /// 开始上传
  _startUpload() {
    setState(() {
      _state = UploadState.uploading;
    });
    _presenter.doUploadImage(widget.file, widget.rename);
  }

  /// 处理点击事件
  _handleTap() {
    if (_state == UploadState.complete) {
      Clipboard.setData(ClipboardData(text: _uploadedImageUrl));
      fToast.showSuccessToast(text: '已复制到剪切板');
      // Toast.show('已复制到剪切板', context);
    } else {
      fToast.showErrorToast(text: '当前状态无法操作');
      // Toast.show('当前状态无法操作', context);
    }
  }

  @override
  uploadFailed(String errorMsg) {
    setState(() {
      _state = UploadState.uploadFail;
    });

    _showNotification(0, '${widget.rename}上传失败：$errorMsg');
  }

  @override
  uploadSuccess(String url) async {
    _uploadedImageUrl = url;
    setState(() {
      _state = UploadState.complete;
    });

    _showNotification(0, '${widget.rename}上传成功：$url');
  }

  Future<void> _showNotification(int id, String body) async {
    // LocalNotificationUtil.getInstance().show(
    //     id,
    //     '上传提示',
    //     body,
    //     LocalNotificationUtil.createNotificationDetails(
    //         LocalNotificationUtil.uploadAndroidChannel(),
    //         LocalNotificationUtil.normalIOSNotificationDetails(),
    //         LocalNotificationUtil.normalMacOSNotificationDetails()));
  }
}

extension on UploadState {
  String toText() {
    return switch (this) {
      UploadState.uploading => '上传中',
      UploadState.saving => '保存中',
      UploadState.complete => '已完成',
      UploadState.uploadFail => '上传失败',
      UploadState.saveFail => '保存失败',
      _ => '未知'
    };
  }
}
