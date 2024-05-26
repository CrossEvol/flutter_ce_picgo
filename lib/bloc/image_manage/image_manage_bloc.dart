import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ce_picgo/models/downloaded_image.dart';

part 'image_manage_event.dart';

part 'image_manage_state.dart';

class ImageManageBloc extends Bloc<ImageManageEvent, ImageManageState> {
  ImageManageBloc() : super(const ImageManageState(images: [])) {
    on<ImageManageEventLoad>((event, emit) {
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
