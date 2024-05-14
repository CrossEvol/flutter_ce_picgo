import 'dart:convert';
import 'dart:io';

import 'package:cross_file/src/types/interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:flutter_ce_picgo/models/github_config.dart';

import 'package:flutter_ce_picgo/models/uploaded_image.dart';

import '../../../models/github_content.dart';
import '../../../models/uploaded.dart';
import '../../logger_util.dart';
import '../image_upload_strategy.dart';

class GithubImageUpload implements ImageUploadStrategy {
  static const uploadCommitMessage = "Upload by Flutter-PicGo";
  static const deleteCommitMessage = "Delete by Flutter-PicGo";

  @override
  Future<Uploaded> delete(Uploaded uploaded) async {
    throw UnimplementedError();
  }

  @override
  Future<Uploaded> upload(File file, String renameImage) async {
    throw UnimplementedError();
  }

  @override
  Future<UploadedImage> delete0(UploadedImage uploadedImage) {
    // TODO: implement delete0
    throw UnimplementedError();
  }

  @override
  Future<UploadedImage> upload0(XFile file, String renameImage) async {
    var configJson = await dbProvider.getImageStorageSettingConfig(
        type: ImageStorageType.github);
    var githubConfig = GithubConfig.fromJson(jsonDecode(configJson));

    Dio dio = Dio();
    // Set headers
    dio.options.headers['Accept'] = 'application/vnd.github+json';
    dio.options.headers['Authorization'] = 'Bearer ${githubConfig.token}';
    dio.options.headers['X-GitHub-Api-Version'] = '2022-11-28';
    dio.options.headers['Content-Type'] = 'application/json';
    dio.interceptors.add(LogInterceptor(
        requestBody: false, responseBody: true, logPrint: (o) => logger.w(o)));

    var fileData = await file.readAsBytes();

    // Set request body
    Map<String, dynamic> requestBody = {
      'message': 'my commit message',
      'content': base64Encode(fileData),
    };

    // Perform PUT request
    try {
      Response response = await dio.put(
        'https://api.github.com/repos/${githubConfig.repo}/contents/$renameImage',
        data: requestBody,
        options: Options(contentType: Headers.jsonContentType),
      );
      var jsonData = response.data;
      var githubContent = GithubContent.fromJson(jsonData['content']);
      return UploadedImage(
          id: 0,
          filepath: file.path,
          storageType: ImageStorageType.github,
          url: githubContent.downloadUrl,
          name: renameImage,
          state: UploadState.completed,
          createTime: DateTime.now(),
          uploadTime: DateTime.now());
      // sha = githubContent.sha;
    } catch (e) {
      logger.e(e);
      return UploadedImage(
          id: 0,
          filepath: file.path,
          storageType: ImageStorageType.github,
          url: '',
          name: renameImage,
          state: UploadState.uploadFailed,
          createTime: DateTime.now(),
          uploadTime: DateTime.now());
    }
  }
}

/// GithubError describes the error info  when request failed.
class GithubError implements Exception {
  GithubError({
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

class GithubUploadedInfo {
  String sha;
  String branch;
  String path;
  String ownerRepo;

  Map<String, dynamic> toMap() {
    return {
      'sha': sha,
      'branch': branch,
      'path': path,
      'ownerRepo': ownerRepo,
    };
  }

  factory GithubUploadedInfo.fromMap(Map<String, dynamic> map) {
    return GithubUploadedInfo(
      sha: map['sha'] as String,
      branch: map['branch'] as String,
      path: map['path'] as String,
      ownerRepo: map['ownerRepo'] as String,
    );
  }

  GithubUploadedInfo({
    required this.sha,
    required this.branch,
    required this.path,
    required this.ownerRepo,
  });
}
