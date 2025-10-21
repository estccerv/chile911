// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllergyStruct extends FFFirebaseStruct {
  AllergyStruct({
    UserAllergyType? type,
    UserAllergySeverity? severity,
    String? note,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _severity = severity,
        _note = note,
        super(firestoreUtilData);

  // "type" field.
  UserAllergyType? _type;
  UserAllergyType? get type => _type;
  set type(UserAllergyType? val) => _type = val;

  bool hasType() => _type != null;

  // "severity" field.
  UserAllergySeverity? _severity;
  UserAllergySeverity? get severity => _severity;
  set severity(UserAllergySeverity? val) => _severity = val;

  bool hasSeverity() => _severity != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  static AllergyStruct fromMap(Map<String, dynamic> data) => AllergyStruct(
        type: data['type'] is UserAllergyType
            ? data['type']
            : deserializeEnum<UserAllergyType>(data['type']),
        severity: data['severity'] is UserAllergySeverity
            ? data['severity']
            : deserializeEnum<UserAllergySeverity>(data['severity']),
        note: data['note'] as String?,
      );

  static AllergyStruct? maybeFromMap(dynamic data) =>
      data is Map ? AllergyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'type': _type?.serialize(),
        'severity': _severity?.serialize(),
        'note': _note,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'severity': serializeParam(
          _severity,
          ParamType.Enum,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
      }.withoutNulls;

  static AllergyStruct fromSerializableMap(Map<String, dynamic> data) =>
      AllergyStruct(
        type: deserializeParam<UserAllergyType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        severity: deserializeParam<UserAllergySeverity>(
          data['severity'],
          ParamType.Enum,
          false,
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AllergyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AllergyStruct &&
        type == other.type &&
        severity == other.severity &&
        note == other.note;
  }

  @override
  int get hashCode => const ListEquality().hash([type, severity, note]);
}

AllergyStruct createAllergyStruct({
  UserAllergyType? type,
  UserAllergySeverity? severity,
  String? note,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AllergyStruct(
      type: type,
      severity: severity,
      note: note,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AllergyStruct? updateAllergyStruct(
  AllergyStruct? allergy, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    allergy
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAllergyStructData(
  Map<String, dynamic> firestoreData,
  AllergyStruct? allergy,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (allergy == null) {
    return;
  }
  if (allergy.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && allergy.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final allergyData = getAllergyFirestoreData(allergy, forFieldValue);
  final nestedData = allergyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = allergy.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAllergyFirestoreData(
  AllergyStruct? allergy, [
  bool forFieldValue = false,
]) {
  if (allergy == null) {
    return {};
  }
  final firestoreData = mapToFirestore(allergy.toMap());

  // Add any Firestore field values
  allergy.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAllergyListFirestoreData(
  List<AllergyStruct>? allergys,
) =>
    allergys?.map((e) => getAllergyFirestoreData(e, true)).toList() ?? [];
