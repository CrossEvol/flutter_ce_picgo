
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('version compare', (){
    var v1 = '1.0.0+1';
    var v2 = '3.2.6';
    var compareTo = v1.compareTo(v2);
    print(compareTo);
  });

  test('DateTime diff', (){
      var duration = DateTime.now().difference(DateTime.now().add(const Duration(hours: 24)));
      print(duration.inHours);
  });
}