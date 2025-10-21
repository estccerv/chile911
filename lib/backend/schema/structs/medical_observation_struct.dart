// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MedicalObservationStruct extends FFFirebaseStruct {
  MedicalObservationStruct({
    String? name,
    String? note,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _note = note,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  static MedicalObservationStruct fromMap(Map<String, dynamic> data) =>
      MedicalObservationStruct(
        name: data['name'] as String?,
        note: data['note'] as String?,
      );

  static MedicalObservationStruct? maybeFromMap(dynamic data) => data is Map
      ? MedicalObservationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'note': _note,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
      }.withoutNulls;

  static MedicalObservationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MedicalObservationStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MedicalObservationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MedicalObservationStruct &&
        name == other.name &&
        note == other.note;
  }

  @override
  int get hashCode => const ListEquality().hash([name, note]);
}

MedicalObservationStruct createMedicalObservationStruct({
  String? name,
  String? note,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MedicalObservationStruct(
      name: name,
      note: note,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MedicalObservationStruct? updateMedicalObservationStruct(
  MedicalObservationStruct? medicalObservation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    medicalObservation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMedicalObservationStructData(
  Map<String, dynamic> firestoreData,
  MedicalObservationStruct? medicalObservation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (medicalObservation == null) {
    return;
  }
  if (medicalObservation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && medicalObservation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final medicalObservationData =
      getMedicalObservationFirestoreData(medicalObservation, forFieldValue);
  final nestedData =
      medicalObservationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      medicalObservation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMedicalObservationFirestoreData(
  MedicalObservationStruct? medicalObservation, [
  bool forFieldValue = false,
]) {
  if (medicalObservation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(medicalObservation.toMap());

  // Add any Firestore field values
  medicalObservation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMedicalObservationListFirestoreData(
  List<MedicalObservationStruct>? medicalObservations,
) =>
    medicalObservations
        ?.map((e) => getMedicalObservationFirestoreData(e, true))
        .toList() ??
    [];
