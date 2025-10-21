import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnnouncementsRecord extends FirestoreRecord {
  AnnouncementsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "institutionRef" field.
  DocumentReference? _institutionRef;
  DocumentReference? get institutionRef => _institutionRef;
  bool hasInstitutionRef() => _institutionRef != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "type" field.
  AnnouncementType? _type;
  AnnouncementType? get type => _type;
  bool hasType() => _type != null;

  // "severity" field.
  AnnouncementSeverity? _severity;
  AnnouncementSeverity? get severity => _severity;
  bool hasSeverity() => _severity != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "expirationTimestamp" field.
  DateTime? _expirationTimestamp;
  DateTime? get expirationTimestamp => _expirationTimestamp;
  bool hasExpirationTimestamp() => _expirationTimestamp != null;

  // "attachment" field.
  AttachmentStruct? _attachment;
  AttachmentStruct get attachment => _attachment ?? AttachmentStruct();
  bool hasAttachment() => _attachment != null;

  // "subType" field.
  String? _subType;
  String get subType => _subType ?? '';
  bool hasSubType() => _subType != null;

  void _initializeFields() {
    _institutionRef = snapshotData['institutionRef'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _type = snapshotData['type'] is AnnouncementType
        ? snapshotData['type']
        : deserializeEnum<AnnouncementType>(snapshotData['type']);
    _severity = snapshotData['severity'] is AnnouncementSeverity
        ? snapshotData['severity']
        : deserializeEnum<AnnouncementSeverity>(snapshotData['severity']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _expirationTimestamp = snapshotData['expirationTimestamp'] as DateTime?;
    _attachment = snapshotData['attachment'] is AttachmentStruct
        ? snapshotData['attachment']
        : AttachmentStruct.maybeFromMap(snapshotData['attachment']);
    _subType = snapshotData['subType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('announcements');

  static Stream<AnnouncementsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnnouncementsRecord.fromSnapshot(s));

  static Future<AnnouncementsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnnouncementsRecord.fromSnapshot(s));

  static AnnouncementsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnnouncementsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnnouncementsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnnouncementsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnnouncementsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnnouncementsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnnouncementsRecordData({
  DocumentReference? institutionRef,
  String? title,
  String? content,
  AnnouncementType? type,
  AnnouncementSeverity? severity,
  DateTime? timestamp,
  DateTime? expirationTimestamp,
  AttachmentStruct? attachment,
  String? subType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'institutionRef': institutionRef,
      'title': title,
      'content': content,
      'type': type,
      'severity': severity,
      'timestamp': timestamp,
      'expirationTimestamp': expirationTimestamp,
      'attachment': AttachmentStruct().toMap(),
      'subType': subType,
    }.withoutNulls,
  );

  // Handle nested data for "attachment" field.
  addAttachmentStructData(firestoreData, attachment, 'attachment');

  return firestoreData;
}

class AnnouncementsRecordDocumentEquality
    implements Equality<AnnouncementsRecord> {
  const AnnouncementsRecordDocumentEquality();

  @override
  bool equals(AnnouncementsRecord? e1, AnnouncementsRecord? e2) {
    return e1?.institutionRef == e2?.institutionRef &&
        e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.type == e2?.type &&
        e1?.severity == e2?.severity &&
        e1?.timestamp == e2?.timestamp &&
        e1?.expirationTimestamp == e2?.expirationTimestamp &&
        e1?.attachment == e2?.attachment &&
        e1?.subType == e2?.subType;
  }

  @override
  int hash(AnnouncementsRecord? e) => const ListEquality().hash([
        e?.institutionRef,
        e?.title,
        e?.content,
        e?.type,
        e?.severity,
        e?.timestamp,
        e?.expirationTimestamp,
        e?.attachment,
        e?.subType
      ]);

  @override
  bool isValidKey(Object? o) => o is AnnouncementsRecord;
}
