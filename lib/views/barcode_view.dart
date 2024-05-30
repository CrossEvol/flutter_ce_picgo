import 'dart:convert';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:go_router/go_router.dart';
import 'package:json2yaml/json2yaml.dart';

import '../constants/image_storage_type.dart';
import '../database/db_interface.dart';

class BarCodeView extends StatefulWidget {
  const BarCodeView({super.key});

  @override
  State<BarCodeView> createState() => _BarCodeViewState();
}

class _BarCodeViewState extends State<BarCodeView> {
  _BarCodeViewState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            context.go('/settings/pb');
          },
        ),
        title: const Text('Config QrCode'),
      ),
      body: Center(
          child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return BarcodeWidget(
              barcode: Barcode.qrCode(), // Barcode type and settings
              data: '', // Content
              width: 200,
              height: 200,
            );
          }
          return BarcodeWidget(
            barcode: Barcode.qrCode(), // Barcode type and settings
            data: snapshot.data!, // Content
            width: 200,
            height: 200,
          );
        },
        future: getConfig(),
      )),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<String> getConfig() async {
    var githubConfigJson = await dbProvider.getImageStorageSettingConfig(
        type: ImageStorageType.github.name);
    var giteeConfigJson = await dbProvider.getImageStorageSettingConfig(
        type: ImageStorageType.gitee.name);
    Map<String, dynamic> map = {};
    map.putIfAbsent('github', () => jsonDecode(githubConfigJson));
    map.putIfAbsent('gitee', () => jsonDecode(giteeConfigJson));
    if (kDebugMode) {
      logger.i(map);
    }
    return json2yaml(map);
  }
}
