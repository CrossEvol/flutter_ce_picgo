import 'package:flutter_test/flutter_test.dart';

void main() {
  test('', () {
    Boy boy = ParentFactory.instance.getChild<Boy>(Sex.boy);
    print(boy.a());
    print(boy.b());
    print(boy.c());
    Girl girl = ParentFactory.instance.getChild<Girl>(Sex.girl);
    print(girl.a());
    print(girl.b());
    print(girl.c());
  });
}

class ParentFactory {
  ParentFactory._();

  static final ParentFactory _instance = ParentFactory._();

  static ParentFactory get instance => _instance;

  T getChild<T extends Parent>(Sex sex) {
    switch (sex) {
      case Sex.boy:
        return Boy() as T;
      case Sex.girl:
        return Girl() as T;
    }
  }
}

class AP {}

class BP {}

class CP {}

abstract class Parent<A extends AP, B extends BP, C extends CP> {
  A a();

  B b();

  C c();
}

class ABoy extends AP {}

class BBoy extends BP {}

class CBoy extends CP {}

class Boy implements Parent<ABoy, BBoy, CBoy> {
  @override
  ABoy a() {
    return ABoy();
  }

  @override
  BBoy b() {
    return BBoy();
  }

  @override
  CBoy c() {
    return CBoy();
  }
}

class AGril extends AP {}

class BGril extends BP {}

class CGril extends CP {}

class Girl extends Parent<AGril, BGril, CGril> {
  @override
  AGril a() {
    return AGril();
  }

  @override
  BGril b() {
    return BGril();
  }

  @override
  CGril c() {
    return CGril();
  }
}

enum Sex { boy, girl }
