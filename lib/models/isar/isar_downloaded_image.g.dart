// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_downloaded_image.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarDownloadedImageCollection on Isar {
  IsarCollection<IsarDownloadedImage> get isarDownloadedImages =>
      this.collection();
}

const IsarDownloadedImageSchema = CollectionSchema(
  name: r'IsarDownloadedImage',
  id: -6365592762204622006,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'localUrl': PropertySchema(
      id: 1,
      name: r'localUrl',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'remoteUrl': PropertySchema(
      id: 3,
      name: r'remoteUrl',
      type: IsarType.string,
    ),
    r'sha': PropertySchema(
      id: 4,
      name: r'sha',
      type: IsarType.string,
    )
  },
  estimateSize: _isarDownloadedImageEstimateSize,
  serialize: _isarDownloadedImageSerialize,
  deserialize: _isarDownloadedImageDeserialize,
  deserializeProp: _isarDownloadedImageDeserializeProp,
  idName: r'id',
  indexes: {
    r'localUrl': IndexSchema(
      id: -1341171084344051942,
      name: r'localUrl',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'localUrl',
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
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'remoteUrl': IndexSchema(
      id: 726143022738629678,
      name: r'remoteUrl',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'remoteUrl',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _isarDownloadedImageGetId,
  getLinks: _isarDownloadedImageGetLinks,
  attach: _isarDownloadedImageAttach,
  version: '3.1.0+1',
);

int _isarDownloadedImageEstimateSize(
  IsarDownloadedImage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.localUrl.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.remoteUrl.length * 3;
  bytesCount += 3 + object.sha.length * 3;
  return bytesCount;
}

void _isarDownloadedImageSerialize(
  IsarDownloadedImage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.localUrl);
  writer.writeString(offsets[2], object.name);
  writer.writeString(offsets[3], object.remoteUrl);
  writer.writeString(offsets[4], object.sha);
}

IsarDownloadedImage _isarDownloadedImageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarDownloadedImage(
    createdAt: reader.readDateTime(offsets[0]),
    localUrl: reader.readString(offsets[1]),
    name: reader.readString(offsets[2]),
    remoteUrl: reader.readString(offsets[3]),
    sha: reader.readString(offsets[4]),
  );
  object.id = id;
  return object;
}

P _isarDownloadedImageDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarDownloadedImageGetId(IsarDownloadedImage object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarDownloadedImageGetLinks(
    IsarDownloadedImage object) {
  return [];
}

void _isarDownloadedImageAttach(
    IsarCollection<dynamic> col, Id id, IsarDownloadedImage object) {
  object.id = id;
}

extension IsarDownloadedImageQueryWhereSort
    on QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QWhere> {
  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhere>
      anyLocalUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'localUrl'),
      );
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhere>
      anyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'name'),
      );
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhere>
      anyRemoteUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'remoteUrl'),
      );
    });
  }
}

