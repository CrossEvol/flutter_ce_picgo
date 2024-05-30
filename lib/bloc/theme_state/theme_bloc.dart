import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ce_picgo/constants/shared_preferences_keys.dart';
import 'package:flutter_ce_picgo/models/enums/theme_mode.dart';
import 'package:flutter_ce_picgo/utils/shared_preferences_ext.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(LocalThemeMode.system)) {
    on<ThemeEventChange>((event, emit) {
      prefs.setString(
          SharedPreferencesKeys.localThemeState.name, event.themeMode.name);
      emit(state.copyWith(themeMode: event.themeMode));
    });
    on<ThemeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
