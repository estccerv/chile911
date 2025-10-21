import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigRecord extends FirestoreRecord {
  ConfigRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hierarchy" field.
  String? _hierarchy;
  String get hierarchy => _hierarchy ?? '';
  bool hasHierarchy() => _hierarchy != null;

  void _initializeFields() {
    _hierarchy = snapshotData['hierarchy'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('config');

  static Stream<ConfigRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfigRecord.fromSnapshot(s));

  static Future<ConfigRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConfigRecord.fromSnapshot(s));

  static ConfigRecord fromSnapshot(DocumentSnapshot snapshot) => ConfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfigRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfigRecordData({
  String? hierarchy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hierarchy': hierarchy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfigRecordDocumentEquality implements Equality<ConfigRecord> {
  const ConfigRecordDocumentEquality();

  @override
  bool equals(ConfigRecord? e1, ConfigRecord? e2) {
    return e1?.hierarchy == e2?.hierarchy;
  }

  @override
  int hash(ConfigRecord? e) => const ListEquality().hash([e?.hierarchy]);

  @override
  bool isValidKey(Object? o) => o is ConfigRecord;
}
