import 'package:flutter/foundation.dart';
import 'package:flutter_ce_picgo/database/isar_db_provider.dart';
import 'package:flutter_ce_picgo/database/sqflite_db_provider.dart';

import 'db_interface.dart';

DbInterface getInstance() {
  return switch (defaultTargetPlatform) {
    TargetPlatform.windows => SqfliteDbProvider(),
    TargetPlatform.android => IsarDbProvider(),
    _ => throw UnimplementedError('Unsupported Platform')
  };
}
