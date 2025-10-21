import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbacksRecord extends FirestoreRecord {
  FeedbacksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "attachment" field.
  AttachmentStruct? _attachment;
  AttachmentStruct get attachment => _attachment ?? AttachmentStruct();
  bool hasAttachment() => _attachment != null;

  // "previousStatus" field.
  ProposalStatus? _previousStatus;
  ProposalStatus? get previousStatus => _previousStatus;
  bool hasPreviousStatus() => _previousStatus != null;

  // "newStatus" field.
  ProposalStatus? _newStatus;
  ProposalStatus? get newStatus => _newStatus;
  bool hasNewStatus() => _newStatus != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _attachment = snapshotData['attachment'] is AttachmentStruct
        ? snapshotData['attachment']
        : AttachmentStruct.maybeFromMap(snapshotData['attachment']);
    _previousStatus = snapshotData['previousStatus'] is ProposalStatus
        ? snapshotData['previousStatus']
        : deserializeEnum<ProposalStatus>(snapshotData['previousStatus']);
    _newStatus = snapshotData['newStatus'] is ProposalStatus
        ? snapshotData['newStatus']
        : deserializeEnum<ProposalStatus>(snapshotData['newStatus']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('feedbacks')
          : FirebaseFirestore.instance.collectionGroup('feedbacks');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('feedbacks').doc(id);

  static Stream<FeedbacksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbacksRecord.fromSnapshot(s));

  static Future<FeedbacksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbacksRecord.fromSnapshot(s));

  static FeedbacksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbacksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbacksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbacksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbacksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbacksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbacksRecordData({
  DateTime? timestamp,
  DocumentReference? userRef,
  String? comment,
  AttachmentStruct? attachment,
  ProposalStatus? previousStatus,
  ProposalStatus? newStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'userRef': userRef,
      'comment': comment,
      'attachment': AttachmentStruct().toMap(),
      'previousStatus': previousStatus,
      'newStatus': newStatus,
    }.withoutNulls,
  );

  // Handle nested data for "attachment" field.
  addAttachmentStructData(firestoreData, attachment, 'attachment');

  return firestoreData;
}

class FeedbacksRecordDocumentEquality implements Equality<FeedbacksRecord> {
  const FeedbacksRecordDocumentEquality();

  @override
  bool equals(FeedbacksRecord? e1, FeedbacksRecord? e2) {
    return e1?.timestamp == e2?.timestamp &&
        e1?.userRef == e2?.userRef &&
        e1?.comment == e2?.comment &&
        e1?.attachment == e2?.attachment &&
        e1?.previousStatus == e2?.previousStatus &&
        e1?.newStatus == e2?.newStatus;
  }

  @override
  int hash(FeedbacksRecord? e) => const ListEquality().hash([
        e?.timestamp,
        e?.userRef,
        e?.comment,
        e?.attachment,
        e?.previousStatus,
        e?.newStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is FeedbacksRecord;
}
