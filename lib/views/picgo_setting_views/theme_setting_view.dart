import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ce_picgo/models/enums/theme_mode.dart';

import '../../bloc/theme_state/theme_bloc.dart';

class ThemeSettingView extends StatefulWidget {
  const ThemeSettingView({super.key});

  @override
  State<ThemeSettingView> createState() => _ThemeSettingViewState();
}

class _ThemeSettingViewState extends State<ThemeSettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('主题设置'),
      ),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return ListView(
            children: <Widget>[
              ListTile(
                title: Text(LocalThemeMode.system.toText()),
                trailing: state.themeMode == LocalThemeMode.system
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  changeThemeMode(LocalThemeMode.system);
                },
              ),
              ListTile(
                title: Text(LocalThemeMode.light.toText()),
                trailing: state.themeMode == LocalThemeMode.light
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  changeThemeMode(LocalThemeMode.light);
                },
              ),
              ListTile(
                title: Text(LocalThemeMode.dark.toText()),
                trailing: state.themeMode == LocalThemeMode.dark
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  changeThemeMode(LocalThemeMode.dark);
                },
              )
            ],
          );
        },
      ),
    );
  }

  changeThemeMode(LocalThemeMode themeMode) {
    context.read<ThemeBloc>().add(ThemeEventChange(themeMode: themeMode));
  }
}
