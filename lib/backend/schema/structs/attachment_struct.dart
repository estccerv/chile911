// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttachmentStruct extends FFFirebaseStruct {
  AttachmentStruct({
    List<String>? images,
    List<String>? videos,
    List<String>? audios,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _images = images,
        _videos = videos,
        _audios = audios,
        super(firestoreUtilData);

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "videos" field.
  List<String>? _videos;
  List<String> get videos => _videos ?? const [];
  set videos(List<String>? val) => _videos = val;

  void updateVideos(Function(List<String>) updateFn) {
    updateFn(_videos ??= []);
  }

  bool hasVideos() => _videos != null;

  // "audios" field.
  List<String>? _audios;
  List<String> get audios => _audios ?? const [];
  set audios(List<String>? val) => _audios = val;

  void updateAudios(Function(List<String>) updateFn) {
    updateFn(_audios ??= []);
  }

  bool hasAudios() => _audios != null;

  static AttachmentStruct fromMap(Map<String, dynamic> data) =>
      AttachmentStruct(
        images: getDataList(data['images']),
        videos: getDataList(data['videos']),
        audios: getDataList(data['audios']),
      );

  static AttachmentStruct? maybeFromMap(dynamic data) => data is Map
      ? AttachmentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'images': _images,
        'videos': _videos,
        'audios': _audios,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'videos': serializeParam(
          _videos,
          ParamType.String,
          isList: true,
        ),
        'audios': serializeParam(
          _audios,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static AttachmentStruct fromSerializableMap(Map<String, dynamic> data) =>
      AttachmentStruct(
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        videos: deserializeParam<String>(
          data['videos'],
          ParamType.String,
          true,
        ),
        audios: deserializeParam<String>(
          data['audios'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'AttachmentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AttachmentStruct &&
        listEquality.equals(images, other.images) &&
        listEquality.equals(videos, other.videos) &&
        listEquality.equals(audios, other.audios);
  }

  @override
  int get hashCode => const ListEquality().hash([images, videos, audios]);
}

AttachmentStruct createAttachmentStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AttachmentStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AttachmentStruct? updateAttachmentStruct(
  AttachmentStruct? attachment, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    attachment
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAttachmentStructData(
  Map<String, dynamic> firestoreData,
  AttachmentStruct? attachment,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (attachment == null) {
    return;
  }
  if (attachment.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && attachment.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final attachmentData = getAttachmentFirestoreData(attachment, forFieldValue);
  final nestedData = attachmentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = attachment.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAttachmentFirestoreData(
  AttachmentStruct? attachment, [
  bool forFieldValue = false,
]) {
  if (attachment == null) {
    return {};
  }
  final firestoreData = mapToFirestore(attachment.toMap());

  // Add any Firestore field values
  attachment.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAttachmentListFirestoreData(
  List<AttachmentStruct>? attachments,
) =>
    attachments?.map((e) => getAttachmentFirestoreData(e, true)).toList() ?? [];
