// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DisabilityStruct extends FFFirebaseStruct {
  DisabilityStruct({
    UserDisabilityType? type,
    UserDisabilitySeverity? severity,
    String? note,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _severity = severity,
        _note = note,
        super(firestoreUtilData);

  // "type" field.
  UserDisabilityType? _type;
  UserDisabilityType? get type => _type;
  set type(UserDisabilityType? val) => _type = val;

  bool hasType() => _type != null;

  // "severity" field.
  UserDisabilitySeverity? _severity;
  UserDisabilitySeverity? get severity => _severity;
  set severity(UserDisabilitySeverity? val) => _severity = val;

  bool hasSeverity() => _severity != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  static DisabilityStruct fromMap(Map<String, dynamic> data) =>
      DisabilityStruct(
        type: data['type'] is UserDisabilityType
            ? data['type']
            : deserializeEnum<UserDisabilityType>(data['type']),
        severity: data['severity'] is UserDisabilitySeverity
            ? data['severity']
            : deserializeEnum<UserDisabilitySeverity>(data['severity']),
        note: data['note'] as String?,
      );

  static DisabilityStruct? maybeFromMap(dynamic data) => data is Map
      ? DisabilityStruct.fromMap(data.cast<String, dynamic>())
      : null;

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

  static DisabilityStruct fromSerializableMap(Map<String, dynamic> data) =>
      DisabilityStruct(
        type: deserializeParam<UserDisabilityType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        severity: deserializeParam<UserDisabilitySeverity>(
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
  String toString() => 'DisabilityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DisabilityStruct &&
        type == other.type &&
        severity == other.severity &&
        note == other.note;
  }

  @override
  int get hashCode => const ListEquality().hash([type, severity, note]);
}

DisabilityStruct createDisabilityStruct({
  UserDisabilityType? type,
  UserDisabilitySeverity? severity,
  String? note,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DisabilityStruct(
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

DisabilityStruct? updateDisabilityStruct(
  DisabilityStruct? disability, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    disability
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDisabilityStructData(
  Map<String, dynamic> firestoreData,
  DisabilityStruct? disability,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (disability == null) {
    return;
  }
  if (disability.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && disability.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final disabilityData = getDisabilityFirestoreData(disability, forFieldValue);
  final nestedData = disabilityData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = disability.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDisabilityFirestoreData(
  DisabilityStruct? disability, [
  bool forFieldValue = false,
]) {
  if (disability == null) {
    return {};
  }
  final firestoreData = mapToFirestore(disability.toMap());

  // Add any Firestore field values
  disability.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDisabilityListFirestoreData(
  List<DisabilityStruct>? disabilitys,
) =>
    disabilitys?.map((e) => getDisabilityFirestoreData(e, true)).toList() ?? [];
