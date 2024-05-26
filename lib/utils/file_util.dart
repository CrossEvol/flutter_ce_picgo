import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';

Future<bool> saveBase64ToFile(String base64String, String filePath) async {
  try {
    final bytes = base64Decode(base64String.replaceAll('\n', ''));
    final file = File(filePath);
    await file.writeAsBytes(bytes);

    if (kDebugMode) {
      logger.i('File saved to: $filePath');
    }
    return true;
  } catch (e) {
    logger.e(e);
    return false;
  }
}
