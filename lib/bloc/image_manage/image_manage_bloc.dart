import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ce_picgo/api/github_api.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:flutter_ce_picgo/models/downloaded_image.dart';
import 'package:flutter_ce_picgo/models/github_config.dart';

part 'image_manage_event.dart';

part 'image_manage_state.dart';

class ImageManageBloc extends Bloc<ImageManageEvent, ImageManageState> {
  ImageManageBloc() : super(const ImageManageState(images: [])) {
    on<ImageManageEventLoad>((event, emit) async {
      var list = await GithubApi.getImages(GithubConfig(
          branch: '', customUrl: '', path: '', repo: '', token: ''));
      List<DownloadedImage> images = [];
      for (var element in list) {
        final (name, sha) = element;
        await GithubApi.downloadImage(
            githubConfig: GithubConfig.none(), filename: name);
        var flag = await dbProvider.saveDownloadedImage(DownloadedImage(
            id: 0,
            path: name,
            name: name,
            sha: sha,
            downloadedAt: DateTime.now()));
        if (flag) {
          var downloadedImage =
              await dbProvider.getDownloadedImage((name, name));
          images.add(downloadedImage);
        }
      }
      emit(state.copyWith(images: event.images));
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
