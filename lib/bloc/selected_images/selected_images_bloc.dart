import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'selected_images_event.dart';

part 'selected_images_state.dart';

class SelectedImagesBloc
    extends Bloc<SelectedImagesEvent, SelectedImagesState> {
  SelectedImagesBloc() : super(const SelectedImagesState(selectedIDs: [])) {
    on<SelectedImagesAddEvent>((event, emit) {
      emit(state.copyWith(selectedIDs: [...state.selectedIDs, event.id]));
    });
    on<SelectedImagesRemoveEvent>((event, emit) {
      emit(state.copyWith(
          selectedIDs:
              state.selectedIDs.where((item) => item != event.id).toList()));
    });
    on<SelectedImagesResetEvent>((event, emit) {
      emit(state.copyWith(selectedIDs: []));
    });
    on<SelectedImagesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
