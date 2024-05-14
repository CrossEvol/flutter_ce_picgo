import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:flutter_ce_picgo/models/uploaded_image.dart';

part 'upload_image_event.dart';

part 'upload_image_state.dart';

class UploadImageBloc extends Bloc<UploadImageEvent, UploadImageState> {
  UploadImageBloc() : super(const UploadImageState(images: [])) {
    on<UploadImageEventUpdate>((event, emit) {
      var images = state.images;
      var image =
          images.where((element) => element.filepath == event.filepath).first;
      image.url = event.url ?? image.url;
      image.name = event.name ?? image.name;
      image.state = event.state ?? image.state;
      image.uploadTime = DateTime.now();
      images.removeWhere((element) => element.filepath == event.filepath);
      images.add(image);
      emit(state.copyWith(images: images));
    });

    on<UploadImageEventLoad>((event, emit)async{
      var images = await dbProvider.getUploadedImages();
      emit(state.copyWith(images: images));
    });

    on<UploadImageEventAdd>((event, emit) async {
      await dbProvider.saveUploadedImage(event.uploadedImage);
      state.copyWith(images: [...state.images, event.uploadedImage]);
    });
  }
}
