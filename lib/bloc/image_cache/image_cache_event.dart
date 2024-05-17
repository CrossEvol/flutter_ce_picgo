part of 'image_cache_bloc.dart';

sealed class ImageCacheEvent extends Equatable {
  const ImageCacheEvent();
}

final class ImageCacheEventPut extends ImageCacheEvent {
  final String key;
  final XFile xFile;

  @override
  List<Object?> get props => [key, xFile];

  const ImageCacheEventPut({
    required this.key,
    required this.xFile,
  });
}

final class ImageCacheEventRemove extends ImageCacheEvent {
  final String key;

  @override
  List<Object?> get props => [key];

  const ImageCacheEventRemove({
    required this.key,
  });
}

final class ImageCacheEventClear extends ImageCacheEvent {
  @override
  List<Object?> get props => [];

  const ImageCacheEventClear();
}
