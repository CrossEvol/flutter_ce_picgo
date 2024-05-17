import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme_state.dart';

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
      body: Consumer<ThemeState>(
        builder: (context, themeState, child) {
          return ListView(
            children: <Widget>[
              ListTile(
                title: Text(ThemeState.modeMap[ThemeMode.system]!),
                trailing: themeState.currentMode == ThemeMode.system
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  _changeThemeMode(themeState, ThemeMode.system);
                },
              ),
              ListTile(
                title: Text(ThemeState.modeMap[ThemeMode.light]!),
                trailing: themeState.currentMode == ThemeMode.light
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  _changeThemeMode(themeState, ThemeMode.light);
                },
              ),
              ListTile(
                title: Text(ThemeState.modeMap[ThemeMode.dark]!),
                trailing: themeState.currentMode == ThemeMode.dark
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  _changeThemeMode(themeState, ThemeMode.dark);
                },
              )
            ],
          );
        },
      ),
    );
  }

  _changeThemeMode(ThemeState state, ThemeMode mode) {
    state.changeThemeState(mode);
  }
}
