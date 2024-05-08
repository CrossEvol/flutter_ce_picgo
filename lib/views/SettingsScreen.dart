import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/widgets/home_page_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  _SettingsScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomePageAppBar(title: '设置'),
        body: const Text('SettingsScreen'));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
