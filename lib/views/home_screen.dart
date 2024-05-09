import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/views/album_screen.dart';
import 'package:flutter_ce_picgo/views/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  _HomeScreenState();

  final List<Widget> _screens = [const AlbumScreen(), const SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('HomeScreen'),
        // ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.lightBlue,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.photo_album),
              icon: Icon(Icons.photo_album_outlined),
              label: '相册',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings_applications),
              icon: Badge(child: Icon(Icons.settings_applications_outlined)),
              label: '设置',
            ),
          ],
        ),
        body: _screens[currentPageIndex]);
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
