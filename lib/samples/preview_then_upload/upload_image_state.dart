part of 'upload_image_bloc.dart';

final class UploadImageState extends Equatable {
  final List<UploadedImage> images;

  const UploadImageState({required this.images});

  UploadImageState copyWith({
    List<UploadedImage>? images,
  }) {
    return UploadImageState(
      images: images ?? this.images,
    );
  }

  @override
  List<Object?> get props => [images];
}
