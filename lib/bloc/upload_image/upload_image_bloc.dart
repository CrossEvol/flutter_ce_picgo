import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:flutter_ce_picgo/models/uploaded_image.dart';

import '../../models/enums/uploaded_state.dart';

part 'upload_image_event.dart';

part 'upload_image_state.dart';

class UploadImageBloc extends Bloc<UploadImageEvent, UploadImageState> {
  UploadImageBloc() : super(const UploadImageState(images: [])) {
    on<UploadImageEventUpdate>((event, emit) async {
      var updated = await dbProvider.updateUploadedImage(
          filepath: event.filepath,
          url: event.url,
          name: event.name,
          state: event.state);
      if (updated) {
        var newImages = state.images
            .map((e) => e.filepath == event.filepath
                ? e.copyWith(
                    url: event.url ?? e.url,
                    name: event.name ?? e.name,
                    state: event.state ?? e.state,
                    uploadTime: DateTime.now())
                : e)
            .toList();
        emit(state.copyWith(images: newImages));
      }
    });

    on<UploadImageEventLoad>((event, emit) async {
      var images = await dbProvider.getUploadedImages();
      emit(state.copyWith(images: images));
    });

    on<UploadImageEventAdd>((event, emit) async {
      await dbProvider.saveUploadedImage(event.uploadedImage);
      emit(state.copyWith(images: [...state.images, event.uploadedImage]));
    });
  }
}
