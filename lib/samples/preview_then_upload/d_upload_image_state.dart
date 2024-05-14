part of 'd_upload_image_bloc.dart';

final class DUploadImageState extends Equatable {
  final List<UploadedImage> images;

  const DUploadImageState({required this.images});

  DUploadImageState copyWith({
    List<UploadedImage>? images,
  }) {
    return DUploadImageState(
      images: images ?? this.images,
    );
  }

  @override
  List<Object?> get props => [images];
}
