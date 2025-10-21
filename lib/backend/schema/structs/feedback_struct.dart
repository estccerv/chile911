// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FeedbackStruct extends FFFirebaseStruct {
  FeedbackStruct({
    double? rating,
    String? comment,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _rating = rating,
        _comment = comment,
        super(firestoreUtilData);

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  set rating(double? val) => _rating = val;

  void incrementRating(double amount) => rating = rating + amount;

  bool hasRating() => _rating != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  set comment(String? val) => _comment = val;

  bool hasComment() => _comment != null;

  static FeedbackStruct fromMap(Map<String, dynamic> data) => FeedbackStruct(
        rating: castToType<double>(data['rating']),
        comment: data['comment'] as String?,
      );

  static FeedbackStruct? maybeFromMap(dynamic data) =>
      data is Map ? FeedbackStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'rating': _rating,
        'comment': _comment,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rating': serializeParam(
          _rating,
          ParamType.double,
        ),
        'comment': serializeParam(
          _comment,
          ParamType.String,
        ),
      }.withoutNulls;

  static FeedbackStruct fromSerializableMap(Map<String, dynamic> data) =>
      FeedbackStruct(
        rating: deserializeParam(
          data['rating'],
          ParamType.double,
          false,
        ),
        comment: deserializeParam(
          data['comment'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FeedbackStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FeedbackStruct &&
        rating == other.rating &&
        comment == other.comment;
  }

  @override
  int get hashCode => const ListEquality().hash([rating, comment]);
}

FeedbackStruct createFeedbackStruct({
  double? rating,
  String? comment,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FeedbackStruct(
      rating: rating,
      comment: comment,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FeedbackStruct? updateFeedbackStruct(
  FeedbackStruct? feedback, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    feedback
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFeedbackStructData(
  Map<String, dynamic> firestoreData,
  FeedbackStruct? feedback,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (feedback == null) {
    return;
  }
  if (feedback.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && feedback.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final feedbackData = getFeedbackFirestoreData(feedback, forFieldValue);
  final nestedData = feedbackData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = feedback.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFeedbackFirestoreData(
  FeedbackStruct? feedback, [
  bool forFieldValue = false,
]) {
  if (feedback == null) {
    return {};
  }
  final firestoreData = mapToFirestore(feedback.toMap());

  // Add any Firestore field values
  feedback.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFeedbackListFirestoreData(
  List<FeedbackStruct>? feedbacks,
) =>
    feedbacks?.map((e) => getFeedbackFirestoreData(e, true)).toList() ?? [];
