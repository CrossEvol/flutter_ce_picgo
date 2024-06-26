import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:flutter_ce_picgo/models/uploaded_image.dart';

import '../../models/enums/uploaded_state.dart';

part 'd_upload_image_event.dart';
part 'd_upload_image_state.dart';

class DUploadImageBloc extends Bloc<DUploadImageEvent, DUploadImageState> {
  DUploadImageBloc() : super(const DUploadImageState(images: [])) {
    on<UploadImageEventUpdate>((event, emit) {
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
