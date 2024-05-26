part of 'image_manage_bloc.dart';

sealed class ImageManageEvent extends Equatable {
  const ImageManageEvent();
}

final class ImageManageEventLoad extends ImageManageEvent {
  final List<DownloadedImage> images;

  @override
  List<Object?> get props => [images];

  const ImageManageEventLoad({
    required this.images,
  });
}

final class ImageManageEventDelete extends ImageManageEvent {
  final List<int> ids;

  @override
  List<Object?> get props => [ids];

  const ImageManageEventDelete({
    required this.ids,
  });
}
