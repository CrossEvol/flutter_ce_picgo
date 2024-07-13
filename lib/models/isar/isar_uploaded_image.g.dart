// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_uploaded_image.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarUploadedImageCollection on Isar {
  IsarCollection<IsarUploadedImage> get isarUploadedImages => this.collection();
}

const IsarUploadedImageSchema = CollectionSchema(
  name: r'IsarUploadedImage',
  id: 4515016410341178238,
  properties: {
    r'createTime': PropertySchema(
      id: 0,
      name: r'createTime',
      type: IsarType.dateTime,
    ),
    r'filepath': PropertySchema(
      id: 1,
      name: r'filepath',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'state': PropertySchema(
      id: 3,
      name: r'state',
      type: IsarType.string,
      enumMap: _IsarUploadedImagestateEnumValueMap,
    ),
    r'storageType': PropertySchema(
      id: 4,
      name: r'storageType',
      type: IsarType.string,
    ),
    r'uploadTime': PropertySchema(
      id: 5,
      name: r'uploadTime',
      type: IsarType.dateTime,
    ),
    r'url': PropertySchema(
      id: 6,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _isarUploadedImageEstimateSize,
  serialize: _isarUploadedImageSerialize,
  deserialize: _isarUploadedImageDeserialize,
  deserializeProp: _isarUploadedImageDeserializeProp,
  idName: r'id',
  indexes: {
    r'filepath': IndexSchema(
      id: -5884581779343399039,
      name: r'filepath',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'filepath',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'storageType': IndexSchema(
      id: 5272119146264901087,
      name: r'storageType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'storageType',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _isarUploadedImageGetId,
  getLinks: _isarUploadedImageGetLinks,
  attach: _isarUploadedImageAttach,
  version: '3.1.0+1',
);

int _isarUploadedImageEstimateSize(
  IsarUploadedImage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.filepath.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.state.name.length * 3;
  bytesCount += 3 + object.storageType.length * 3;
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _isarUploadedImageSerialize(
  IsarUploadedImage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createTime);
  writer.writeString(offsets[1], object.filepath);
  writer.writeString(offsets[2], object.name);
  writer.writeString(offsets[3], object.state.name);
  writer.writeString(offsets[4], object.storageType);
  writer.writeDateTime(offsets[5], object.uploadTime);
  writer.writeString(offsets[6], object.url);
}

IsarUploadedImage _isarUploadedImageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarUploadedImage(
    createTime: reader.readDateTime(offsets[0]),
    filepath: reader.readString(offsets[1]),
    id: id,
    name: reader.readString(offsets[2]),
    state: _IsarUploadedImagestateValueEnumMap[
            reader.readStringOrNull(offsets[3])] ??
        UploadState.uploading,
    storageType: reader.readString(offsets[4]),
    uploadTime: reader.readDateTime(offsets[5]),
    url: reader.readString(offsets[6]),
  );
  return object;
}

P _isarUploadedImageDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (_IsarUploadedImagestateValueEnumMap[
              reader.readStringOrNull(offset)] ??
          UploadState.uploading) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarUploadedImagestateEnumValueMap = {
  r'uploading': r'uploading',
  r'saving': r'saving',
  r'completed': r'completed',
  r'uploadFailed': r'uploadFailed',
  r'saveFailed': r'saveFailed',
  r'unknown': r'unknown',
};
const _IsarUploadedImagestateValueEnumMap = {
  r'uploading': UploadState.uploading,
  r'saving': UploadState.saving,
  r'completed': UploadState.completed,
  r'uploadFailed': UploadState.uploadFailed,
  r'saveFailed': UploadState.saveFailed,
  r'unknown': UploadState.unknown,
};

Id _isarUploadedImageGetId(IsarUploadedImage object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarUploadedImageGetLinks(
    IsarUploadedImage object) {
  return [];
}

void _isarUploadedImageAttach(
    IsarCollection<dynamic> col, Id id, IsarUploadedImage object) {
  object.id = id;
}

extension IsarUploadedImageQueryWhereSort
    on QueryBuilder<IsarUploadedImage, IsarUploadedImage, QWhere> {
  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhere>
      anyStorageType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'storageType'),
      );
    });
  }
}

extension IsarUploadedImageQueryWhere
    on QueryBuilder<IsarUploadedImage, IsarUploadedImage, QWhereClause> {
  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      filepathEqualTo(String filepath) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'filepath',
        value: [filepath],
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      filepathNotEqualTo(String filepath) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'filepath',
              lower: [],
              upper: [filepath],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'filepath',
              lower: [filepath],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'filepath',
              lower: [filepath],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'filepath',
              lower: [],
              upper: [filepath],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      storageTypeEqualTo(String storageType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'storageType',
        value: [storageType],
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      storageTypeNotEqualTo(String storageType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'storageType',
              lower: [],
              upper: [storageType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'storageType',
              lower: [storageType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'storageType',
              lower: [storageType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'storageType',
              lower: [],
              upper: [storageType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      storageTypeGreaterThan(
    String storageType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'storageType',
        lower: [storageType],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      storageTypeLessThan(
    String storageType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'storageType',
        lower: [],
        upper: [storageType],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      storageTypeBetween(
    String lowerStorageType,
    String upperStorageType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'storageType',
        lower: [lowerStorageType],
        includeLower: includeLower,
        upper: [upperStorageType],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      storageTypeStartsWith(String StorageTypePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'storageType',
        lower: [StorageTypePrefix],
        upper: ['$StorageTypePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      storageTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'storageType',
        value: [''],
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      storageTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'storageType',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'storageType',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'storageType',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'storageType',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterWhereClause>
      nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }
}

extension IsarUploadedImageQueryFilter
    on QueryBuilder<IsarUploadedImage, IsarUploadedImage, QFilterCondition> {
  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      createTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      createTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      createTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      createTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      filepathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filepath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      filepathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'filepath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      filepathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'filepath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      filepathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'filepath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      filepathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'filepath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      filepathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'filepath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      filepathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'filepath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      filepathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'filepath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      filepathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filepath',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      filepathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'filepath',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      nameGreaterThan(
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

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      stateEqualTo(
    UploadState value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      stateGreaterThan(
    UploadState value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      stateLessThan(
    UploadState value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      stateBetween(
    UploadState lower,
    UploadState upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'state',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      stateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      stateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      stateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      stateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'state',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      stateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      stateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'state',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      storageTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storageType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      storageTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storageType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      storageTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storageType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      storageTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storageType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      storageTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storageType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      storageTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storageType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      storageTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storageType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      storageTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storageType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      storageTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storageType',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      storageTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storageType',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      uploadTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uploadTime',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      uploadTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uploadTime',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      uploadTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uploadTime',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      uploadTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uploadTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      urlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      urlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      urlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      urlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      urlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension IsarUploadedImageQueryObject
    on QueryBuilder<IsarUploadedImage, IsarUploadedImage, QFilterCondition> {}

extension IsarUploadedImageQueryLinks
    on QueryBuilder<IsarUploadedImage, IsarUploadedImage, QFilterCondition> {}

extension IsarUploadedImageQuerySortBy
    on QueryBuilder<IsarUploadedImage, IsarUploadedImage, QSortBy> {
  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      sortByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      sortByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      sortByFilepath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filepath', Sort.asc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      sortByFilepathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filepath', Sort.desc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      sortByStorageType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storageType', Sort.asc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      sortByStorageTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storageType', Sort.desc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      sortByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.asc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      sortByUploadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.desc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension IsarUploadedImageQuerySortThenBy
    on QueryBuilder<IsarUploadedImage, IsarUploadedImage, QSortThenBy> {
  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      thenByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      thenByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      thenByFilepath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filepath', Sort.asc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      thenByFilepathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filepath', Sort.desc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      thenByStorageType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storageType', Sort.asc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      thenByStorageTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storageType', Sort.desc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      thenByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.asc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      thenByUploadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.desc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QAfterSortBy>
      thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension IsarUploadedImageQueryWhereDistinct
    on QueryBuilder<IsarUploadedImage, IsarUploadedImage, QDistinct> {
  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QDistinct>
      distinctByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createTime');
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QDistinct>
      distinctByFilepath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filepath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QDistinct> distinctByState(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'state', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QDistinct>
      distinctByStorageType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storageType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QDistinct>
      distinctByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uploadTime');
    });
  }

  QueryBuilder<IsarUploadedImage, IsarUploadedImage, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension IsarUploadedImageQueryProperty
    on QueryBuilder<IsarUploadedImage, IsarUploadedImage, QQueryProperty> {
  QueryBuilder<IsarUploadedImage, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarUploadedImage, DateTime, QQueryOperations>
      createTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createTime');
    });
  }

  QueryBuilder<IsarUploadedImage, String, QQueryOperations> filepathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filepath');
    });
  }

  QueryBuilder<IsarUploadedImage, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<IsarUploadedImage, UploadState, QQueryOperations>
      stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }

  QueryBuilder<IsarUploadedImage, String, QQueryOperations>
      storageTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storageType');
    });
  }

  QueryBuilder<IsarUploadedImage, DateTime, QQueryOperations>
      uploadTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploadTime');
    });
  }

  QueryBuilder<IsarUploadedImage, String, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}
