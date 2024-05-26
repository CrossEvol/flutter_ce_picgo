import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/api/github_api.dart';
import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:flutter_ce_picgo/models/downloaded_image.dart';
import 'package:flutter_ce_picgo/models/github_config.dart';
import 'package:flutter_ce_picgo/utils/dir_util.dart';
import 'package:path/path.dart';

/*
* TODO : has some performance problem, reload too many , does it download the file repeatedly?
* */

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
        return Image(image: snapshot.data!, fit: BoxFit.cover);
      },
      future: setupFileImage(),
    );
  }

  Future<FileImage> setupFileImage() async {
    var exists = await dbProvider.existsDownloadedImage((name, remoteUrl));
    var localUrl = join(appDirectory, ImageStorageType.github, name);
    if (exists) {
      var file = File(localUrl);
      if (file.existsSync()) {
        return FileImage(file);
      } else {
        // remote the outdated mismatched data
        await dbProvider.removeDownloadedImage((name, '', remoteUrl));
        return await createLocalImageCache(name, localUrl);
      }
    } else {
      return await createLocalImageCache(name, localUrl);
    }
  }

  Future<FileImage> createLocalImageCache(String src, String dest) async {
    var configJson = await dbProvider.getImageStorageSettingConfig(
        type: ImageStorageType.github);
    var githubContent = await GithubApi.downloadImage(
        githubConfig: GithubConfig.fromJson(jsonDecode(configJson)),
        src: src,
        dest: dest);
    Future.delayed(Duration.zero, () async {
      await dbProvider.saveDownloadedImage(DownloadedImage(
        id: 0,
        localUrl: dest,
        remoteUrl: githubContent.downloadUrl,
        name: githubContent.name,
        sha: githubContent.sha,
        createdAt: DateTime.now(),
      ));
    });
    return FileImage(File(dest));
  }
}
