import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/models/enums/uploaded_state.dart';
import 'package:flutter_ce_picgo/models/uploaded_image.dart';
import 'package:flutter_ce_picgo/utils/strategy/image_upload_strategy.dart';
import 'package:flutter_ce_picgo/utils/strategy/upload_strategy_factory.dart';
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
    var uploadStrategy =
        UploadStrategyFactory.getUploadStrategy(ImageStorageType.github);
    var (url, state) = await uploadStrategy.upload0(UploadedImage(
        id: 0,
        filepath: '',
        storageType: '',
        url: '',
        name: '',
        state: UploadState.uploading,
        createTime: DateTime.now(),
        uploadTime: DateTime.now()));
    expect(url, isNotNull);
    expect(state, isNotNull);
  });

  test('optional params', (){
      f(name: 'test',age: 18);
      f(name: 'abc');
      f();
      f(age: 18);
  });
}


void f({String? name , int? age}){

}