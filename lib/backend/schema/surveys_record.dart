import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Almacena encuestas y sondeos creados por las instituciones
class SurveysRecord extends FirestoreRecord {
  SurveysRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "type" field.
  SurveyType? _type;
  SurveyType? get type => _type;
  bool hasType() => _type != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "closingTimestamp" field.
  DateTime? _closingTimestamp;
  DateTime? get closingTimestamp => _closingTimestamp;
  bool hasClosingTimestamp() => _closingTimestamp != null;

  // "status" field.
  SurveyStatus? _status;
  SurveyStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "questions" field.
  List<QuestionStruct>? _questions;
  List<QuestionStruct> get questions => _questions ?? const [];
  bool hasQuestions() => _questions != null;

  // "isAnonymous" field.
  bool? _isAnonymous;
  bool get isAnonymous => _isAnonymous ?? false;
  bool hasIsAnonymous() => _isAnonymous != null;

  // "institutionRef" field.
  DocumentReference? _institutionRef;
  DocumentReference? get institutionRef => _institutionRef;
  bool hasInstitutionRef() => _institutionRef != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _type = snapshotData['type'] is SurveyType
        ? snapshotData['type']
        : deserializeEnum<SurveyType>(snapshotData['type']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _closingTimestamp = snapshotData['closingTimestamp'] as DateTime?;
    _status = snapshotData['status'] is SurveyStatus
        ? snapshotData['status']
        : deserializeEnum<SurveyStatus>(snapshotData['status']);
    _questions = getStructList(
      snapshotData['questions'],
      QuestionStruct.fromMap,
    );
    _isAnonymous = snapshotData['isAnonymous'] as bool?;
    _institutionRef = snapshotData['institutionRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('surveys');

  static Stream<SurveysRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SurveysRecord.fromSnapshot(s));

  static Future<SurveysRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SurveysRecord.fromSnapshot(s));

  static SurveysRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SurveysRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SurveysRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SurveysRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SurveysRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SurveysRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSurveysRecordData({
  String? title,
  String? description,
  SurveyType? type,
  DateTime? timestamp,
  DateTime? closingTimestamp,
  SurveyStatus? status,
  bool? isAnonymous,
  DocumentReference? institutionRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'type': type,
      'timestamp': timestamp,
      'closingTimestamp': closingTimestamp,
      'status': status,
      'isAnonymous': isAnonymous,
      'institutionRef': institutionRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class SurveysRecordDocumentEquality implements Equality<SurveysRecord> {
  const SurveysRecordDocumentEquality();

  @override
  bool equals(SurveysRecord? e1, SurveysRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.type == e2?.type &&
        e1?.timestamp == e2?.timestamp &&
        e1?.closingTimestamp == e2?.closingTimestamp &&
        e1?.status == e2?.status &&
        listEquality.equals(e1?.questions, e2?.questions) &&
        e1?.isAnonymous == e2?.isAnonymous &&
        e1?.institutionRef == e2?.institutionRef;
  }

  @override
  int hash(SurveysRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.type,
        e?.timestamp,
        e?.closingTimestamp,
        e?.status,
        e?.questions,
        e?.isAnonymous,
        e?.institutionRef
      ]);

  @override
  bool isValidKey(Object? o) => o is SurveysRecord;
}
