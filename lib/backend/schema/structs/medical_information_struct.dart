// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicalInformationStruct extends FFFirebaseStruct {
  MedicalInformationStruct({
    UserBloodType? bloodType,
    List<AllergyStruct>? allergies,
    List<MedicalObservationStruct>? conditions,
    List<MedicalObservationStruct>? medications,
    List<DisabilityStruct>? disabilities,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _bloodType = bloodType,
        _allergies = allergies,
        _conditions = conditions,
        _medications = medications,
        _disabilities = disabilities,
        super(firestoreUtilData);

  // "bloodType" field.
  UserBloodType? _bloodType;
  UserBloodType? get bloodType => _bloodType;
  set bloodType(UserBloodType? val) => _bloodType = val;

  bool hasBloodType() => _bloodType != null;

  // "allergies" field.
  List<AllergyStruct>? _allergies;
  List<AllergyStruct> get allergies => _allergies ?? const [];
  set allergies(List<AllergyStruct>? val) => _allergies = val;

  void updateAllergies(Function(List<AllergyStruct>) updateFn) {
    updateFn(_allergies ??= []);
  }

  bool hasAllergies() => _allergies != null;

  // "conditions" field.
  List<MedicalObservationStruct>? _conditions;
  List<MedicalObservationStruct> get conditions => _conditions ?? const [];
  set conditions(List<MedicalObservationStruct>? val) => _conditions = val;

  void updateConditions(Function(List<MedicalObservationStruct>) updateFn) {
    updateFn(_conditions ??= []);
  }

  bool hasConditions() => _conditions != null;

  // "medications" field.
  List<MedicalObservationStruct>? _medications;
  List<MedicalObservationStruct> get medications => _medications ?? const [];
  set medications(List<MedicalObservationStruct>? val) => _medications = val;

  void updateMedications(Function(List<MedicalObservationStruct>) updateFn) {
    updateFn(_medications ??= []);
  }

  bool hasMedications() => _medications != null;

  // "disabilities" field.
  List<DisabilityStruct>? _disabilities;
  List<DisabilityStruct> get disabilities => _disabilities ?? const [];
  set disabilities(List<DisabilityStruct>? val) => _disabilities = val;

  void updateDisabilities(Function(List<DisabilityStruct>) updateFn) {
    updateFn(_disabilities ??= []);
  }

  bool hasDisabilities() => _disabilities != null;

  static MedicalInformationStruct fromMap(Map<String, dynamic> data) =>
      MedicalInformationStruct(
        bloodType: data['bloodType'] is UserBloodType
            ? data['bloodType']
            : deserializeEnum<UserBloodType>(data['bloodType']),
        allergies: getStructList(
          data['allergies'],
          AllergyStruct.fromMap,
        ),
        conditions: getStructList(
          data['conditions'],
          MedicalObservationStruct.fromMap,
        ),
        medications: getStructList(
          data['medications'],
          MedicalObservationStruct.fromMap,
        ),
        disabilities: getStructList(
          data['disabilities'],
          DisabilityStruct.fromMap,
        ),
      );

  static MedicalInformationStruct? maybeFromMap(dynamic data) => data is Map
      ? MedicalInformationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'bloodType': _bloodType?.serialize(),
        'allergies': _allergies?.map((e) => e.toMap()).toList(),
        'conditions': _conditions?.map((e) => e.toMap()).toList(),
        'medications': _medications?.map((e) => e.toMap()).toList(),
        'disabilities': _disabilities?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bloodType': serializeParam(
          _bloodType,
          ParamType.Enum,
        ),
        'allergies': serializeParam(
          _allergies,
          ParamType.DataStruct,
          isList: true,
        ),
        'conditions': serializeParam(
          _conditions,
          ParamType.DataStruct,
          isList: true,
        ),
        'medications': serializeParam(
          _medications,
          ParamType.DataStruct,
          isList: true,
        ),
        'disabilities': serializeParam(
          _disabilities,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MedicalInformationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MedicalInformationStruct(
        bloodType: deserializeParam<UserBloodType>(
          data['bloodType'],
          ParamType.Enum,
          false,
        ),
        allergies: deserializeStructParam<AllergyStruct>(
          data['allergies'],
          ParamType.DataStruct,
          true,
          structBuilder: AllergyStruct.fromSerializableMap,
        ),
        conditions: deserializeStructParam<MedicalObservationStruct>(
          data['conditions'],
          ParamType.DataStruct,
          true,
          structBuilder: MedicalObservationStruct.fromSerializableMap,
        ),
        medications: deserializeStructParam<MedicalObservationStruct>(
          data['medications'],
          ParamType.DataStruct,
          true,
          structBuilder: MedicalObservationStruct.fromSerializableMap,
        ),
        disabilities: deserializeStructParam<DisabilityStruct>(
          data['disabilities'],
          ParamType.DataStruct,
          true,
          structBuilder: DisabilityStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MedicalInformationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MedicalInformationStruct &&
        bloodType == other.bloodType &&
        listEquality.equals(allergies, other.allergies) &&
        listEquality.equals(conditions, other.conditions) &&
        listEquality.equals(medications, other.medications) &&
        listEquality.equals(disabilities, other.disabilities);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([bloodType, allergies, conditions, medications, disabilities]);
}

MedicalInformationStruct createMedicalInformationStruct({
  UserBloodType? bloodType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MedicalInformationStruct(
      bloodType: bloodType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MedicalInformationStruct? updateMedicalInformationStruct(
  MedicalInformationStruct? medicalInformation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    medicalInformation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMedicalInformationStructData(
  Map<String, dynamic> firestoreData,
  MedicalInformationStruct? medicalInformation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (medicalInformation == null) {
    return;
  }
  if (medicalInformation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && medicalInformation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final medicalInformationData =
      getMedicalInformationFirestoreData(medicalInformation, forFieldValue);
  final nestedData =
      medicalInformationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      medicalInformation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMedicalInformationFirestoreData(
  MedicalInformationStruct? medicalInformation, [
  bool forFieldValue = false,
]) {
  if (medicalInformation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(medicalInformation.toMap());

  // Add any Firestore field values
  medicalInformation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMedicalInformationListFirestoreData(
  List<MedicalInformationStruct>? medicalInformations,
) =>
    medicalInformations
        ?.map((e) => getMedicalInformationFirestoreData(e, true))
        .toList() ??
    [];
