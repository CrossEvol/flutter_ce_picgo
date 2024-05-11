import 'package:flutter_ce_picgo/database/hive_db_provider.dart';
import 'package:flutter_ce_picgo/database/isar_db_provider.dart';
import 'package:flutter/foundation.dart';

import 'db_interface.dart';

DbInterface getInstance() {
  return switch (defaultTargetPlatform) {
    TargetPlatform.windows => HiveDbProvider(),
    _ => IsarDbProvider()
  };
}
