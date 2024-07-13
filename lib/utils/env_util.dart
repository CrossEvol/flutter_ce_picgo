import 'package:flutter_dotenv/flutter_dotenv.dart';

late Env env;

class Env {
  final bool logEnabled;

  final bool dbLogEnabled;

  const Env({
    required this.logEnabled,
    required this.dbLogEnabled,
  });
}

class EnvUtil {
  static Future<void> setup() async {
    await dotenv.load(fileName: 'assets/env/.env.dev', mergeWith: {});
    env = Env(
        logEnabled: bool.parse(dotenv.get('LOG_ENABLED')),
        dbLogEnabled: bool.parse(dotenv.get('DB_LOG_ENABLED')));
  }
}
