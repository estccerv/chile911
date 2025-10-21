import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Historial de cambios de estado y notas internas de la alerta
class HistoryRecord extends FirestoreRecord {
  HistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "operatorRef" field.
  DocumentReference? _operatorRef;
  DocumentReference? get operatorRef => _operatorRef;
  bool hasOperatorRef() => _operatorRef != null;

  // "action" field.
  String? _action;
  String get action => _action ?? '';
  bool hasAction() => _action != null;

  // "previousStatus" field.
  AlertStatus? _previousStatus;
  AlertStatus? get previousStatus => _previousStatus;
  bool hasPreviousStatus() => _previousStatus != null;

  // "newStatus" field.
  AlertStatus? _newStatus;
  AlertStatus? get newStatus => _newStatus;
  bool hasNewStatus() => _newStatus != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "priorRef" field.
  DocumentReference? _priorRef;
  DocumentReference? get priorRef => _priorRef;
  bool hasPriorRef() => _priorRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _operatorRef = snapshotData['operatorRef'] as DocumentReference?;
    _action = snapshotData['action'] as String?;
    _previousStatus = snapshotData['previousStatus'] is AlertStatus
        ? snapshotData['previousStatus']
        : deserializeEnum<AlertStatus>(snapshotData['previousStatus']);
    _newStatus = snapshotData['newStatus'] is AlertStatus
        ? snapshotData['newStatus']
        : deserializeEnum<AlertStatus>(snapshotData['newStatus']);
    _note = snapshotData['note'] as String?;
    _priorRef = snapshotData['priorRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('history')
          : FirebaseFirestore.instance.collectionGroup('history');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('history').doc(id);

  static Stream<HistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoryRecord.fromSnapshot(s));

  static Future<HistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HistoryRecord.fromSnapshot(s));

  static HistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoryRecordData({
  DateTime? timestamp,
  DocumentReference? operatorRef,
  String? action,
  AlertStatus? previousStatus,
  AlertStatus? newStatus,
  String? note,
  DocumentReference? priorRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'operatorRef': operatorRef,
      'action': action,
      'previousStatus': previousStatus,
      'newStatus': newStatus,
      'note': note,
      'priorRef': priorRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class HistoryRecordDocumentEquality implements Equality<HistoryRecord> {
  const HistoryRecordDocumentEquality();

  @override
  bool equals(HistoryRecord? e1, HistoryRecord? e2) {
    return e1?.timestamp == e2?.timestamp &&
        e1?.operatorRef == e2?.operatorRef &&
        e1?.action == e2?.action &&
        e1?.previousStatus == e2?.previousStatus &&
        e1?.newStatus == e2?.newStatus &&
        e1?.note == e2?.note &&
        e1?.priorRef == e2?.priorRef;
  }

  @override
  int hash(HistoryRecord? e) => const ListEquality().hash([
        e?.timestamp,
        e?.operatorRef,
        e?.action,
        e?.previousStatus,
        e?.newStatus,
        e?.note,
        e?.priorRef
      ]);

  @override
  bool isValidKey(Object? o) => o is HistoryRecord;
}
