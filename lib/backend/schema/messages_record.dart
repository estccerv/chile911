import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "attachment" field.
  AttachmentStruct? _attachment;
  AttachmentStruct get attachment => _attachment ?? AttachmentStruct();
  bool hasAttachment() => _attachment != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "seenRefs" field.
  List<DocumentReference>? _seenRefs;
  List<DocumentReference> get seenRefs => _seenRefs ?? const [];
  bool hasSeenRefs() => _seenRefs != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _content = snapshotData['content'] as String?;
    _attachment = snapshotData['attachment'] is AttachmentStruct
        ? snapshotData['attachment']
        : AttachmentStruct.maybeFromMap(snapshotData['attachment']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _seenRefs = getDataList(snapshotData['seenRefs']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('messages')
          : FirebaseFirestore.instance.collectionGroup('messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('messages').doc(id);

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  DocumentReference? userRef,
  String? content,
  AttachmentStruct? attachment,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'content': content,
      'attachment': AttachmentStruct().toMap(),
      'timestamp': timestamp,
    }.withoutNulls,
  );

  // Handle nested data for "attachment" field.
  addAttachmentStructData(firestoreData, attachment, 'attachment');

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.content == e2?.content &&
        e1?.attachment == e2?.attachment &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.seenRefs, e2?.seenRefs);
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.content, e?.attachment, e?.timestamp, e?.seenRefs]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
