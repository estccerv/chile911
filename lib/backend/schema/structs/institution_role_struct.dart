// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstitutionRoleStruct extends FFFirebaseStruct {
  InstitutionRoleStruct({
    InstitutionRol? rol,
    DocumentReference? ref,
    UserStatus? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _rol = rol,
        _ref = ref,
        _status = status,
        super(firestoreUtilData);

  // "rol" field.
  InstitutionRol? _rol;
  InstitutionRol? get rol => _rol;
  set rol(InstitutionRol? val) => _rol = val;

  bool hasRol() => _rol != null;

  // "ref" field.
  DocumentReference? _ref;
  DocumentReference? get ref => _ref;
  set ref(DocumentReference? val) => _ref = val;

  bool hasRef() => _ref != null;

  // "status" field.
  UserStatus? _status;
  UserStatus? get status => _status;
  set status(UserStatus? val) => _status = val;

  bool hasStatus() => _status != null;

  static InstitutionRoleStruct fromMap(Map<String, dynamic> data) =>
      InstitutionRoleStruct(
        rol: data['rol'] is InstitutionRol
            ? data['rol']
            : deserializeEnum<InstitutionRol>(data['rol']),
        ref: data['ref'] as DocumentReference?,
        status: data['status'] is UserStatus
            ? data['status']
            : deserializeEnum<UserStatus>(data['status']),
      );

  static InstitutionRoleStruct? maybeFromMap(dynamic data) => data is Map
      ? InstitutionRoleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'rol': _rol?.serialize(),
        'ref': _ref,
        'status': _status?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rol': serializeParam(
          _rol,
          ParamType.Enum,
        ),
        'ref': serializeParam(
          _ref,
          ParamType.DocumentReference,
        ),
        'status': serializeParam(
          _status,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static InstitutionRoleStruct fromSerializableMap(Map<String, dynamic> data) =>
      InstitutionRoleStruct(
        rol: deserializeParam<InstitutionRol>(
          data['rol'],
          ParamType.Enum,
          false,
        ),
        ref: deserializeParam(
          data['ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['institutions'],
        ),
        status: deserializeParam<UserStatus>(
          data['status'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'InstitutionRoleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InstitutionRoleStruct &&
        rol == other.rol &&
        ref == other.ref &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([rol, ref, status]);
}

InstitutionRoleStruct createInstitutionRoleStruct({
  InstitutionRol? rol,
  DocumentReference? ref,
  UserStatus? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InstitutionRoleStruct(
      rol: rol,
      ref: ref,
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InstitutionRoleStruct? updateInstitutionRoleStruct(
  InstitutionRoleStruct? institutionRole, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    institutionRole
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInstitutionRoleStructData(
  Map<String, dynamic> firestoreData,
  InstitutionRoleStruct? institutionRole,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (institutionRole == null) {
    return;
  }
  if (institutionRole.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && institutionRole.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final institutionRoleData =
      getInstitutionRoleFirestoreData(institutionRole, forFieldValue);
  final nestedData =
      institutionRoleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = institutionRole.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInstitutionRoleFirestoreData(
  InstitutionRoleStruct? institutionRole, [
  bool forFieldValue = false,
]) {
  if (institutionRole == null) {
    return {};
  }
  final firestoreData = mapToFirestore(institutionRole.toMap());

  // Add any Firestore field values
  institutionRole.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInstitutionRoleListFirestoreData(
  List<InstitutionRoleStruct>? institutionRoles,
) =>
    institutionRoles
        ?.map((e) => getInstitutionRoleFirestoreData(e, true))
        .toList() ??
    [];
