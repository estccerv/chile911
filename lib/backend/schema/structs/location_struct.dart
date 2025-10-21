// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationStruct extends FFFirebaseStruct {
  LocationStruct({
    String? name,
    String? address,
    String? city,
    String? state,
    String? country,
    String? zipCode,
    ZoneStruct? zone,
    String? note,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _address = address,
        _city = city,
        _state = state,
        _country = country,
        _zipCode = zipCode,
        _zone = zone,
        _note = note,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "zipCode" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  set zipCode(String? val) => _zipCode = val;

  bool hasZipCode() => _zipCode != null;

  // "zone" field.
  ZoneStruct? _zone;
  ZoneStruct get zone => _zone ?? ZoneStruct();
  set zone(ZoneStruct? val) => _zone = val;

  void updateZone(Function(ZoneStruct) updateFn) {
    updateFn(_zone ??= ZoneStruct());
  }

  bool hasZone() => _zone != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  static LocationStruct fromMap(Map<String, dynamic> data) => LocationStruct(
        name: data['name'] as String?,
        address: data['address'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        country: data['country'] as String?,
        zipCode: data['zipCode'] as String?,
        zone: data['zone'] is ZoneStruct
            ? data['zone']
            : ZoneStruct.maybeFromMap(data['zone']),
        note: data['note'] as String?,
      );

  static LocationStruct? maybeFromMap(dynamic data) =>
      data is Map ? LocationStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'address': _address,
        'city': _city,
        'state': _state,
        'country': _country,
        'zipCode': _zipCode,
        'zone': _zone?.toMap(),
        'note': _note,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'zipCode': serializeParam(
          _zipCode,
          ParamType.String,
        ),
        'zone': serializeParam(
          _zone,
          ParamType.DataStruct,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
      }.withoutNulls;

  static LocationStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        zipCode: deserializeParam(
          data['zipCode'],
          ParamType.String,
          false,
        ),
        zone: deserializeStructParam(
          data['zone'],
          ParamType.DataStruct,
          false,
          structBuilder: ZoneStruct.fromSerializableMap,
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationStruct &&
        name == other.name &&
        address == other.address &&
        city == other.city &&
        state == other.state &&
        country == other.country &&
        zipCode == other.zipCode &&
        zone == other.zone &&
        note == other.note;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, address, city, state, country, zipCode, zone, note]);
}

LocationStruct createLocationStruct({
  String? name,
  String? address,
  String? city,
  String? state,
  String? country,
  String? zipCode,
  ZoneStruct? zone,
  String? note,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocationStruct(
      name: name,
      address: address,
      city: city,
      state: state,
      country: country,
      zipCode: zipCode,
      zone: zone ?? (clearUnsetFields ? ZoneStruct() : null),
      note: note,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocationStruct? updateLocationStruct(
  LocationStruct? location, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    location
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocationStructData(
  Map<String, dynamic> firestoreData,
  LocationStruct? location,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (location == null) {
    return;
  }
  if (location.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && location.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final locationData = getLocationFirestoreData(location, forFieldValue);
  final nestedData = locationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = location.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocationFirestoreData(
  LocationStruct? location, [
  bool forFieldValue = false,
]) {
  if (location == null) {
    return {};
  }
  final firestoreData = mapToFirestore(location.toMap());

  // Handle nested data for "zone" field.
  addZoneStructData(
    firestoreData,
    location.hasZone() ? location.zone : null,
    'zone',
    forFieldValue,
  );

  // Add any Firestore field values
  location.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocationListFirestoreData(
  List<LocationStruct>? locations,
) =>
    locations?.map((e) => getLocationFirestoreData(e, true)).toList() ?? [];
