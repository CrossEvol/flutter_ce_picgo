// To parse this JSON data, do
//
//     final pubSpecModel = pubSpecModelFromJson(jsonString);

import 'dart:convert';

PubSpec pubSpecModelFromJson(String str) => PubSpec.fromJson(json.decode(str));

String pubSpecModelToJson(PubSpec data) => json.encode(data.toJson());

class PubSpec {
  String name;
  String description;
  String publishTo;
  String version;
  UnusedDependencies environment;
  UnusedDependencies dependencies;
  UnusedDependencies devDependencies;
  UnusedDependencies flutter;

  PubSpec({
    required this.name,
    required this.description,
    required this.publishTo,
    required this.version,
    required this.environment,
    required this.dependencies,
    required this.devDependencies,
    required this.flutter,
  });

  factory PubSpec.fromJson(Map<String, dynamic> json) => PubSpec(
    name: json["name"],
    description: json["description"],
    publishTo: json["publish_to"],
    version: json["version"],
    environment: UnusedDependencies.fromJson(json["environment"]),
    dependencies: UnusedDependencies.fromJson(json["dependencies"]),
    devDependencies: UnusedDependencies.fromJson(json["dev_dependencies"]),
    flutter: UnusedDependencies.fromJson(json["flutter"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "publish_to": publishTo,
    "version": version,
    "environment": environment.toJson(),
    "dependencies": dependencies.toJson(),
    "dev_dependencies": devDependencies.toJson(),
    "flutter": flutter.toJson(),
  };
}

class UnusedDependencies {
  UnusedDependencies();

  factory UnusedDependencies.fromJson(Map<String, dynamic> json) => UnusedDependencies(
  );

  Map<String, dynamic> toJson() => {
  };
}
