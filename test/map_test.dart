import 'package:flutter_test/flutter_test.dart';

void main() {
  test('map unchanged test', () {
    Map<String, String> map = {};
    map.putIfAbsent('k1', () => 'v1');
    map.putIfAbsent('k2', () => 'v2');
    print(map);
  });

  test('map combine test', () {
    Map<String, String> map1 = {"name": "Alice", "age": "25"};
    Map<String, String> map2 = {"city": "New York"};
    Map<String, String> map3 = const {};

    Map<String, dynamic> combinedMap = {
      ...map1,
      ...map2,
      ...map3,
      ...const {'k1': 'v1'},...{'k1':null}
    };

    print(combinedMap);
  });
}
