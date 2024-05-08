import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/widgets/home_page_app_bar.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  _AlbumScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomePageAppBar(
          title: '相册',
        ),
        body: const Text('AlbumScreen'));
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
