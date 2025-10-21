import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "usersRefs" field.
  List<DocumentReference>? _usersRefs;
  List<DocumentReference> get usersRefs => _usersRefs ?? const [];
  bool hasUsersRefs() => _usersRefs != null;

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "lastTimestamp" field.
  DateTime? _lastTimestamp;
  DateTime? get lastTimestamp => _lastTimestamp;
  bool hasLastTimestamp() => _lastTimestamp != null;

  // "lastMessageSeen" field.
  bool? _lastMessageSeen;
  bool get lastMessageSeen => _lastMessageSeen ?? false;
  bool hasLastMessageSeen() => _lastMessageSeen != null;

  // "lastMessageRef" field.
  DocumentReference? _lastMessageRef;
  DocumentReference? get lastMessageRef => _lastMessageRef;
  bool hasLastMessageRef() => _lastMessageRef != null;

  // "groupInfo" field.
  ChatInfoStruct? _groupInfo;
  ChatInfoStruct get groupInfo => _groupInfo ?? ChatInfoStruct();
  bool hasGroupInfo() => _groupInfo != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "chatType" field.
  ChatType? _chatType;
  ChatType? get chatType => _chatType;
  bool hasChatType() => _chatType != null;

  // "chatInfo" field.
  ChatInfoStruct? _chatInfo;
  ChatInfoStruct get chatInfo => _chatInfo ?? ChatInfoStruct();
  bool hasChatInfo() => _chatInfo != null;

  void _initializeFields() {
    _usersRefs = getDataList(snapshotData['usersRefs']);
    _lastMessage = snapshotData['lastMessage'] as String?;
    _lastTimestamp = snapshotData['lastTimestamp'] as DateTime?;
    _lastMessageSeen = snapshotData['lastMessageSeen'] as bool?;
    _lastMessageRef = snapshotData['lastMessageRef'] as DocumentReference?;
    _groupInfo = snapshotData['groupInfo'] is ChatInfoStruct
        ? snapshotData['groupInfo']
        : ChatInfoStruct.maybeFromMap(snapshotData['groupInfo']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _chatType = snapshotData['chatType'] is ChatType
        ? snapshotData['chatType']
        : deserializeEnum<ChatType>(snapshotData['chatType']);
    _chatInfo = snapshotData['chatInfo'] is ChatInfoStruct
        ? snapshotData['chatInfo']
        : ChatInfoStruct.maybeFromMap(snapshotData['chatInfo']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? lastMessage,
  DateTime? lastTimestamp,
  bool? lastMessageSeen,
  DocumentReference? lastMessageRef,
  ChatInfoStruct? groupInfo,
  DateTime? createdAt,
  ChatType? chatType,
  ChatInfoStruct? chatInfo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastMessage': lastMessage,
      'lastTimestamp': lastTimestamp,
      'lastMessageSeen': lastMessageSeen,
      'lastMessageRef': lastMessageRef,
      'groupInfo': ChatInfoStruct().toMap(),
      'createdAt': createdAt,
      'chatType': chatType,
      'chatInfo': ChatInfoStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "groupInfo" field.
  addChatInfoStructData(firestoreData, groupInfo, 'groupInfo');

  // Handle nested data for "chatInfo" field.
  addChatInfoStructData(firestoreData, chatInfo, 'chatInfo');

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.usersRefs, e2?.usersRefs) &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.lastTimestamp == e2?.lastTimestamp &&
        e1?.lastMessageSeen == e2?.lastMessageSeen &&
        e1?.lastMessageRef == e2?.lastMessageRef &&
        e1?.groupInfo == e2?.groupInfo &&
        e1?.createdAt == e2?.createdAt &&
        e1?.chatType == e2?.chatType &&
        e1?.chatInfo == e2?.chatInfo;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.usersRefs,
        e?.lastMessage,
        e?.lastTimestamp,
        e?.lastMessageSeen,
        e?.lastMessageRef,
        e?.groupInfo,
        e?.createdAt,
        e?.chatType,
        e?.chatInfo
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
