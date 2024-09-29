import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ce_picgo/constants/shared_preferences_keys.dart';
import 'package:flutter_ce_picgo/models/enums/theme_mode.dart';
import 'package:flutter_ce_picgo/utils/shared_preferences_ext.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState(LocalThemeMode.system)) {
    on<ToggleThemeEvent>((event, emit) {
      prefs.setString(
          SharedPreferencesKeys.localThemeState.name, event.themeMode.name);
      emit(state.copyWith(themeMode: event.themeMode));
    });
    on<SettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
