import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

late Logger logger;

Future<void> initLogger() async {
  var filePath = "";
  if (!kDebugMode && !kIsWeb) {
    var dir = await getApplicationDocumentsDirectory();
    filePath = join(dir.path, 'logs', 'app.log');
  }

  logger = Logger(
    filter: ProductionFilter(),
    printer: PrettyPrinter(),
    output: kDebugMode ? ConsoleOutput() : FileOutput(file: File(filePath)),
  );
}
