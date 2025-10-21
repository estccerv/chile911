import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstitutionsRecord extends FirestoreRecord {
  InstitutionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "type" field.
  InstitutionType? _type;
  InstitutionType? get type => _type;
  bool hasType() => _type != null;

  // "locations" field.
  List<LocationStruct>? _locations;
  List<LocationStruct> get locations => _locations ?? const [];
  bool hasLocations() => _locations != null;

  // "contactPhoneNumber" field.
  String? _contactPhoneNumber;
  String get contactPhoneNumber => _contactPhoneNumber ?? '';
  bool hasContactPhoneNumber() => _contactPhoneNumber != null;

  // "contactEmail" field.
  String? _contactEmail;
  String get contactEmail => _contactEmail ?? '';
  bool hasContactEmail() => _contactEmail != null;

  // "contactSiteWeb" field.
  String? _contactSiteWeb;
  String get contactSiteWeb => _contactSiteWeb ?? '';
  bool hasContactSiteWeb() => _contactSiteWeb != null;

  // "coverageAreaType" field.
  InstitutionCoverageArea? _coverageAreaType;
  InstitutionCoverageArea? get coverageAreaType => _coverageAreaType;
  bool hasCoverageAreaType() => _coverageAreaType != null;

  // "status" field.
  InstitutionStatus? _status;
  InstitutionStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _type = snapshotData['type'] is InstitutionType
        ? snapshotData['type']
        : deserializeEnum<InstitutionType>(snapshotData['type']);
    _locations = getStructList(
      snapshotData['locations'],
      LocationStruct.fromMap,
    );
    _contactPhoneNumber = snapshotData['contactPhoneNumber'] as String?;
    _contactEmail = snapshotData['contactEmail'] as String?;
    _contactSiteWeb = snapshotData['contactSiteWeb'] as String?;
    _coverageAreaType =
        snapshotData['coverageAreaType'] is InstitutionCoverageArea
            ? snapshotData['coverageAreaType']
            : deserializeEnum<InstitutionCoverageArea>(
                snapshotData['coverageAreaType']);
    _status = snapshotData['status'] is InstitutionStatus
        ? snapshotData['status']
        : deserializeEnum<InstitutionStatus>(snapshotData['status']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('institutions');

  static Stream<InstitutionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InstitutionsRecord.fromSnapshot(s));

  static Future<InstitutionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InstitutionsRecord.fromSnapshot(s));

  static InstitutionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InstitutionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InstitutionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InstitutionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InstitutionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InstitutionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInstitutionsRecordData({
  String? name,
  InstitutionType? type,
  String? contactPhoneNumber,
  String? contactEmail,
  String? contactSiteWeb,
  InstitutionCoverageArea? coverageAreaType,
  InstitutionStatus? status,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'type': type,
      'contactPhoneNumber': contactPhoneNumber,
      'contactEmail': contactEmail,
      'contactSiteWeb': contactSiteWeb,
      'coverageAreaType': coverageAreaType,
      'status': status,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class InstitutionsRecordDocumentEquality
    implements Equality<InstitutionsRecord> {
  const InstitutionsRecordDocumentEquality();

  @override
  bool equals(InstitutionsRecord? e1, InstitutionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.type == e2?.type &&
        listEquality.equals(e1?.locations, e2?.locations) &&
        e1?.contactPhoneNumber == e2?.contactPhoneNumber &&
        e1?.contactEmail == e2?.contactEmail &&
        e1?.contactSiteWeb == e2?.contactSiteWeb &&
        e1?.coverageAreaType == e2?.coverageAreaType &&
        e1?.status == e2?.status &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(InstitutionsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.type,
        e?.locations,
        e?.contactPhoneNumber,
        e?.contactEmail,
        e?.contactSiteWeb,
        e?.coverageAreaType,
        e?.status,
        e?.timestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is InstitutionsRecord;
}
