import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/api/github_api.dart';
import 'package:flutter_ce_picgo/common/interfaces/interface.dart';
import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:flutter_ce_picgo/models/downloaded_image.dart';
import 'package:flutter_ce_picgo/models/github_config.dart';
import 'package:flutter_ce_picgo/router/router_extra.dart';
import 'package:flutter_ce_picgo/utils/dir_util.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

/*
* TODO : has some performance problem, reload too many , does it download the file repeatedly?
* */

class ImageItemLocal extends StatelessWidget implements ImageItemWidget {
  final String name;
  final String remoteUrl;
  final String parentPath;

  const ImageItemLocal(
      {super.key,
      required this.name,
      required this.remoteUrl,
      required this.parentPath});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FileImage>(
      future: setupFileImage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Image.asset('assets/image_load_error.jpg', fit: BoxFit.cover);
        }
        return GestureDetector(
            onTap: () {
              context.go(
                '/image',
                extra: ImageExtra.local(
                    name: name,
                    localUrl: snapshot.data!.file.absolute.path,
                    type: ImageStorageType.github.name),
              );
            },
            child: Image(image: snapshot.data!, fit: BoxFit.cover));
      },
    );
  }

  Future<FileImage> setupFileImage() async {
    var exists = await dbProvider.existsDownloadedImage((name, remoteUrl));
    var localUrl =
        join(appStorageDirectory, ImageStorageType.github.name, name);
    if (exists) {
      var file = File(localUrl);
      if (file.existsSync()) {
        return FileImage(file);
      } else {
        // remote the outdated mismatched data
        await dbProvider.removeDownloadedImage((name, '', remoteUrl));
        return await createLocalImageCache(remoteUrl, localUrl);
      }
    } else {
      return await createLocalImageCache(remoteUrl, localUrl);
    }
  }

  Future<FileImage> createLocalImageCache(String src, String dest) async {
    var configJson = await dbProvider.getImageStorageSettingConfig(
        type: ImageStorageType.github.name);
    var githubContent = await GithubApi.downloadImage(
        githubConfig: GithubConfig.fromJson(jsonDecode(configJson)),
        src: src,
        dest: dest);
    Future.delayed(Duration.zero, () async {
      await dbProvider.saveDownloadedImage(DownloadedImage(
          id: 0,
          localUrl: dest,
          remoteUrl: githubContent.url,
          downloadUrl: githubContent.downloadUrl,
          name: githubContent.name,
          sha: githubContent.sha,
          createdAt: DateTime.now(),
          parentPath: parentPath));
    });
    return FileImage(File(dest));
  }
}
