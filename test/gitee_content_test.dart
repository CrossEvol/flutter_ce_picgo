import 'dart:convert';
import 'dart:io';

import 'package:flutter_ce_picgo/models/gitee_content.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';

void main() {
  test('gitee_content serialization test', () async {
    await initLogger();

    var file = File(join('./', 'resources', 'gitee_upload_response.json'));
    var fileContent = await file.readAsString();
    var jsonData = jsonDecode(fileContent);
    var content = jsonData['content'];
    var githubContent = GiteeContent.fromJson(content);
    logger.i(githubContent);
    logger.w(githubContent.toJson());
  });
}
