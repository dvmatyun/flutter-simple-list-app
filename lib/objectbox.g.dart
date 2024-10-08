// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;

import 'features/contacts/data/models/contact_dto.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 4610284826805926980),
      name: 'ContactDto',
      lastPropertyId: const obx_int.IdUid(10, 8457079104505788567),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 7689884811870415272),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 5531943378963754308),
            name: 'contactId',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(1, 7094781855485557115)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 986075196195550242),
            name: 'firstName',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 341136655651659999),
            name: 'lastName',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 4205032376187030922),
            name: 'phoneNumber',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 2280213143473911055),
            name: 'streetAddress1',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 8372879908262867560),
            name: 'streetAddress2',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 8717363268682277565),
            name: 'city',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(9, 6510041978326243505),
            name: 'state',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(10, 8457079104505788567),
            name: 'zipCode',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
obx.Store openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) {
  return obx.Store(getObjectBoxModel(),
      directory: directory,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(1, 4610284826805926980),
      lastIndexId: const obx_int.IdUid(1, 7094781855485557115),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    ContactDto: obx_int.EntityDefinition<ContactDto>(
        model: _entities[0],
        toOneRelations: (ContactDto object) => [],
        toManyRelations: (ContactDto object) => {},
        getId: (ContactDto object) => object.id,
        setId: (ContactDto object, int id) {
          object.id = id;
        },
        objectToFB: (ContactDto object, fb.Builder fbb) {
          final contactIdOffset = fbb.writeString(object.contactId);
          final firstNameOffset = object.firstName == null
              ? null
              : fbb.writeString(object.firstName!);
          final lastNameOffset = object.lastName == null
              ? null
              : fbb.writeString(object.lastName!);
          final phoneNumberOffset = object.phoneNumber == null
              ? null
              : fbb.writeString(object.phoneNumber!);
          final streetAddress1Offset = object.streetAddress1 == null
              ? null
              : fbb.writeString(object.streetAddress1!);
          final streetAddress2Offset = object.streetAddress2 == null
              ? null
              : fbb.writeString(object.streetAddress2!);
          final cityOffset =
              object.city == null ? null : fbb.writeString(object.city!);
          final stateOffset =
              object.state == null ? null : fbb.writeString(object.state!);
          final zipCodeOffset =
              object.zipCode == null ? null : fbb.writeString(object.zipCode!);
          fbb.startTable(11);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, contactIdOffset);
          fbb.addOffset(2, firstNameOffset);
          fbb.addOffset(3, lastNameOffset);
          fbb.addOffset(4, phoneNumberOffset);
          fbb.addOffset(5, streetAddress1Offset);
          fbb.addOffset(6, streetAddress2Offset);
          fbb.addOffset(7, cityOffset);
          fbb.addOffset(8, stateOffset);
          fbb.addOffset(9, zipCodeOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final contactIdParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final firstNameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 8);
          final lastNameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 10);
          final phoneNumberParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12);
          final streetAddress1Param =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14);
          final streetAddress2Param =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 16);
          final cityParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 18);
          final stateParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 20);
          final zipCodeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 22);
          final object = ContactDto(
              id: idParam,
              contactId: contactIdParam,
              firstName: firstNameParam,
              lastName: lastNameParam,
              phoneNumber: phoneNumberParam,
              streetAddress1: streetAddress1Param,
              streetAddress2: streetAddress2Param,
              city: cityParam,
              state: stateParam,
              zipCode: zipCodeParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [ContactDto] entity fields to define ObjectBox queries.
class ContactDto_ {
  /// See [ContactDto.id].
  static final id =
      obx.QueryIntegerProperty<ContactDto>(_entities[0].properties[0]);

  /// See [ContactDto.contactId].
  static final contactId =
      obx.QueryStringProperty<ContactDto>(_entities[0].properties[1]);

  /// See [ContactDto.firstName].
  static final firstName =
      obx.QueryStringProperty<ContactDto>(_entities[0].properties[2]);

  /// See [ContactDto.lastName].
  static final lastName =
      obx.QueryStringProperty<ContactDto>(_entities[0].properties[3]);

  /// See [ContactDto.phoneNumber].
  static final phoneNumber =
      obx.QueryStringProperty<ContactDto>(_entities[0].properties[4]);

  /// See [ContactDto.streetAddress1].
  static final streetAddress1 =
      obx.QueryStringProperty<ContactDto>(_entities[0].properties[5]);

  /// See [ContactDto.streetAddress2].
  static final streetAddress2 =
      obx.QueryStringProperty<ContactDto>(_entities[0].properties[6]);

  /// See [ContactDto.city].
  static final city =
      obx.QueryStringProperty<ContactDto>(_entities[0].properties[7]);

  /// See [ContactDto.state].
  static final state =
      obx.QueryStringProperty<ContactDto>(_entities[0].properties[8]);

  /// See [ContactDto.zipCode].
  static final zipCode =
      obx.QueryStringProperty<ContactDto>(_entities[0].properties[9]);
}
