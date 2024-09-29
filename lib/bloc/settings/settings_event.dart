part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();
}

final class ToggleThemeEvent extends SettingsEvent {
  final LocalThemeMode themeMode;

  const ToggleThemeEvent({required this.themeMode});

  @override
  // TODO: implement props
  List<Object?> get props => [themeMode];
}
