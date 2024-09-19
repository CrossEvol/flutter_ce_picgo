// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sqflite_db_provider.dart';

// ignore_for_file: type=lint
class $PbSettingsTTable extends PbSettingsT
    with TableInfo<$PbSettingsTTable, pb_setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PbSettingsTTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _configMeta = const VerificationMeta('config');
  @override
  late final GeneratedColumn<String> config = GeneratedColumn<String>(
      'config', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 10000),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _visibleMeta =
      const VerificationMeta('visible');
  @override
  late final GeneratedColumn<int> visible = GeneratedColumn<int>(
      'visible', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns => [id, type, path, name, config, visible];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pb_settings_t';
  @override
  VerificationContext validateIntegrity(Insertable<pb_setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('config')) {
      context.handle(_configMeta,
          config.isAcceptableOrUnknown(data['config']!, _configMeta));
    }
    if (data.containsKey('visible')) {
      context.handle(_visibleMeta,
          visible.isAcceptableOrUnknown(data['visible']!, _visibleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  pb_setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return pb_setting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      config: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}config'])!,
      visible: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}visible'])!,
    );
  }

  @override
  $PbSettingsTTable createAlias(String alias) {
    return $PbSettingsTTable(attachedDatabase, alias);
  }
}

class pb_setting extends DataClass implements Insertable<pb_setting> {
  final int id;
  final String type;
  final String path;
  final String name;
  final String config;
  final int visible;
  const pb_setting(
      {required this.id,
      required this.type,
      required this.path,
      required this.name,
      required this.config,
      required this.visible});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    map['path'] = Variable<String>(path);
    map['name'] = Variable<String>(name);
    map['config'] = Variable<String>(config);
    map['visible'] = Variable<int>(visible);
    return map;
  }

  PbSettingsTCompanion toCompanion(bool nullToAbsent) {
    return PbSettingsTCompanion(
      id: Value(id),
      type: Value(type),
      path: Value(path),
      name: Value(name),
      config: Value(config),
      visible: Value(visible),
    );
  }

  factory pb_setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return pb_setting(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      path: serializer.fromJson<String>(json['path']),
      name: serializer.fromJson<String>(json['name']),
      config: serializer.fromJson<String>(json['config']),
      visible: serializer.fromJson<int>(json['visible']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'path': serializer.toJson<String>(path),
      'name': serializer.toJson<String>(name),
      'config': serializer.toJson<String>(config),
      'visible': serializer.toJson<int>(visible),
    };
  }

  pb_setting copyWith(
          {int? id,
          String? type,
          String? path,
          String? name,
          String? config,
          int? visible}) =>
      pb_setting(
        id: id ?? this.id,
        type: type ?? this.type,
        path: path ?? this.path,
        name: name ?? this.name,
        config: config ?? this.config,
        visible: visible ?? this.visible,
      );
  @override
  String toString() {
    return (StringBuffer('pb_setting(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('path: $path, ')
          ..write('name: $name, ')
          ..write('config: $config, ')
          ..write('visible: $visible')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, path, name, config, visible);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is pb_setting &&
          other.id == this.id &&
          other.type == this.type &&
          other.path == this.path &&
          other.name == this.name &&
          other.config == this.config &&
          other.visible == this.visible);
}

class PbSettingsTCompanion extends UpdateCompanion<pb_setting> {
  final Value<int> id;
  final Value<String> type;
  final Value<String> path;
  final Value<String> name;
  final Value<String> config;
  final Value<int> visible;
  const PbSettingsTCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.path = const Value.absent(),
    this.name = const Value.absent(),
    this.config = const Value.absent(),
    this.visible = const Value.absent(),
  });
  PbSettingsTCompanion.insert({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.path = const Value.absent(),
    this.name = const Value.absent(),
    this.config = const Value.absent(),
    this.visible = const Value.absent(),
  });
  static Insertable<pb_setting> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<String>? path,
    Expression<String>? name,
    Expression<String>? config,
    Expression<int>? visible,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (path != null) 'path': path,
      if (name != null) 'name': name,
      if (config != null) 'config': config,
      if (visible != null) 'visible': visible,
    });
  }

  PbSettingsTCompanion copyWith(
      {Value<int>? id,
      Value<String>? type,
      Value<String>? path,
      Value<String>? name,
      Value<String>? config,
      Value<int>? visible}) {
    return PbSettingsTCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      path: path ?? this.path,
      name: name ?? this.name,
      config: config ?? this.config,
      visible: visible ?? this.visible,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (config.present) {
      map['config'] = Variable<String>(config.value);
    }
    if (visible.present) {
      map['visible'] = Variable<int>(visible.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PbSettingsTCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('path: $path, ')
          ..write('name: $name, ')
          ..write('config: $config, ')
          ..write('visible: $visible')
          ..write(')'))
        .toString();
  }
}

