part of 'image_cache_bloc.dart';

final class ImageCacheState extends Equatable {
  Map<String, XFile> imageCache;

  @override
  List<Object?> get props => [imageCache];

  ImageCacheState({
    required this.imageCache,
  });

  ImageCacheState copyWith({
    Map<String, XFile>? imageCache,
  }) {
    return ImageCacheState(
      imageCache: imageCache ?? this.imageCache,
    );
  }
}
