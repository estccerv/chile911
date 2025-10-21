// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionStruct extends FFFirebaseStruct {
  QuestionStruct({
    String? title,
    List<String>? options,
    SurveyQuestionType? type,
    bool? required,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _options = options,
        _type = type,
        _required = required,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;

  void updateOptions(Function(List<String>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  // "type" field.
  SurveyQuestionType? _type;
  SurveyQuestionType? get type => _type;
  set type(SurveyQuestionType? val) => _type = val;

  bool hasType() => _type != null;

  // "required" field.
  bool? _required;
  bool get required => _required ?? false;
  set required(bool? val) => _required = val;

  bool hasRequired() => _required != null;

  static QuestionStruct fromMap(Map<String, dynamic> data) => QuestionStruct(
        title: data['title'] as String?,
        options: getDataList(data['options']),
        type: data['type'] is SurveyQuestionType
            ? data['type']
            : deserializeEnum<SurveyQuestionType>(data['type']),
        required: data['required'] as bool?,
      );

  static QuestionStruct? maybeFromMap(dynamic data) =>
      data is Map ? QuestionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'options': _options,
        'type': _type?.serialize(),
        'required': _required,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
          isList: true,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'required': serializeParam(
          _required,
          ParamType.bool,
        ),
      }.withoutNulls;

  static QuestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        options: deserializeParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
        type: deserializeParam<SurveyQuestionType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        required: deserializeParam(
          data['required'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'QuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionStruct &&
        title == other.title &&
        listEquality.equals(options, other.options) &&
        type == other.type &&
        required == other.required;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, options, type, required]);
}

QuestionStruct createQuestionStruct({
  String? title,
  SurveyQuestionType? type,
  bool? required,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuestionStruct(
      title: title,
      type: type,
      required: required,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuestionStruct? updateQuestionStruct(
  QuestionStruct? question, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    question
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuestionStructData(
  Map<String, dynamic> firestoreData,
  QuestionStruct? question,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (question == null) {
    return;
  }
  if (question.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && question.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final questionData = getQuestionFirestoreData(question, forFieldValue);
  final nestedData = questionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = question.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuestionFirestoreData(
  QuestionStruct? question, [
  bool forFieldValue = false,
]) {
  if (question == null) {
    return {};
  }
  final firestoreData = mapToFirestore(question.toMap());

  // Add any Firestore field values
  question.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuestionListFirestoreData(
  List<QuestionStruct>? questions,
) =>
    questions?.map((e) => getQuestionFirestoreData(e, true)).toList() ?? [];
