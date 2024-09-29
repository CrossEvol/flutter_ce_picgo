import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ce_picgo/constants/shared_preferences_keys.dart';
import 'package:flutter_ce_picgo/models/enums/theme_mode.dart';
import 'package:flutter_ce_picgo/utils/shared_preferences_ext.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(_loadSettingsFromPrefs()) {
    on<ToggleThemeEvent>((event, emit) {
      prefs.setString(
          SharedPreferencesKeys.localThemeState.name, event.themeMode.name);
      emit(state.copyWith(themeMode: event.themeMode));
    });

    on<TogglePreferLoadNetworkImagesEvent>((event, emit) {
      prefs.setBool(SharedPreferencesKeys.preferLoadNetworkImages.name,
          event.preferLoadNetworkImages);
      emit(state.copyWith(
          preferLoadNetworkImages: event.preferLoadNetworkImages));
    });

    on<ToggleCanRenameUploadedEvent>((event, emit) {
      prefs.setBool(SharedPreferencesKeys.canRenameUploaded.name,
          event.canRenameUploaded);
      emit(state.copyWith(canRenameUploaded: event.canRenameUploaded));
    });

    on<ToggleUseTimestampForRenamingEvent>((event, emit) {
      prefs.setBool(SharedPreferencesKeys.useTimestampForRenaming.name,
          event.useTimestampForRenaming);
      emit(state.copyWith(useTimestampForRenaming: event.useTimestampForRenaming));
    });

    on<ToggleUseTipsForUploadedEvent>((event, emit) {
      prefs.setBool(
          SharedPreferencesKeys.useTipsForUploaded.name, event.useTipsForUploaded);
      emit(state.copyWith(useTipsForUploaded: event.useTipsForUploaded));
    });

    on<ToggleShouldForceDeleteEvent>((event, emit) {
      prefs.setBool(
          SharedPreferencesKeys.shouldForceDelete.name, event.shouldForceDelete);
      emit(state.copyWith(shouldForceDelete: event.shouldForceDelete));
    });

    on<ToggleNeedUpdateEvent>((event, emit) {
      emit(state.copyWith(needUpdate: event.needUpdate));
    });

    on<ToggleCanDragAndDropEvent>((event, emit) {
      prefs.setBool(SharedPreferencesKeys.canDragAndDrop.name, event.canDragAndDrop);
      emit(state.copyWith(canDragAndDrop: event.canDragAndDrop));
    });

    on<ToggleSupportMultiUploadEvent>((event, emit) {
      prefs.setBool(SharedPreferencesKeys.supportMultiUpload.name, event.supportMultiUpload);
      emit(state.copyWith(supportMultiUpload: event.supportMultiUpload));
    });

  }

  static SettingsState _loadSettingsFromPrefs() {
    final themeMode = LocalThemeMode.values.firstWhere(
      (e) =>
          e.name == prefs.getString(SharedPreferencesKeys.localThemeState.name),
      orElse: () => LocalThemeMode.system,
    );
    final preferLoadNetworkImages =
        prefs.getBool(SharedPreferencesKeys.preferLoadNetworkImages.name) ??
            false;
    final canRenameUploaded =
        prefs.getBool(SharedPreferencesKeys.canRenameUploaded.name) ??
            false;
    final useTimestampForRenaming =
        prefs.getBool(SharedPreferencesKeys.useTimestampForRenaming.name) ??
            false;
    final useTipsForUploaded =
        prefs.getBool(SharedPreferencesKeys.useTipsForUploaded.name) ?? false;
    final shouldForceDelete =
        prefs.getBool(SharedPreferencesKeys.shouldForceDelete.name) ?? false;
    final canDragAndDrop =
        prefs.getBool(SharedPreferencesKeys.canDragAndDrop.name) ?? false;
    final supportMultiUpload =
        prefs.getBool(SharedPreferencesKeys.supportMultiUpload.name) ?? false;
    // final canRename =
    //     prefs.getBool(SharedPreferencesKeys.canRenameUploaded.name) ?? false;

    return SettingsState(
      themeMode: themeMode,
      preferLoadNetworkImages: preferLoadNetworkImages,
      canRenameUploaded: canRenameUploaded,
      useTimestampForRenaming: useTimestampForRenaming,
      useTipsForUploaded: useTipsForUploaded,
      shouldForceDelete: shouldForceDelete,
      canDragAndDrop: canDragAndDrop,
      supportMultiUpload: supportMultiUpload,
      // canRename: canRename,
    );
  }
}
