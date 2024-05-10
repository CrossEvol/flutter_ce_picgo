// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      name: json['name'] as String,
      value: json['value'] as String,
      label: json['label'] as String,
      needValidate: json['needValidate'] as bool,
      placeholder: json['placeholder'] as String,
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'label': instance.label,
      'needValidate': instance.needValidate,
      'placeholder': instance.placeholder,
    };
