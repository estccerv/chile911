import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponsesRecord extends FirestoreRecord {
  ResponsesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "answers" field.
  List<QuestionStruct>? _answers;
  List<QuestionStruct> get answers => _answers ?? const [];
  bool hasAnswers() => _answers != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _answers = getStructList(
      snapshotData['answers'],
      QuestionStruct.fromMap,
    );
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _note = snapshotData['note'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('responses')
          : FirebaseFirestore.instance.collectionGroup('responses');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('responses').doc(id);

  static Stream<ResponsesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResponsesRecord.fromSnapshot(s));

  static Future<ResponsesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResponsesRecord.fromSnapshot(s));

  static ResponsesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResponsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResponsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResponsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResponsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResponsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResponsesRecordData({
  DateTime? timestamp,
  DocumentReference? userRef,
  String? note,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'userRef': userRef,
      'note': note,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResponsesRecordDocumentEquality implements Equality<ResponsesRecord> {
  const ResponsesRecordDocumentEquality();

  @override
  bool equals(ResponsesRecord? e1, ResponsesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.answers, e2?.answers) &&
        e1?.userRef == e2?.userRef &&
        e1?.note == e2?.note;
  }

  @override
  int hash(ResponsesRecord? e) => const ListEquality()
      .hash([e?.timestamp, e?.answers, e?.userRef, e?.note]);

  @override
  bool isValidKey(Object? o) => o is ResponsesRecord;
}
