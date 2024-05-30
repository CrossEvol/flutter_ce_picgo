import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:flutter_ce_picgo/models/downloaded_image.dart';
import 'package:flutter_ce_picgo/models/gitee_config.dart';
import 'package:flutter_ce_picgo/models/github_config.dart';
import 'package:flutter_ce_picgo/service/repo/storage_service.dart';
import 'package:flutter_ce_picgo/service/repo/storage_service_factory.dart';
import 'package:flutter_ce_picgo/utils/dir_util.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';

import '../../common/interfaces/interface.dart';

part 'image_manage_event.dart';

part 'image_manage_state.dart';

Future<IConfig> _getConfig(String storageType) async {
  var configJson =
      await dbProvider.getImageStorageSettingConfig(type: storageType);
  if (storageType case ImageStorageType.github) {
    {
      return GithubConfig.fromJson(jsonDecode(configJson));
    }
  } else if (storageType case ImageStorageType.gitee) {
    {
      return GiteeConfig.fromJson(jsonDecode(configJson));
    }
  } else {
    throw UnimplementedError();
  }
}

class ImageManageBloc extends Bloc<ImageManageEvent, ImageManageState> {
  ImageManageBloc() : super(const ImageManageState(images: [])) {
    on<ImageManageEventLoad>((event, emit) async {
      var config = await _getConfig(event.storageType);
      var storageService =
          StorageServiceFactory.instance.getUploadStrategy(event.storageType);
      var list = await storageService.getImages(config);
      int index = 0;
      var images = list
          .map((e) => DownloadedImage(
              id: ++index,
              // idx in the bloc is not the same as in the database
              localUrl: '',
              // it will be check in the child widget
              remoteUrl: e.remoteUrl,
              name: e.name,
              sha: e.sha,
              createdAt: DateTime.now()))
          .toList();
      emit(state.copyWith(images: images));
    });

    on<ImageManageEventDelete>((event, emit) async {
      var removeList = state.images
          .where((element) => event.ids.contains(element.id))
          .toList();
      // remove in remote → db → fs
      var config = await _getConfig(event.storageType);
      var removedIds =
          <int>[]; // not care whether the data in db and fs has been removed success
      for (var element in removeList) {
        var downloadedImage = await dbProvider.getDownloadedImage(
            (element.name, element.localUrl, element.remoteUrl));
        var storageService =
            StorageServiceFactory.instance.getUploadStrategy(event.storageType);
        var isDeletedInRemote = await storageService.removeImage(
            config: config, download: downloadedImage);
        if (!isDeletedInRemote) {
          logger.e(
              'Failed to remove image [${element.name}](${element.remoteUrl}) in repo.');
          return;
        }
        removedIds.add(element.id);
        var isDeletedInDB = await dbProvider.removeDownloadedImage(
            (element.name, element.localUrl, element.remoteUrl));
        if (!isDeletedInDB) {
          logger.e('Failed to remove image record in Database.');
          return;
        }
        Future.delayed(Duration.zero, () async {
          try {
            var file = File(downloadedImage.localUrl);
            if (await file.exists()) {
              await file.delete();
            }
          } catch (e) {
            logger.e(
                'Failed to remove image [${element.name}](${element.localUrl}) in FileSystem.');
          }
        });
      }
      emit(state.copyWith(
          images: state.images
              .where((element) => !removedIds.contains(element.id))
              .toList()));
    });

    on<ImageManageEventReset>((event, emit) async {
      var flag = await dbProvider.clearDownloadedImages();
      if (flag) {
        Future.delayed(Duration.zero, () async {
          // TODO : reduce the fine-grained
          {
            var flag = await clearImageCacheDir(ImageStorageType.github);
            if (flag) await createImageCacheDir(ImageStorageType.github);
          }
          {
            var flag = await clearImageCacheDir(ImageStorageType.gitee);
            if (flag) await createImageCacheDir(ImageStorageType.gitee);
          }
        });
        emit(state.copyWith(images: []));
      }
      ;
    });

    on<ImageManageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
