import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('setTimeout', () async {
    // Set a task to execute after 2 seconds
    Duration duration = const Duration(seconds: 2);
    Future.delayed(duration, () {
      print('Task executed after 2 seconds');
    });

    print('Task scheduled, waiting...');

    sleep(const Duration(seconds: 3));
  });

  test('TimeTest', () {
    print('${DateTime.now().millisecondsSinceEpoch}');
    print('${DateTime.now().microsecondsSinceEpoch}');
    print('${DateTime.now().microsecondsSinceEpoch}');
  });
}