class $UploadedImagesTTable extends UploadedImagesT
    with TableInfo<$UploadedImagesTTable, uploaded_image> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UploadedImagesTTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _filepathMeta =
      const VerificationMeta('filepath');
  @override
  late final GeneratedColumn<String> filepath = GeneratedColumn<String>(
      'filepath', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _storageTypeMeta =
      const VerificationMeta('storageType');
  @override
  late final GeneratedColumn<String> storageType = GeneratedColumn<String>(
      'storage_type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _shaMeta = const VerificationMeta('sha');
  @override
  late final GeneratedColumn<String> sha =
      GeneratedColumn<String>('sha', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 0,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant(""));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
      'create_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _uploadTimeMeta =
      const VerificationMeta('uploadTime');
  @override
  late final GeneratedColumn<DateTime> uploadTime = GeneratedColumn<DateTime>(
      'upload_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        filepath,
        storageType,
        url,
        sha,
        name,
        state,
        createTime,
        uploadTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'uploaded_images_t';
  @override
  VerificationContext validateIntegrity(Insertable<uploaded_image> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('filepath')) {
      context.handle(_filepathMeta,
          filepath.isAcceptableOrUnknown(data['filepath']!, _filepathMeta));
    }
    if (data.containsKey('storage_type')) {
      context.handle(
          _storageTypeMeta,
          storageType.isAcceptableOrUnknown(
              data['storage_type']!, _storageTypeMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    if (data.containsKey('sha')) {
      context.handle(
          _shaMeta, sha.isAcceptableOrUnknown(data['sha']!, _shaMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    }
    if (data.containsKey('upload_time')) {
      context.handle(
          _uploadTimeMeta,
          uploadTime.isAcceptableOrUnknown(
              data['upload_time']!, _uploadTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  uploaded_image map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return uploaded_image(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      filepath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}filepath'])!,
      storageType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}storage_type'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      sha: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sha'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state'])!,
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      uploadTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}upload_time'])!,
    );
  }

  @override
  $UploadedImagesTTable createAlias(String alias) {
    return $UploadedImagesTTable(attachedDatabase, alias);
  }
}

class uploaded_image extends DataClass implements Insertable<uploaded_image> {
  final int id;
  final String filepath;
  final String storageType;
  final String url;
  final String sha;
  final String name;
  final String state;
  final DateTime createTime;
  final DateTime uploadTime;
  const uploaded_image(
      {required this.id,
      required this.filepath,
      required this.storageType,
      required this.url,
      required this.sha,
      required this.name,
      required this.state,
      required this.createTime,
      required this.uploadTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['filepath'] = Variable<String>(filepath);
    map['storage_type'] = Variable<String>(storageType);
    map['url'] = Variable<String>(url);
    map['sha'] = Variable<String>(sha);
    map['name'] = Variable<String>(name);
    map['state'] = Variable<String>(state);
    map['create_time'] = Variable<DateTime>(createTime);
    map['upload_time'] = Variable<DateTime>(uploadTime);
    return map;
  }

  UploadedImagesTCompanion toCompanion(bool nullToAbsent) {
    return UploadedImagesTCompanion(
      id: Value(id),
      filepath: Value(filepath),
      storageType: Value(storageType),
      url: Value(url),
      sha: Value(sha),
      name: Value(name),
      state: Value(state),
      createTime: Value(createTime),
      uploadTime: Value(uploadTime),
    );
  }

  factory uploaded_image.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return uploaded_image(
      id: serializer.fromJson<int>(json['id']),
      filepath: serializer.fromJson<String>(json['filepath']),
      storageType: serializer.fromJson<String>(json['storage_type']),
      url: serializer.fromJson<String>(json['url']),
      sha: serializer.fromJson<String>(json['sha']),
      name: serializer.fromJson<String>(json['name']),
      state: serializer.fromJson<String>(json['state']),
      createTime: serializer.fromJson<DateTime>(json['create_time']),
      uploadTime: serializer.fromJson<DateTime>(json['upload_time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'filepath': serializer.toJson<String>(filepath),
      'storage_type': serializer.toJson<String>(storageType),
      'url': serializer.toJson<String>(url),
      'sha': serializer.toJson<String>(sha),
      'name': serializer.toJson<String>(name),
      'state': serializer.toJson<String>(state),
      'create_time': serializer.toJson<DateTime>(createTime),
      'upload_time': serializer.toJson<DateTime>(uploadTime),
    };
  }

  uploaded_image copyWith(
          {int? id,
          String? filepath,
          String? storageType,
          String? url,
          String? sha,
          String? name,
          String? state,
          DateTime? createTime,
          DateTime? uploadTime}) =>
      uploaded_image(
        id: id ?? this.id,
        filepath: filepath ?? this.filepath,
        storageType: storageType ?? this.storageType,
        url: url ?? this.url,
        sha: sha ?? this.sha,
        name: name ?? this.name,
        state: state ?? this.state,
        createTime: createTime ?? this.createTime,
        uploadTime: uploadTime ?? this.uploadTime,
      );
  @override
  String toString() {
    return (StringBuffer('uploaded_image(')
          ..write('id: $id, ')
          ..write('filepath: $filepath, ')
          ..write('storageType: $storageType, ')
          ..write('url: $url, ')
          ..write('sha: $sha, ')
          ..write('name: $name, ')
          ..write('state: $state, ')
          ..write('createTime: $createTime, ')
          ..write('uploadTime: $uploadTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, filepath, storageType, url, sha, name, state, createTime, uploadTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is uploaded_image &&
          other.id == this.id &&
          other.filepath == this.filepath &&
          other.storageType == this.storageType &&
          other.url == this.url &&
          other.sha == this.sha &&
          other.name == this.name &&
          other.state == this.state &&
          other.createTime == this.createTime &&
          other.uploadTime == this.uploadTime);
}

class UploadedImagesTCompanion extends UpdateCompanion<uploaded_image> {
  final Value<int> id;
  final Value<String> filepath;
  final Value<String> storageType;
  final Value<String> url;
  final Value<String> sha;
  final Value<String> name;
  final Value<String> state;
  final Value<DateTime> createTime;
  final Value<DateTime> uploadTime;
  const UploadedImagesTCompanion({
    this.id = const Value.absent(),
    this.filepath = const Value.absent(),
    this.storageType = const Value.absent(),
    this.url = const Value.absent(),
    this.sha = const Value.absent(),
    this.name = const Value.absent(),
    this.state = const Value.absent(),
    this.createTime = const Value.absent(),
    this.uploadTime = const Value.absent(),
  });
  UploadedImagesTCompanion.insert({
    this.id = const Value.absent(),
    this.filepath = const Value.absent(),
    this.storageType = const Value.absent(),
    this.url = const Value.absent(),
    this.sha = const Value.absent(),
    this.name = const Value.absent(),
    this.state = const Value.absent(),
    this.createTime = const Value.absent(),
    this.uploadTime = const Value.absent(),
  });
  static Insertable<uploaded_image> custom({
    Expression<int>? id,
    Expression<String>? filepath,
    Expression<String>? storageType,
    Expression<String>? url,
    Expression<String>? sha,
    Expression<String>? name,
    Expression<String>? state,
    Expression<DateTime>? createTime,
    Expression<DateTime>? uploadTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (filepath != null) 'filepath': filepath,
      if (storageType != null) 'storage_type': storageType,
      if (url != null) 'url': url,
      if (sha != null) 'sha': sha,
      if (name != null) 'name': name,
      if (state != null) 'state': state,
      if (createTime != null) 'create_time': createTime,
      if (uploadTime != null) 'upload_time': uploadTime,
    });
  }

  UploadedImagesTCompanion copyWith(
      {Value<int>? id,
      Value<String>? filepath,
      Value<String>? storageType,
      Value<String>? url,
      Value<String>? sha,
      Value<String>? name,
      Value<String>? state,
      Value<DateTime>? createTime,
      Value<DateTime>? uploadTime}) {
    return UploadedImagesTCompanion(
      id: id ?? this.id,
      filepath: filepath ?? this.filepath,
      storageType: storageType ?? this.storageType,
      url: url ?? this.url,
      sha: sha ?? this.sha,
      name: name ?? this.name,
      state: state ?? this.state,
      createTime: createTime ?? this.createTime,
      uploadTime: uploadTime ?? this.uploadTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (filepath.present) {
      map['filepath'] = Variable<String>(filepath.value);
    }
    if (storageType.present) {
      map['storage_type'] = Variable<String>(storageType.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (sha.present) {
      map['sha'] = Variable<String>(sha.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (uploadTime.present) {
      map['upload_time'] = Variable<DateTime>(uploadTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UploadedImagesTCompanion(')
          ..write('id: $id, ')
          ..write('filepath: $filepath, ')
          ..write('storageType: $storageType, ')
          ..write('url: $url, ')
          ..write('sha: $sha, ')
          ..write('name: $name, ')
          ..write('state: $state, ')
          ..write('createTime: $createTime, ')
          ..write('uploadTime: $uploadTime')
          ..write(')'))
        .toString();
  }
}

class $DownloadedImagesTTable extends DownloadedImagesT
    with TableInfo<$DownloadedImagesTTable, downloaded_image> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DownloadedImagesTTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _localUrlMeta =
      const VerificationMeta('localUrl');
  @override
  late final GeneratedColumn<String> localUrl = GeneratedColumn<String>(
      'local_url', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _remoteUrlMeta =
      const VerificationMeta('remoteUrl');
  @override
  late final GeneratedColumn<String> remoteUrl = GeneratedColumn<String>(
      'remote_url', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
      defaultValue: const Constant(""));
  static const VerificationMeta _downloadUrlMeta =
      const VerificationMeta('downloadUrl');
  @override
  late final GeneratedColumn<String> downloadUrl = GeneratedColumn<String>(
      'download_url', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _shaMeta = const VerificationMeta('sha');
  @override
  late final GeneratedColumn<String> sha =
      GeneratedColumn<String>('sha', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 0,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant(""));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _parentPathMeta =
      const VerificationMeta('parentPath');
  @override
  late final GeneratedColumn<String> parentPath = GeneratedColumn<String>(
      'parent_path', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1000),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, localUrl, remoteUrl, downloadUrl, sha, createdAt, parentPath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'downloaded_images_t';
  @override
  VerificationContext validateIntegrity(Insertable<downloaded_image> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('local_url')) {
      context.handle(_localUrlMeta,
          localUrl.isAcceptableOrUnknown(data['local_url']!, _localUrlMeta));
    }
    if (data.containsKey('remote_url')) {
      context.handle(_remoteUrlMeta,
          remoteUrl.isAcceptableOrUnknown(data['remote_url']!, _remoteUrlMeta));
    }
    if (data.containsKey('download_url')) {
      context.handle(
          _downloadUrlMeta,
          downloadUrl.isAcceptableOrUnknown(
              data['download_url']!, _downloadUrlMeta));
    }
    if (data.containsKey('sha')) {
      context.handle(
          _shaMeta, sha.isAcceptableOrUnknown(data['sha']!, _shaMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('parent_path')) {
      context.handle(
          _parentPathMeta,
          parentPath.isAcceptableOrUnknown(
              data['parent_path']!, _parentPathMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  downloaded_image map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return downloaded_image(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      localUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_url'])!,
      remoteUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_url'])!,
      downloadUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}download_url'])!,
      sha: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sha'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      parentPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_path'])!,
    );
  }

  @override
  $DownloadedImagesTTable createAlias(String alias) {
    return $DownloadedImagesTTable(attachedDatabase, alias);
  }
}

class downloaded_image extends DataClass
    implements Insertable<downloaded_image> {
  final int id;
  final String name;
  final String localUrl;
  final String remoteUrl;
  final String downloadUrl;
  final String sha;
  final DateTime createdAt;
  final String parentPath;
  const downloaded_image(
      {required this.id,
      required this.name,
      required this.localUrl,
      required this.remoteUrl,
      required this.downloadUrl,
      required this.sha,
      required this.createdAt,
      required this.parentPath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['local_url'] = Variable<String>(localUrl);
    map['remote_url'] = Variable<String>(remoteUrl);
    map['download_url'] = Variable<String>(downloadUrl);
    map['sha'] = Variable<String>(sha);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['parent_path'] = Variable<String>(parentPath);
    return map;
  }

  DownloadedImagesTCompanion toCompanion(bool nullToAbsent) {
    return DownloadedImagesTCompanion(
      id: Value(id),
      name: Value(name),
      localUrl: Value(localUrl),
      remoteUrl: Value(remoteUrl),
      downloadUrl: Value(downloadUrl),
      sha: Value(sha),
      createdAt: Value(createdAt),
      parentPath: Value(parentPath),
    );
  }

  factory downloaded_image.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return downloaded_image(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      localUrl: serializer.fromJson<String>(json['local_url']),
      remoteUrl: serializer.fromJson<String>(json['remote_url']),
      downloadUrl: serializer.fromJson<String>(json['download_url']),
      sha: serializer.fromJson<String>(json['sha']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      parentPath: serializer.fromJson<String>(json['parent_path']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'local_url': serializer.toJson<String>(localUrl),
      'remote_url': serializer.toJson<String>(remoteUrl),
      'download_url': serializer.toJson<String>(downloadUrl),
      'sha': serializer.toJson<String>(sha),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'parent_path': serializer.toJson<String>(parentPath),
    };
  }

  downloaded_image copyWith(
          {int? id,
          String? name,
          String? localUrl,
          String? remoteUrl,
          String? downloadUrl,
          String? sha,
          DateTime? createdAt,
          String? parentPath}) =>
      downloaded_image(
        id: id ?? this.id,
        name: name ?? this.name,
        localUrl: localUrl ?? this.localUrl,
        remoteUrl: remoteUrl ?? this.remoteUrl,
        downloadUrl: downloadUrl ?? this.downloadUrl,
        sha: sha ?? this.sha,
        createdAt: createdAt ?? this.createdAt,
        parentPath: parentPath ?? this.parentPath,
      );
  @override
  String toString() {
    return (StringBuffer('downloaded_image(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('localUrl: $localUrl, ')
          ..write('remoteUrl: $remoteUrl, ')
          ..write('downloadUrl: $downloadUrl, ')
          ..write('sha: $sha, ')
          ..write('createdAt: $createdAt, ')
          ..write('parentPath: $parentPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, localUrl, remoteUrl, downloadUrl, sha, createdAt, parentPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is downloaded_image &&
          other.id == this.id &&
          other.name == this.name &&
          other.localUrl == this.localUrl &&
          other.remoteUrl == this.remoteUrl &&
          other.downloadUrl == this.downloadUrl &&
          other.sha == this.sha &&
          other.createdAt == this.createdAt &&
          other.parentPath == this.parentPath);
}

class DownloadedImagesTCompanion extends UpdateCompanion<downloaded_image> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> localUrl;
  final Value<String> remoteUrl;
  final Value<String> downloadUrl;
  final Value<String> sha;
  final Value<DateTime> createdAt;
  final Value<String> parentPath;
  const DownloadedImagesTCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.localUrl = const Value.absent(),
    this.remoteUrl = const Value.absent(),
    this.downloadUrl = const Value.absent(),
    this.sha = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.parentPath = const Value.absent(),
  });
  DownloadedImagesTCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.localUrl = const Value.absent(),
    this.remoteUrl = const Value.absent(),
    this.downloadUrl = const Value.absent(),
    this.sha = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.parentPath = const Value.absent(),
  });
  static Insertable<downloaded_image> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? localUrl,
    Expression<String>? remoteUrl,
    Expression<String>? downloadUrl,
    Expression<String>? sha,
    Expression<DateTime>? createdAt,
    Expression<String>? parentPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (localUrl != null) 'local_url': localUrl,
      if (remoteUrl != null) 'remote_url': remoteUrl,
      if (downloadUrl != null) 'download_url': downloadUrl,
      if (sha != null) 'sha': sha,
      if (createdAt != null) 'created_at': createdAt,
      if (parentPath != null) 'parent_path': parentPath,
    });
  }

  DownloadedImagesTCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? localUrl,
      Value<String>? remoteUrl,
      Value<String>? downloadUrl,
      Value<String>? sha,
      Value<DateTime>? createdAt,
      Value<String>? parentPath}) {
    return DownloadedImagesTCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      localUrl: localUrl ?? this.localUrl,
      remoteUrl: remoteUrl ?? this.remoteUrl,
      downloadUrl: downloadUrl ?? this.downloadUrl,
      sha: sha ?? this.sha,
      createdAt: createdAt ?? this.createdAt,
      parentPath: parentPath ?? this.parentPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (localUrl.present) {
      map['local_url'] = Variable<String>(localUrl.value);
    }
    if (remoteUrl.present) {
      map['remote_url'] = Variable<String>(remoteUrl.value);
    }
    if (downloadUrl.present) {
      map['download_url'] = Variable<String>(downloadUrl.value);
    }
    if (sha.present) {
      map['sha'] = Variable<String>(sha.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (parentPath.present) {
      map['parent_path'] = Variable<String>(parentPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DownloadedImagesTCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('localUrl: $localUrl, ')
          ..write('remoteUrl: $remoteUrl, ')
          ..write('downloadUrl: $downloadUrl, ')
          ..write('sha: $sha, ')
          ..write('createdAt: $createdAt, ')
          ..write('parentPath: $parentPath')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftDbProvider extends GeneratedDatabase {
  _$DriftDbProvider(QueryExecutor e) : super(e);
  _$DriftDbProviderManager get managers => _$DriftDbProviderManager(this);
  late final $PbSettingsTTable pbSettingsT = $PbSettingsTTable(this);
  late final $UploadedImagesTTable uploadedImagesT =
      $UploadedImagesTTable(this);
  late final $DownloadedImagesTTable downloadedImagesT =
      $DownloadedImagesTTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [pbSettingsT, uploadedImagesT, downloadedImagesT];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$PbSettingsTTableInsertCompanionBuilder = PbSettingsTCompanion
    Function({
  Value<int> id,
  Value<String> type,
  Value<String> path,
  Value<String> name,
  Value<String> config,
  Value<int> visible,
});
typedef $$PbSettingsTTableUpdateCompanionBuilder = PbSettingsTCompanion
    Function({
  Value<int> id,
  Value<String> type,
  Value<String> path,
  Value<String> name,
  Value<String> config,
  Value<int> visible,
});

class $$PbSettingsTTableTableManager extends RootTableManager<
    _$DriftDbProvider,
    $PbSettingsTTable,
    pb_setting,
    $$PbSettingsTTableFilterComposer,
    $$PbSettingsTTableOrderingComposer,
    $$PbSettingsTTableProcessedTableManager,
    $$PbSettingsTTableInsertCompanionBuilder,
    $$PbSettingsTTableUpdateCompanionBuilder> {
  $$PbSettingsTTableTableManager(_$DriftDbProvider db, $PbSettingsTTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PbSettingsTTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PbSettingsTTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$PbSettingsTTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> path = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> config = const Value.absent(),
            Value<int> visible = const Value.absent(),
          }) =>
              PbSettingsTCompanion(
            id: id,
            type: type,
            path: path,
            name: name,
            config: config,
            visible: visible,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> path = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> config = const Value.absent(),
            Value<int> visible = const Value.absent(),
          }) =>
              PbSettingsTCompanion.insert(
            id: id,
            type: type,
            path: path,
            name: name,
            config: config,
            visible: visible,
          ),
        ));
}

class $$PbSettingsTTableProcessedTableManager extends ProcessedTableManager<
    _$DriftDbProvider,
    $PbSettingsTTable,
    pb_setting,
    $$PbSettingsTTableFilterComposer,
    $$PbSettingsTTableOrderingComposer,
    $$PbSettingsTTableProcessedTableManager,
    $$PbSettingsTTableInsertCompanionBuilder,
    $$PbSettingsTTableUpdateCompanionBuilder> {
  $$PbSettingsTTableProcessedTableManager(super.$state);
}

class $$PbSettingsTTableFilterComposer
    extends FilterComposer<_$DriftDbProvider, $PbSettingsTTable> {
  $$PbSettingsTTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get path => $state.composableBuilder(
      column: $state.table.path,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get config => $state.composableBuilder(
      column: $state.table.config,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get visible => $state.composableBuilder(
      column: $state.table.visible,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$PbSettingsTTableOrderingComposer
    extends OrderingComposer<_$DriftDbProvider, $PbSettingsTTable> {
  $$PbSettingsTTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get path => $state.composableBuilder(
      column: $state.table.path,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get config => $state.composableBuilder(
      column: $state.table.config,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get visible => $state.composableBuilder(
      column: $state.table.visible,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$UploadedImagesTTableInsertCompanionBuilder = UploadedImagesTCompanion
    Function({
  Value<int> id,
  Value<String> filepath,
  Value<String> storageType,
  Value<String> url,
  Value<String> sha,
  Value<String> name,
  Value<String> state,
  Value<DateTime> createTime,
  Value<DateTime> uploadTime,
});
typedef $$UploadedImagesTTableUpdateCompanionBuilder = UploadedImagesTCompanion
    Function({
  Value<int> id,
  Value<String> filepath,
  Value<String> storageType,
  Value<String> url,
  Value<String> sha,
  Value<String> name,
  Value<String> state,
  Value<DateTime> createTime,
  Value<DateTime> uploadTime,
});

class $$UploadedImagesTTableTableManager extends RootTableManager<
    _$DriftDbProvider,
    $UploadedImagesTTable,
    uploaded_image,
    $$UploadedImagesTTableFilterComposer,
    $$UploadedImagesTTableOrderingComposer,
    $$UploadedImagesTTableProcessedTableManager,
    $$UploadedImagesTTableInsertCompanionBuilder,
    $$UploadedImagesTTableUpdateCompanionBuilder> {
  $$UploadedImagesTTableTableManager(
      _$DriftDbProvider db, $UploadedImagesTTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UploadedImagesTTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UploadedImagesTTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$UploadedImagesTTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> filepath = const Value.absent(),
            Value<String> storageType = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<String> sha = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> state = const Value.absent(),
            Value<DateTime> createTime = const Value.absent(),
            Value<DateTime> uploadTime = const Value.absent(),
          }) =>
              UploadedImagesTCompanion(
            id: id,
            filepath: filepath,
            storageType: storageType,
            url: url,
            sha: sha,
            name: name,
            state: state,
            createTime: createTime,
            uploadTime: uploadTime,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> filepath = const Value.absent(),
            Value<String> storageType = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<String> sha = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> state = const Value.absent(),
            Value<DateTime> createTime = const Value.absent(),
            Value<DateTime> uploadTime = const Value.absent(),
          }) =>
              UploadedImagesTCompanion.insert(
            id: id,
            filepath: filepath,
            storageType: storageType,
            url: url,
            sha: sha,
            name: name,
            state: state,
            createTime: createTime,
            uploadTime: uploadTime,
          ),
        ));
}

class $$UploadedImagesTTableProcessedTableManager extends ProcessedTableManager<
    _$DriftDbProvider,
    $UploadedImagesTTable,
    uploaded_image,
    $$UploadedImagesTTableFilterComposer,
    $$UploadedImagesTTableOrderingComposer,
    $$UploadedImagesTTableProcessedTableManager,
    $$UploadedImagesTTableInsertCompanionBuilder,
    $$UploadedImagesTTableUpdateCompanionBuilder> {
  $$UploadedImagesTTableProcessedTableManager(super.$state);
}

class $$UploadedImagesTTableFilterComposer
    extends FilterComposer<_$DriftDbProvider, $UploadedImagesTTable> {
  $$UploadedImagesTTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get filepath => $state.composableBuilder(
      column: $state.table.filepath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get storageType => $state.composableBuilder(
      column: $state.table.storageType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sha => $state.composableBuilder(
      column: $state.table.sha,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get state => $state.composableBuilder(
      column: $state.table.state,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createTime => $state.composableBuilder(
      column: $state.table.createTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get uploadTime => $state.composableBuilder(
      column: $state.table.uploadTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UploadedImagesTTableOrderingComposer
    extends OrderingComposer<_$DriftDbProvider, $UploadedImagesTTable> {
  $$UploadedImagesTTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get filepath => $state.composableBuilder(
      column: $state.table.filepath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get storageType => $state.composableBuilder(
      column: $state.table.storageType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sha => $state.composableBuilder(
      column: $state.table.sha,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get state => $state.composableBuilder(
      column: $state.table.state,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createTime => $state.composableBuilder(
      column: $state.table.createTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get uploadTime => $state.composableBuilder(
      column: $state.table.uploadTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$DownloadedImagesTTableInsertCompanionBuilder
    = DownloadedImagesTCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> localUrl,
  Value<String> remoteUrl,
  Value<String> downloadUrl,
  Value<String> sha,
  Value<DateTime> createdAt,
  Value<String> parentPath,
});
typedef $$DownloadedImagesTTableUpdateCompanionBuilder
    = DownloadedImagesTCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> localUrl,
  Value<String> remoteUrl,
  Value<String> downloadUrl,
  Value<String> sha,
  Value<DateTime> createdAt,
  Value<String> parentPath,
});

class $$DownloadedImagesTTableTableManager extends RootTableManager<
    _$DriftDbProvider,
    $DownloadedImagesTTable,
    downloaded_image,
    $$DownloadedImagesTTableFilterComposer,
    $$DownloadedImagesTTableOrderingComposer,
    $$DownloadedImagesTTableProcessedTableManager,
    $$DownloadedImagesTTableInsertCompanionBuilder,
    $$DownloadedImagesTTableUpdateCompanionBuilder> {
  $$DownloadedImagesTTableTableManager(
      _$DriftDbProvider db, $DownloadedImagesTTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DownloadedImagesTTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$DownloadedImagesTTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$DownloadedImagesTTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> localUrl = const Value.absent(),
            Value<String> remoteUrl = const Value.absent(),
            Value<String> downloadUrl = const Value.absent(),
            Value<String> sha = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> parentPath = const Value.absent(),
          }) =>
              DownloadedImagesTCompanion(
            id: id,
            name: name,
            localUrl: localUrl,
            remoteUrl: remoteUrl,
            downloadUrl: downloadUrl,
            sha: sha,
            createdAt: createdAt,
            parentPath: parentPath,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> localUrl = const Value.absent(),
            Value<String> remoteUrl = const Value.absent(),
            Value<String> downloadUrl = const Value.absent(),
            Value<String> sha = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> parentPath = const Value.absent(),
          }) =>
              DownloadedImagesTCompanion.insert(
            id: id,
            name: name,
            localUrl: localUrl,
            remoteUrl: remoteUrl,
            downloadUrl: downloadUrl,
            sha: sha,
            createdAt: createdAt,
            parentPath: parentPath,
          ),
        ));
}

class $$DownloadedImagesTTableProcessedTableManager
    extends ProcessedTableManager<
        _$DriftDbProvider,
        $DownloadedImagesTTable,
        downloaded_image,
        $$DownloadedImagesTTableFilterComposer,
        $$DownloadedImagesTTableOrderingComposer,
        $$DownloadedImagesTTableProcessedTableManager,
        $$DownloadedImagesTTableInsertCompanionBuilder,
        $$DownloadedImagesTTableUpdateCompanionBuilder> {
  $$DownloadedImagesTTableProcessedTableManager(super.$state);
}

class $$DownloadedImagesTTableFilterComposer
    extends FilterComposer<_$DriftDbProvider, $DownloadedImagesTTable> {
  $$DownloadedImagesTTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get localUrl => $state.composableBuilder(
      column: $state.table.localUrl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get remoteUrl => $state.composableBuilder(
      column: $state.table.remoteUrl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get downloadUrl => $state.composableBuilder(
      column: $state.table.downloadUrl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sha => $state.composableBuilder(
      column: $state.table.sha,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get parentPath => $state.composableBuilder(
      column: $state.table.parentPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$DownloadedImagesTTableOrderingComposer
    extends OrderingComposer<_$DriftDbProvider, $DownloadedImagesTTable> {
  $$DownloadedImagesTTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get localUrl => $state.composableBuilder(
      column: $state.table.localUrl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get remoteUrl => $state.composableBuilder(
      column: $state.table.remoteUrl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get downloadUrl => $state.composableBuilder(
      column: $state.table.downloadUrl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sha => $state.composableBuilder(
      column: $state.table.sha,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get parentPath => $state.composableBuilder(
      column: $state.table.parentPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$DriftDbProviderManager {
  final _$DriftDbProvider _db;
  _$DriftDbProviderManager(this._db);
  $$PbSettingsTTableTableManager get pbSettingsT =>
      $$PbSettingsTTableTableManager(_db, _db.pbSettingsT);
  $$UploadedImagesTTableTableManager get uploadedImagesT =>
      $$UploadedImagesTTableTableManager(_db, _db.uploadedImagesT);
  $$DownloadedImagesTTableTableManager get downloadedImagesT =>
      $$DownloadedImagesTTableTableManager(_db, _db.downloadedImagesT);
}
