import 'package:flutter_ce_picgo/utils/env_util.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('env load test', () async {
    await dotenv.load(fileName: 'assets/env/.env.dev', mergeWith: {});
    var githubToken = dotenv.get('GITHUB_TOKEN');
    print(githubToken);
    var giteeToken = dotenv.get('GITEE_TOKEN');
    print(giteeToken);
  });

  test('log_enabled', () async {
    await dotenv.load(fileName: 'assets/env/.env.dev', mergeWith: {});
    var logEnabled = dotenv.get('LOG_ENABLED');
    print(logEnabled.runtimeType);
    print(bool.parse(logEnabled));
    print(bool.parse(logEnabled).runtimeType);
  });

  test('EnvUtil', () async {
    await EnvUtil.setup();
    print(env.logEnabled);
  });
}
