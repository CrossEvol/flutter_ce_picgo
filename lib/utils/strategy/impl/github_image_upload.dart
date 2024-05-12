import 'dart:io';

import '../../../models/uploaded.dart';
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
