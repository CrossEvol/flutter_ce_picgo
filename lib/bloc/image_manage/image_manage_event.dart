part of 'image_manage_bloc.dart';

sealed class ImageManageEvent extends Equatable {
  const ImageManageEvent();
}

final class ImageManageEventLoad extends ImageManageEvent {
  @override
  List<Object?> get props => [];
}

final class ImageManageEventDelete extends ImageManageEvent {
  final List<int> ids;

  @override
  List<Object?> get props => [ids];

  const ImageManageEventDelete({
    required this.ids,
  });
}

final class ImageManageEventReset extends ImageManageEvent {
  @override
  List<Object?> get props => [];

  const ImageManageEventReset();
}
