part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();
}

final class ThemeEventChange extends ThemeEvent {
  final LocalThemeMode themeMode;

  const ThemeEventChange({required this.themeMode});

  @override
  // TODO: implement props
  List<Object?> get props => [themeMode];
}
