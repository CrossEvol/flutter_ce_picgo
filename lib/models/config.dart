import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable()
class Config {
  String name;
  String value;
  String label;
  bool needValidate;
  String placeholder;

  Config(
      {required this.name,
      required this.value,
      required this.label,
      required this.needValidate,
      required this.placeholder});

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}
