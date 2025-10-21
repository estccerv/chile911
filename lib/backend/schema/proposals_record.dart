import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProposalsRecord extends FirestoreRecord {
  ProposalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "type" field.
  ProposalType? _type;
  ProposalType? get type => _type;
  bool hasType() => _type != null;

  // "attachment" field.
  AttachmentStruct? _attachment;
  AttachmentStruct get attachment => _attachment ?? AttachmentStruct();
  bool hasAttachment() => _attachment != null;

  // "targetInstitutions" field.
  List<InstitutionType>? _targetInstitutions;
  List<InstitutionType> get targetInstitutions =>
      _targetInstitutions ?? const [];
  bool hasTargetInstitutions() => _targetInstitutions != null;

  // "status" field.
  ProposalStatus? _status;
  ProposalStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _type = snapshotData['type'] is ProposalType
        ? snapshotData['type']
        : deserializeEnum<ProposalType>(snapshotData['type']);
    _attachment = snapshotData['attachment'] is AttachmentStruct
        ? snapshotData['attachment']
        : AttachmentStruct.maybeFromMap(snapshotData['attachment']);
    _targetInstitutions =
        getEnumList<InstitutionType>(snapshotData['targetInstitutions']);
    _status = snapshotData['status'] is ProposalStatus
        ? snapshotData['status']
        : deserializeEnum<ProposalStatus>(snapshotData['status']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('proposals');

  static Stream<ProposalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProposalsRecord.fromSnapshot(s));

  static Future<ProposalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProposalsRecord.fromSnapshot(s));

  static ProposalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProposalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProposalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProposalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProposalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProposalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProposalsRecordData({
  DocumentReference? userRef,
  String? title,
  String? description,
  ProposalType? type,
  AttachmentStruct? attachment,
  ProposalStatus? status,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'title': title,
      'description': description,
      'type': type,
      'attachment': AttachmentStruct().toMap(),
      'status': status,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  // Handle nested data for "attachment" field.
  addAttachmentStructData(firestoreData, attachment, 'attachment');

  return firestoreData;
}

class ProposalsRecordDocumentEquality implements Equality<ProposalsRecord> {
  const ProposalsRecordDocumentEquality();

  @override
  bool equals(ProposalsRecord? e1, ProposalsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.type == e2?.type &&
        e1?.attachment == e2?.attachment &&
        listEquality.equals(e1?.targetInstitutions, e2?.targetInstitutions) &&
        e1?.status == e2?.status &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(ProposalsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.title,
        e?.description,
        e?.type,
        e?.attachment,
        e?.targetInstitutions,
        e?.status,
        e?.timestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is ProposalsRecord;
}
