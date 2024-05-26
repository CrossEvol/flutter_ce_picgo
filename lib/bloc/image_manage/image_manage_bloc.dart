import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ce_picgo/api/github_api.dart';
import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:flutter_ce_picgo/models/downloaded_image.dart';
import 'package:flutter_ce_picgo/models/github_config.dart';

part 'image_manage_event.dart';

part 'image_manage_state.dart';

class ImageManageBloc extends Bloc<ImageManageEvent, ImageManageState> {
  ImageManageBloc() : super(const ImageManageState(images: [])) {
    on<ImageManageEventLoad>((event, emit) async {
      var configJson = await dbProvider.getImageStorageSettingConfig(
          type: ImageStorageType.github);
      var githubConfig = GithubConfig.fromJson(jsonDecode(configJson));
      var list = await GithubApi.getImages(githubConfig);
      int index = 0;
      var images = list
          .map((e) => DownloadedImage(
              id: ++index,
              path: e.$1,
              name: e.$1,
              sha: e.$2,
              downloadedAt: DateTime.now()))
          .toList();
      emit(state.copyWith(images: images));
    });

    on<ImageManageEventDelete>((event, emit) {
      emit(state.copyWith(
          images: state.images
              .where((element) => !event.ids.contains(element.id))
              .toList()));
    });

    on<ImageManageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
