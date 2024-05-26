import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/api/github_api.dart';
import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:flutter_ce_picgo/models/downloaded_image.dart';
import 'package:flutter_ce_picgo/models/github_config.dart';
import 'package:flutter_ce_picgo/utils/dir_util.dart';
import 'package:path/path.dart';

class ImageManageItem extends StatelessWidget {
  final String name;
  final String remoteUrl;

  const ImageManageItem(
      {super.key, required this.name, required this.remoteUrl});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FileImage>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Image.network('');
        }
        return Image(image: snapshot.data!);
      },
      future: setupFileImage(),
    );
  }

  Future<FileImage> setupFileImage() async {
    var exists = await dbProvider.existsDownloadedImage((name, remoteUrl));
    if (exists) {
      var localUrl = join(appDirectory, ImageStorageType.github, name);
      var file = File(localUrl);
      if (file.existsSync()) {
        return FileImage(file);
      } else {
        await dbProvider.removeDownloadedImage((name, '', remoteUrl));
        var githubContent = await GithubApi.downloadImage(
            githubConfig: GithubConfig.none(), filename: name);
        Future.delayed(Duration.zero, () async {
          await dbProvider.saveDownloadedImage(DownloadedImage(
            id: 0,
            localUrl: localUrl,
            remoteUrl: githubContent.downloadUrl,
            name: githubContent.name,
            sha: githubContent.sha,
            createdAt: DateTime.now(),
          ));
        });
        return FileImage(file);
      }
    }
    throw const FileSystemException('Not Found');
  }
}