extension IsarDownloadedImageQueryWhere
    on QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QWhereClause> {
  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
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

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
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

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      localUrlEqualTo(String localUrl) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'localUrl',
        value: [localUrl],
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      localUrlNotEqualTo(String localUrl) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'localUrl',
              lower: [],
              upper: [localUrl],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'localUrl',
              lower: [localUrl],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'localUrl',
              lower: [localUrl],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'localUrl',
              lower: [],
              upper: [localUrl],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      localUrlGreaterThan(
    String localUrl, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'localUrl',
        lower: [localUrl],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      localUrlLessThan(
    String localUrl, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'localUrl',
        lower: [],
        upper: [localUrl],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      localUrlBetween(
    String lowerLocalUrl,
    String upperLocalUrl, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'localUrl',
        lower: [lowerLocalUrl],
        includeLower: includeLower,
        upper: [upperLocalUrl],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      localUrlStartsWith(String LocalUrlPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'localUrl',
        lower: [LocalUrlPrefix],
        upper: ['$LocalUrlPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      localUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'localUrl',
        value: [''],
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      localUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'localUrl',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'localUrl',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'localUrl',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'localUrl',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
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

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      nameGreaterThan(
    String name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [name],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      nameLessThan(
    String name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [],
        upper: [name],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      nameBetween(
    String lowerName,
    String upperName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [lowerName],
        includeLower: includeLower,
        upper: [upperName],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      nameStartsWith(String NamePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [NamePrefix],
        upper: ['$NamePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [''],
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      remoteUrlEqualTo(String remoteUrl) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteUrl',
        value: [remoteUrl],
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      remoteUrlNotEqualTo(String remoteUrl) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteUrl',
              lower: [],
              upper: [remoteUrl],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteUrl',
              lower: [remoteUrl],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteUrl',
              lower: [remoteUrl],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'remoteUrl',
              lower: [],
              upper: [remoteUrl],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      remoteUrlGreaterThan(
    String remoteUrl, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'remoteUrl',
        lower: [remoteUrl],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      remoteUrlLessThan(
    String remoteUrl, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'remoteUrl',
        lower: [],
        upper: [remoteUrl],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      remoteUrlBetween(
    String lowerRemoteUrl,
    String upperRemoteUrl, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'remoteUrl',
        lower: [lowerRemoteUrl],
        includeLower: includeLower,
        upper: [upperRemoteUrl],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      remoteUrlStartsWith(String RemoteUrlPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'remoteUrl',
        lower: [RemoteUrlPrefix],
        upper: ['$RemoteUrlPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      remoteUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'remoteUrl',
        value: [''],
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterWhereClause>
      remoteUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'remoteUrl',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'remoteUrl',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'remoteUrl',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'remoteUrl',
              upper: [''],
            ));
      }
    });
  }
}

extension IsarDownloadedImageQueryFilter on QueryBuilder<IsarDownloadedImage,
    IsarDownloadedImage, QFilterCondition> {
  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
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

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
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

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
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

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      localUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      localUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      localUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      localUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      localUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'localUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      localUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'localUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      localUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'localUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      localUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'localUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      localUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      localUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'localUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
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

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
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

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
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

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
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

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
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

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
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

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      remoteUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      remoteUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      remoteUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      remoteUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      remoteUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      remoteUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      remoteUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      remoteUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      remoteUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      remoteUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      shaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      shaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      shaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      shaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sha',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      shaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      shaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      shaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      shaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sha',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      shaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sha',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterFilterCondition>
      shaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sha',
        value: '',
      ));
    });
  }
}

extension IsarDownloadedImageQueryObject on QueryBuilder<IsarDownloadedImage,
    IsarDownloadedImage, QFilterCondition> {}

extension IsarDownloadedImageQueryLinks on QueryBuilder<IsarDownloadedImage,
    IsarDownloadedImage, QFilterCondition> {}

extension IsarDownloadedImageQuerySortBy
    on QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QSortBy> {
  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      sortByLocalUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      sortByLocalUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      sortByRemoteUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      sortByRemoteUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      sortBySha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sha', Sort.asc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      sortByShaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sha', Sort.desc);
    });
  }
}

extension IsarDownloadedImageQuerySortThenBy
    on QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QSortThenBy> {
  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      thenByLocalUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      thenByLocalUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      thenByRemoteUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      thenByRemoteUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      thenBySha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sha', Sort.asc);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QAfterSortBy>
      thenByShaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sha', Sort.desc);
    });
  }
}

extension IsarDownloadedImageQueryWhereDistinct
    on QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QDistinct> {
  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QDistinct>
      distinctByLocalUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QDistinct>
      distinctByRemoteUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QDistinct>
      distinctBySha({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sha', caseSensitive: caseSensitive);
    });
  }
}

extension IsarDownloadedImageQueryProperty
    on QueryBuilder<IsarDownloadedImage, IsarDownloadedImage, QQueryProperty> {
  QueryBuilder<IsarDownloadedImage, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarDownloadedImage, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<IsarDownloadedImage, String, QQueryOperations>
      localUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localUrl');
    });
  }

  QueryBuilder<IsarDownloadedImage, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<IsarDownloadedImage, String, QQueryOperations>
      remoteUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUrl');
    });
  }

  QueryBuilder<IsarDownloadedImage, String, QQueryOperations> shaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sha');
    });
  }
}
