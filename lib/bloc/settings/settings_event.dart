part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();
}

final class ToggleThemeEvent extends SettingsEvent {
  final LocalThemeMode themeMode;

  const ToggleThemeEvent({required this.themeMode});

  @override
  List<Object?> get props => [themeMode];
}

final class TogglePreferLoadNetworkImagesEvent extends SettingsEvent {
  final bool preferLoadNetworkImages;

  const TogglePreferLoadNetworkImagesEvent({required this.preferLoadNetworkImages});

  @override
  List<Object?> get props => [preferLoadNetworkImages];
}

final class ToggleCanRenameUploadedEvent extends SettingsEvent {
  final bool canRenameUploaded;

  const ToggleCanRenameUploadedEvent({required this.canRenameUploaded});

  @override
  List<Object?> get props => [canRenameUploaded];
}

final class ToggleUseTimestampForRenamingEvent extends SettingsEvent {
  final bool useTimestampForRenaming;

  const ToggleUseTimestampForRenamingEvent({required this.useTimestampForRenaming});

  @override
  List<Object?> get props => [useTimestampForRenaming];
}

final class ToggleUseTipsForUploadedEvent extends SettingsEvent {
  final bool useTipsForUploaded;

  const ToggleUseTipsForUploadedEvent({required this.useTipsForUploaded});

  @override
  List<Object?> get props => [useTipsForUploaded];
}

final class ToggleShouldForceDeleteEvent extends SettingsEvent {
  final bool shouldForceDelete;

  const ToggleShouldForceDeleteEvent({required this.shouldForceDelete});

  @override
  List<Object?> get props => [shouldForceDelete];
}

final class ToggleNeedUpdateEvent extends SettingsEvent {
  final bool needUpdate;

  const ToggleNeedUpdateEvent({required this.needUpdate});

  @override
  List<Object?> get props => [needUpdate];
}

final class ToggleCanDragAndDropEvent extends SettingsEvent {
  final bool canDragAndDrop;

  const ToggleCanDragAndDropEvent({required this.canDragAndDrop});

  @override
  List<Object?> get props => [canDragAndDrop];
}

final class ToggleSupportMultiUploadEvent extends SettingsEvent {
  final bool supportMultiUpload;

  const ToggleSupportMultiUploadEvent({required this.supportMultiUpload});

  @override
  List<Object?> get props => [supportMultiUpload];
}