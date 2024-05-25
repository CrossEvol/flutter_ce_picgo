import 'dart:io';

import 'package:flutter/material.dart';

void main() async {
  runApp(const MaterialApp(
    home: CacheImage(),
  ));
}

class CacheImage extends StatefulWidget {
  const CacheImage({super.key});

  @override
  State<CacheImage> createState() => _CacheImageState();
}

class _CacheImageState extends State<CacheImage> {
  _CacheImageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CacheImage'),
        ),
        body: Center(child: Image(image: FileImage(File(r'D:\PotPlayer\Capture\[Airota&VCB-Studio] Saenai Heroine no Sodatekata [10][1080p][x264_aac].mp4_20230303_005009.608.jpg')))),);
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
