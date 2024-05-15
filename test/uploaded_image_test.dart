import 'dart:convert';

import 'package:flutter_ce_picgo/models/enums/uploaded_state.dart';
import 'package:flutter_ce_picgo/models/uploaded_image.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('uploaded_image json test', () {
    var uploadedImage = UploadedImage(
        id: 0,
        filepath: '/usr/pwd/1.jpg',
        storageType: 'github',
        url: 'www.baidu.com',
        name: 'name',
        state: UploadState.completed,
        createTime: DateTime.utc(1999,9,9,9,9,9),
        uploadTime: DateTime.utc(1999,9,9,9,9,9));
    var map = uploadedImage.toJson();
    print(jsonEncode(map));
    map.remove('id');
    print(jsonEncode(map));
  });

  test('iso8601', (){
    print(DateTime.now().toIso8601String());
    print(DateTime.utc(2000).toLocal().toString());
    print(DateTime.now().toString());
  });
}
