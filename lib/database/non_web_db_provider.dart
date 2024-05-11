import 'package:flutter/foundation.dart';
import 'package:flutter_ce_picgo/database/sqflite_db_provider.dart';

import 'db_interface.dart';

DbInterface getInstance() {
  return switch (defaultTargetPlatform) {
    TargetPlatform.windows => SqfliteDbProvider(),
    _ => SqfliteDbProvider()
  };
}
