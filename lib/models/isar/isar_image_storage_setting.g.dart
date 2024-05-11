// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_image_storage_setting.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarImageStorageSettingCollection on Isar {
  IsarCollection<IsarImageStorageSetting> get isarImageStorageSettings =>
      this.collection();
}

const IsarImageStorageSettingSchema = CollectionSchema(
  name: r'IsarImageStorageSetting',
  id: -1930621083521230762,
  properties: {
    r'config': PropertySchema(
      id: 0,
      name: r'config',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'path': PropertySchema(
      id: 2,
      name: r'path',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 3,
      name: r'type',
      type: IsarType.string,
    ),
    r'visible': PropertySchema(
      id: 4,
      name: r'visible',
      type: IsarType.bool,
    )
  },
  estimateSize: _isarImageStorageSettingEstimateSize,
  serialize: _isarImageStorageSettingSerialize,
  deserialize: _isarImageStorageSettingDeserialize,
  deserializeProp: _isarImageStorageSettingDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _isarImageStorageSettingGetId,
  getLinks: _isarImageStorageSettingGetLinks,
  attach: _isarImageStorageSettingAttach,
  version: '3.1.0+1',
);

int _isarImageStorageSettingEstimateSize(
  IsarImageStorageSetting object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.config.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.path.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _isarImageStorageSettingSerialize(
  IsarImageStorageSetting object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.config);
  writer.writeString(offsets[1], object.name);
  writer.writeString(offsets[2], object.path);
  writer.writeString(offsets[3], object.type);
  writer.writeBool(offsets[4], object.visible);
}

IsarImageStorageSetting _isarImageStorageSettingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarImageStorageSetting(
    config: reader.readString(offsets[0]),
    id: id,
    name: reader.readString(offsets[1]),
    path: reader.readString(offsets[2]),
    type: reader.readString(offsets[3]),
    visible: reader.readBool(offsets[4]),
  );
  return object;
}

P _isarImageStorageSettingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarImageStorageSettingGetId(IsarImageStorageSetting object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarImageStorageSettingGetLinks(
    IsarImageStorageSetting object) {
  return [];
}

void _isarImageStorageSettingAttach(
    IsarCollection<dynamic> col, Id id, IsarImageStorageSetting object) {
  object.id = id;
}

extension IsarImageStorageSettingQueryWhereSort
    on QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QWhere> {
  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarImageStorageSettingQueryWhere on QueryBuilder<
    IsarImageStorageSetting, IsarImageStorageSetting, QWhereClause> {
  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarImageStorageSettingQueryFilter on QueryBuilder<
    IsarImageStorageSetting, IsarImageStorageSetting, QFilterCondition> {
  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> configEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'config',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> configGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'config',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> configLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'config',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> configBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'config',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> configStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'config',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> configEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'config',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
          QAfterFilterCondition>
      configContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'config',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
          QAfterFilterCondition>
      configMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'config',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> configIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'config',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> configIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'config',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> pathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> pathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> pathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> pathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'path',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> pathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> pathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
          QAfterFilterCondition>
      pathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
          QAfterFilterCondition>
      pathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'path',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> pathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'path',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> pathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'path',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
          QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
          QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting,
      QAfterFilterCondition> visibleEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visible',
        value: value,
      ));
    });
  }
}

extension IsarImageStorageSettingQueryObject on QueryBuilder<
    IsarImageStorageSetting, IsarImageStorageSetting, QFilterCondition> {}

extension IsarImageStorageSettingQueryLinks on QueryBuilder<
    IsarImageStorageSetting, IsarImageStorageSetting, QFilterCondition> {}

extension IsarImageStorageSettingQuerySortBy
    on QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QSortBy> {
  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      sortByConfig() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'config', Sort.asc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      sortByConfigDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'config', Sort.desc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      sortByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      sortByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      sortByVisible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visible', Sort.asc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      sortByVisibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visible', Sort.desc);
    });
  }
}

extension IsarImageStorageSettingQuerySortThenBy on QueryBuilder<
    IsarImageStorageSetting, IsarImageStorageSetting, QSortThenBy> {
  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      thenByConfig() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'config', Sort.asc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      thenByConfigDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'config', Sort.desc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      thenByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      thenByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      thenByVisible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visible', Sort.asc);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QAfterSortBy>
      thenByVisibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visible', Sort.desc);
    });
  }
}

extension IsarImageStorageSettingQueryWhereDistinct on QueryBuilder<
    IsarImageStorageSetting, IsarImageStorageSetting, QDistinct> {
  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QDistinct>
      distinctByConfig({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'config', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QDistinct>
      distinctByPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'path', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QDistinct>
      distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarImageStorageSetting, IsarImageStorageSetting, QDistinct>
      distinctByVisible() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visible');
    });
  }
}

extension IsarImageStorageSettingQueryProperty on QueryBuilder<
    IsarImageStorageSetting, IsarImageStorageSetting, QQueryProperty> {
  QueryBuilder<IsarImageStorageSetting, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarImageStorageSetting, String, QQueryOperations>
      configProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'config');
    });
  }

  QueryBuilder<IsarImageStorageSetting, String, QQueryOperations>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<IsarImageStorageSetting, String, QQueryOperations>
      pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'path');
    });
  }

  QueryBuilder<IsarImageStorageSetting, String, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<IsarImageStorageSetting, bool, QQueryOperations>
      visibleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visible');
    });
  }
}
