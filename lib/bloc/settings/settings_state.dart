part of 'settings_bloc.dart';

final class SettingsState extends Equatable {
  final LocalThemeMode themeMode;

  const SettingsState(this.themeMode);

  SettingsState copyWith({
    LocalThemeMode? themeMode,
  }) {
    return SettingsState(themeMode ?? this.themeMode);
  }

  @override
  List<Object?> get props => [themeMode];
}
