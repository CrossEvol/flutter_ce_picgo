import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_cache_event.dart';

part 'image_cache_state.dart';

class ImageCacheBloc extends Bloc<ImageCacheEvent, ImageCacheState> {
  ImageCacheBloc() : super(ImageCacheState(imageCache: const {})) {
    on<ImageCacheEventPut>((event, emit) {
      emit(state.copyWith(imageCache: {
        ...state.imageCache,
        ...{event.key: event.xFile}
      }));
    });

    on<ImageCacheEventRemove>((event, emit) async {
      Future.delayed(const Duration(minutes: 2), () {
        var imageCache = state.imageCache;
        if (imageCache.containsKey(event.key)) {
          imageCache.remove(event.key);
          emit(state.copyWith(imageCache: imageCache));
        }
      });
    });

    on<ImageCacheEventClear>((event, emit) {
      emit(state.copyWith(imageCache: {}));
    });
  }
}
