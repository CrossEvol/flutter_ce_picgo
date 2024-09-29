part of 'settings_bloc.dart';

final class SettingsState extends Equatable {
  final LocalThemeMode themeMode;
  final bool preferLoadNetworkImages;
  final bool canRenameUploaded;
  final bool useTimestampForRenaming;
  final bool useTipsForUploaded;
  final bool shouldForceDelete;
  final bool needUpdate;
  final bool canDragAndDrop;
  final bool supportMultiUpload;

  const SettingsState({
    required this.themeMode,
    this.preferLoadNetworkImages = false,
    this.canRenameUploaded = false,
    this.useTimestampForRenaming = false,
    this.useTipsForUploaded = false,
    this.shouldForceDelete = false,
    this.needUpdate = false,
    this.canDragAndDrop = false,
    this.supportMultiUpload = false,
  });

  SettingsState copyWith({
    LocalThemeMode? themeMode,
    bool? preferLoadNetworkImages,
    bool? canRenameUploaded,
    bool? useTimestampForRenaming,
    bool? useTipsForUploaded,
    bool? shouldForceDelete,
    bool? needUpdate,
    bool? canDragAndDrop,
    bool? supportMultiUpload,
    bool? canRename,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      preferLoadNetworkImages:
          preferLoadNetworkImages ?? this.preferLoadNetworkImages,
      canRenameUploaded: canRenameUploaded ?? this.canRenameUploaded,
      useTimestampForRenaming:
          useTimestampForRenaming ?? this.useTimestampForRenaming,
      useTipsForUploaded: useTipsForUploaded ?? this.useTipsForUploaded,
      shouldForceDelete: shouldForceDelete ?? this.shouldForceDelete,
      needUpdate: needUpdate ?? this.needUpdate,
      canDragAndDrop: canDragAndDrop ?? this.canDragAndDrop,
      supportMultiUpload: supportMultiUpload ?? this.supportMultiUpload,
    );
  }

  @override
  List<Object?> get props => [
        themeMode,
        preferLoadNetworkImages,
        canRenameUploaded,
        useTimestampForRenaming,
        useTipsForUploaded,
        shouldForceDelete,
        needUpdate,
        canDragAndDrop,
        supportMultiUpload,
      ];
}
