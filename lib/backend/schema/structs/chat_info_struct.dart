// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatInfoStruct extends FFFirebaseStruct {
  ChatInfoStruct({
    String? title,
    String? description,
    String? image,
    List<DocumentReference>? admins,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        _image = image,
        _admins = admins,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "admins" field.
  List<DocumentReference>? _admins;
  List<DocumentReference> get admins => _admins ?? const [];
  set admins(List<DocumentReference>? val) => _admins = val;

  void updateAdmins(Function(List<DocumentReference>) updateFn) {
    updateFn(_admins ??= []);
  }

  bool hasAdmins() => _admins != null;

  static ChatInfoStruct fromMap(Map<String, dynamic> data) => ChatInfoStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        image: data['image'] as String?,
        admins: getDataList(data['admins']),
      );

  static ChatInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChatInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'image': _image,
        'admins': _admins,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'admins': serializeParam(
          _admins,
          ParamType.DocumentReference,
          isList: true,
        ),
      }.withoutNulls;

  static ChatInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatInfoStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        admins: deserializeParam<DocumentReference>(
          data['admins'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'ChatInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ChatInfoStruct &&
        title == other.title &&
        description == other.description &&
        image == other.image &&
        listEquality.equals(admins, other.admins);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, description, image, admins]);
}

ChatInfoStruct createChatInfoStruct({
  String? title,
  String? description,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatInfoStruct(
      title: title,
      description: description,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatInfoStruct? updateChatInfoStruct(
  ChatInfoStruct? chatInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatInfoStructData(
  Map<String, dynamic> firestoreData,
  ChatInfoStruct? chatInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatInfo == null) {
    return;
  }
  if (chatInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatInfoData = getChatInfoFirestoreData(chatInfo, forFieldValue);
  final nestedData = chatInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatInfoFirestoreData(
  ChatInfoStruct? chatInfo, [
  bool forFieldValue = false,
]) {
  if (chatInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatInfo.toMap());

  // Add any Firestore field values
  chatInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatInfoListFirestoreData(
  List<ChatInfoStruct>? chatInfos,
) =>
    chatInfos?.map((e) => getChatInfoFirestoreData(e, true)).toList() ?? [];
