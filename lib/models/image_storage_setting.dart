class PBSetting {
  int _id = 0;
  String _type = "";
  String _name = "";
  String _config = "";
  String _path = "";
  bool _visible = false;

  PBSetting();

  int get id => _id;
  String get type => _type;
  String get name => _name;
  String get config => _config;
  String get path => _path;
  bool get visible => _visible;

  PBSetting.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _type = map['type'];
    _name = map['name'];
    _config = map['config'];
    _path = map['path'];
    _visible = map['visible'] == 1;
  }

  Map<String, dynamic> toMap() {
    var map = {
      'id': _id,
      'type': _type,
      'name': _name,
      'config': _config,
      'path': _path,
      'visible': _visible ? 1 : 0,
    };
    return map;
  }
}
