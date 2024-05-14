import 'package:flutter_test/flutter_test.dart';

void main() {
  test('record test', () {
    List<(String name, int age)> list = [];
    list.add(('a', 1));
    list.add(('b', 2));
    for (var element in list) {
      final (name, age) = element;
      print('name = $name, age = $age');
    }
  });
}
