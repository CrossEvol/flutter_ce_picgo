
import 'package:flutter_test/flutter_test.dart';
import 'package:json2yaml/json2yaml.dart';
import 'package:yaml/yaml.dart';

void main(){
  test('json2yaml tests', (){
    const developerData = {
      'name': "Martin D'vloper",
      'job': 'Developer',
      'skill': 'Elite',
      'employed': true,
      'foods': ['Apple', 'Orange', 'Strawberry', 'Mango'],
      'languages': {
        'perl': 'Elite',
        'python': 'Elite',
        'pascal': 'Lame',
      },
      'education': '4 GCSEs\n3 A-Levels\nBSc in the Internet of Things'
    };

    print(json2yaml(developerData));
  });

  test('yaml2json tests', (){
    const yaml = '''
github:
  branch: master
  customUrl: null
  path: img/
  repo: ce/picgo
  token: abc
gitee:
  owner: hack
  path: image/
  repo: picgo
  token: erf
  customUrl: null
  branch: master
    ''';
    var map = loadYaml(yaml);
    print(map);
  });
}