// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IdentityDocumentStruct extends FFFirebaseStruct {
  IdentityDocumentStruct({
    UserIdentityDocument? type,
    String? number,
    String? frontImage,
    String? backImage,
    String? note,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _number = number,
        _frontImage = frontImage,
        _backImage = backImage,
        _note = note,
        super(firestoreUtilData);

  // "type" field.
  UserIdentityDocument? _type;
  UserIdentityDocument? get type => _type;
  set type(UserIdentityDocument? val) => _type = val;

  bool hasType() => _type != null;

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  set number(String? val) => _number = val;

  bool hasNumber() => _number != null;

  // "frontImage" field.
  String? _frontImage;
  String get frontImage => _frontImage ?? '';
  set frontImage(String? val) => _frontImage = val;

  bool hasFrontImage() => _frontImage != null;

  // "backImage" field.
  String? _backImage;
  String get backImage => _backImage ?? '';
  set backImage(String? val) => _backImage = val;

  bool hasBackImage() => _backImage != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  static IdentityDocumentStruct fromMap(Map<String, dynamic> data) =>
      IdentityDocumentStruct(
        type: data['type'] is UserIdentityDocument
            ? data['type']
            : deserializeEnum<UserIdentityDocument>(data['type']),
        number: data['number'] as String?,
        frontImage: data['frontImage'] as String?,
        backImage: data['backImage'] as String?,
        note: data['note'] as String?,
      );

  static IdentityDocumentStruct? maybeFromMap(dynamic data) => data is Map
      ? IdentityDocumentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type?.serialize(),
        'number': _number,
        'frontImage': _frontImage,
        'backImage': _backImage,
        'note': _note,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'number': serializeParam(
          _number,
          ParamType.String,
        ),
        'frontImage': serializeParam(
          _frontImage,
          ParamType.String,
        ),
        'backImage': serializeParam(
          _backImage,
          ParamType.String,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
      }.withoutNulls;

  static IdentityDocumentStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      IdentityDocumentStruct(
        type: deserializeParam<UserIdentityDocument>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.String,
          false,
        ),
        frontImage: deserializeParam(
          data['frontImage'],
          ParamType.String,
          false,
        ),
        backImage: deserializeParam(
          data['backImage'],
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
  String toString() => 'IdentityDocumentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IdentityDocumentStruct &&
        type == other.type &&
        number == other.number &&
        frontImage == other.frontImage &&
        backImage == other.backImage &&
        note == other.note;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([type, number, frontImage, backImage, note]);
}

IdentityDocumentStruct createIdentityDocumentStruct({
  UserIdentityDocument? type,
  String? number,
  String? frontImage,
  String? backImage,
  String? note,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IdentityDocumentStruct(
      type: type,
      number: number,
      frontImage: frontImage,
      backImage: backImage,
      note: note,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IdentityDocumentStruct? updateIdentityDocumentStruct(
  IdentityDocumentStruct? identityDocument, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    identityDocument
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIdentityDocumentStructData(
  Map<String, dynamic> firestoreData,
  IdentityDocumentStruct? identityDocument,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (identityDocument == null) {
    return;
  }
  if (identityDocument.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && identityDocument.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final identityDocumentData =
      getIdentityDocumentFirestoreData(identityDocument, forFieldValue);
  final nestedData =
      identityDocumentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = identityDocument.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIdentityDocumentFirestoreData(
  IdentityDocumentStruct? identityDocument, [
  bool forFieldValue = false,
]) {
  if (identityDocument == null) {
    return {};
  }
  final firestoreData = mapToFirestore(identityDocument.toMap());

  // Add any Firestore field values
  identityDocument.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIdentityDocumentListFirestoreData(
  List<IdentityDocumentStruct>? identityDocuments,
) =>
    identityDocuments
        ?.map((e) => getIdentityDocumentFirestoreData(e, true))
        .toList() ??
    [];
