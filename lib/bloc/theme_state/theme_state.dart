part of 'theme_bloc.dart';

final class ThemeState extends Equatable {
  final LocalThemeMode themeMode;

  const ThemeState(this.themeMode);

  ThemeState copyWith({
    LocalThemeMode? themeMode,
  }) {
    return ThemeState(themeMode ?? this.themeMode);
  }

  @override
  List<Object?> get props => [themeMode];
}
