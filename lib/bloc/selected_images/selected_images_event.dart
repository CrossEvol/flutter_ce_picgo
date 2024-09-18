part of 'selected_images_bloc.dart';

sealed class SelectedImagesEvent extends Equatable {
  const SelectedImagesEvent();
}

final class SelectedImagesResetEvent extends SelectedImagesEvent {
  @override
  List<Object?> get props => [];

  const SelectedImagesResetEvent();
}

final class SelectedImagesAddEvent extends SelectedImagesEvent {
  final int id;

  @override
  List<Object?> get props => [id];

  const SelectedImagesAddEvent({
    required this.id,
  });
}

final class SelectedImagesRemoveEvent extends SelectedImagesEvent {
  final int id;

  @override
  List<Object?> get props => [id];

  const SelectedImagesRemoveEvent({
    required this.id,
  });
}
