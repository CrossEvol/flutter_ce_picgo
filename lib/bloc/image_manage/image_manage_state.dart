part of 'image_manage_bloc.dart';

final class ImageManageState extends Equatable {
  final List<DownloadedImage> images;

  @override
  List<Object?> get props => [images];

  const ImageManageState({
    required this.images,
  });

  ImageManageState copyWith({
    List<DownloadedImage>? images,
  }) {
    return ImageManageState(
      images: images ?? this.images,
    );
  }
}
