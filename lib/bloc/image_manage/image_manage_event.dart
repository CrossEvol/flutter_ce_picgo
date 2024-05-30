part of 'image_manage_bloc.dart';

sealed class ImageManageEvent extends Equatable {
  const ImageManageEvent();
}

final class ImageManageEventLoad extends ImageManageEvent {
  final String storageType;

  @override
  List<Object?> get props => [storageType];

  const ImageManageEventLoad({
    required this.storageType,
  });
}

final class ImageManageEventDelete extends ImageManageEvent {
  final List<int> ids;
  final String storageType;

  @override
  List<Object?> get props => [storageType, ids];

  const ImageManageEventDelete({
    required this.ids,
    required this.storageType,
  });
}

final class ImageManageEventReset extends ImageManageEvent {
  @override
  List<Object?> get props => [];

  const ImageManageEventReset();
}
