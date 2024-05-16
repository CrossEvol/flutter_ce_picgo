import 'package:flutter_ce_picgo/models/enums/uploaded_state.dart';
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

  test('upload result record test', () async {
    var (a, b, c) = upload();
    print(a);
    print(b);
    print(c);
  });

  test('optional params', () {
    f(name: 'test', age: 18);
    f(name: 'abc');
    f();
    f(age: 18);
  });
}

typedef UploadResult = (String url, UploadState state, String sha);

void f({String? name, int? age}) {}

UploadResult upload() {
  return ('www.baidu.com', UploadState.completed, 'abc');
}
