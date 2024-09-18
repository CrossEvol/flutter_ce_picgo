part of 'selected_images_bloc.dart';

final class SelectedImagesState extends Equatable {
  final List<int> selectedIDs;

  const SelectedImagesState({required this.selectedIDs});

  @override
  List<Object?> get props => [selectedIDs];

  SelectedImagesState copyWith({
    List<int>? selectedIDs,
  }) {
    return SelectedImagesState(
      selectedIDs: selectedIDs ?? this.selectedIDs,
    );
  }
}
