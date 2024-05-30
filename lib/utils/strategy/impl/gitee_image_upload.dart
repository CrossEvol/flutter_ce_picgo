import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ce_picgo/models/downloaded_image.dart';
import 'package:flutter_ce_picgo/models/enums/uploaded_state.dart';
import 'package:flutter_ce_picgo/models/uploaded_image.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/gitee_api.dart';
import '../../../constants/image_storage_type.dart';
import '../../../database/db_interface.dart';
import '../../../models/get_image_result.dart';
import '../../../models/gitee_config.dart';
import '../../../models/gitee_content.dart';
import '../../logger_util.dart';
import '../image_upload_strategy.dart';

class GiteeImageUpload
    implements ImageUploadStrategy<GiteeConfig, GiteeContent, DownloadedImage> {
  static const uploadCommitMessage = "Upload by Flutter-PicGo";
  static const deleteCommitMessage = "Delete by Flutter-PicGo";

  @override
  Future<UploadResult> upload(
      {required XFile xFile, required String rename}) async {
    Dio dio = Dio();

    var configJson = await dbProvider.getImageStorageSettingConfig(
        type: ImageStorageType.gitee);
    var giteeConfig = GiteeConfig.fromJson(jsonDecode(configJson));

    // Set headers
    dio.options.headers['Content-Type'] = ' application/json;charset=UTF-8';
    dio.interceptors.add(LogInterceptor(
        requestBody: false, responseBody: true, logPrint: (o) => logger.w(o)));

    var fileData = await xFile.readAsBytes();

    // Set request body
    Map<String, dynamic> requestBody = {
      'message': 'my commit message',
      'content': base64Encode(fileData),
      'access_token': giteeConfig.token
    };

    // Perform PUT request
    try {
      Response response = await dio.post(
        'https://gitee.com/api/v5/repos/${giteeConfig.repo}/contents/$rename',
        data: requestBody,
        options: Options(contentType: Headers.jsonContentType),
      );
      var jsonData = response.data;
      var giteeContent = GiteeContent.fromJson(jsonData['content']);
      return (
        giteeContent.downloadUrl,
        UploadState.completed,
        giteeContent.sha
      );
    } catch (e) {
      logger.e(e);
      return ('', UploadState.uploadFailed, '');
    }
  }

  @override
  Future<DeleteResult> delete(UploadedImage uploadedImage) {
    // TODO: implement delete0
    throw UnimplementedError();
  }

  @override
  Future<GiteeContent> downloadImage(
      {required GiteeConfig config,
      required String src,
      required String dest}) async {
    return await GiteeApi.downloadImage(
        giteeConfig: config, src: src, dest: dest);
  }


  @override
  Future<bool> removeImage(
      {required GiteeConfig config, required DownloadedImage download}) async {
    return await GiteeApi.removeImage(
        giteeConfig: config, downloadedImage: download);
  }

  @override
  Future<List<GetImagesResult>> getImages(GiteeConfig config) {
    // TODO: implement getImages
    throw UnimplementedError();
  }
}

/// GithubError describes the error info  when request failed.
class GiteeError implements Exception {
  GiteeError({
    this.error,
  });

  dynamic error;

  String get message => (error?.toString() ?? '');

  @override
  String toString() {
    var msg = 'GithubError $message';
    if (error is Error) {
      msg += '\n${error.stackTrace}';
    }
    return msg;
  }
}

class GiteeUploadedInfo {
  String sha;
  String branch;
  String path;
  String ownerRepo;

  GiteeUploadedInfo({
    required this.sha,
    required this.branch,
    required this.path,
    required this.ownerRepo,
  });

  Map<String, dynamic> toMap() {
    return {
      'sha': sha,
      'branch': branch,
      'path': path,
      'ownerRepo': ownerRepo,
    };
  }

  factory GiteeUploadedInfo.fromMap(Map<String, dynamic> map) {
    return GiteeUploadedInfo(
      sha: map['sha'] as String,
      branch: map['branch'] as String,
      path: map['path'] as String,
      ownerRepo: map['ownerRepo'] as String,
    );
  }
}
