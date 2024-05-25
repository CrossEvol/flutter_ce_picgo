import 'package:flutter/foundation.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:path_provider/path_provider.dart';

late String appDirectory;

Future<void> setupAppDirectory() async {
  appDirectory = (await getApplicationDocumentsDirectory()).path;
  if(kDebugMode){
    logger.i(appDirectory);
  }
}
