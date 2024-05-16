

import 'package:flutter_test/flutter_test.dart';

void main(){
  test('map unchanged test', (){
    Map<String,String> map = {};
    map.putIfAbsent('k1', () => 'v1');
    map.putIfAbsent('k2', () => 'v2');
    print(map);
  });
}