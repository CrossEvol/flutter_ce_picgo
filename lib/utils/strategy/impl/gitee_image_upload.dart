import 'dart:convert';

import 'package:cross_file/src/types/interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ce_picgo/models/uploaded_image.dart';
import 'dart:io';

import 'package:path/path.dart' as path;

import '../../../models/uploaded.dart';
import '../image_upload_strategy.dart';

class GiteeImageUpload implements ImageUploadStrategy {
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
  Future<UploadedImage> upload0(XFile file, String renameImage) {
    // TODO: implement upload0
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
      'sha': this.sha,
      'branch': this.branch,
      'path': this.path,
      'ownerRepo': this.ownerRepo,
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
