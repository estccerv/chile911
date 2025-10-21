import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Almacena cada alerta, reporte o incidente generado.
class AlertsRecord extends FirestoreRecord {
  AlertsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "isAnonymous" field.
  bool? _isAnonymous;
  bool get isAnonymous => _isAnonymous ?? false;
  bool hasIsAnonymous() => _isAnonymous != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "locations" field.
  List<LocationStruct>? _locations;
  List<LocationStruct> get locations => _locations ?? const [];
  bool hasLocations() => _locations != null;

  // "zone" field.
  ZoneStruct? _zone;
  ZoneStruct get zone => _zone ?? ZoneStruct();
  bool hasZone() => _zone != null;

  // "attachment" field.
  AttachmentStruct? _attachment;
  AttachmentStruct get attachment => _attachment ?? AttachmentStruct();
  bool hasAttachment() => _attachment != null;

  // "status" field.
  AlertStatus? _status;
  AlertStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "priority" field.
  AlertPriority? _priority;
  AlertPriority? get priority => _priority;
  bool hasPriority() => _priority != null;

  // "severity" field.
  AlertSeverity? _severity;
  AlertSeverity? get severity => _severity;
  bool hasSeverity() => _severity != null;

  // "institutionRefs" field.
  List<DocumentReference>? _institutionRefs;
  List<DocumentReference> get institutionRefs => _institutionRefs ?? const [];
  bool hasInstitutionRefs() => _institutionRefs != null;

  // "operatorsRef" field.
  List<DocumentReference>? _operatorsRef;
  List<DocumentReference> get operatorsRef => _operatorsRef ?? const [];
  bool hasOperatorsRef() => _operatorsRef != null;

  // "resolutionDetails" field.
  String? _resolutionDetails;
  String get resolutionDetails => _resolutionDetails ?? '';
  bool hasResolutionDetails() => _resolutionDetails != null;

  // "userFeedback" field.
  FeedbackStruct? _userFeedback;
  FeedbackStruct get userFeedback => _userFeedback ?? FeedbackStruct();
  bool hasUserFeedback() => _userFeedback != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "type" field.
  AlertType? _type;
  AlertType? get type => _type;
  bool hasType() => _type != null;

  // "subType" field.
  String? _subType;
  String get subType => _subType ?? '';
  bool hasSubType() => _subType != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _isAnonymous = snapshotData['isAnonymous'] as bool?;
    _description = snapshotData['description'] as String?;
    _locations = getStructList(
      snapshotData['locations'],
      LocationStruct.fromMap,
    );
    _zone = snapshotData['zone'] is ZoneStruct
        ? snapshotData['zone']
        : ZoneStruct.maybeFromMap(snapshotData['zone']);
    _attachment = snapshotData['attachment'] is AttachmentStruct
        ? snapshotData['attachment']
        : AttachmentStruct.maybeFromMap(snapshotData['attachment']);
    _status = snapshotData['status'] is AlertStatus
        ? snapshotData['status']
        : deserializeEnum<AlertStatus>(snapshotData['status']);
    _priority = snapshotData['priority'] is AlertPriority
        ? snapshotData['priority']
        : deserializeEnum<AlertPriority>(snapshotData['priority']);
    _severity = snapshotData['severity'] is AlertSeverity
        ? snapshotData['severity']
        : deserializeEnum<AlertSeverity>(snapshotData['severity']);
    _institutionRefs = getDataList(snapshotData['institutionRefs']);
    _operatorsRef = getDataList(snapshotData['operatorsRef']);
    _resolutionDetails = snapshotData['resolutionDetails'] as String?;
    _userFeedback = snapshotData['userFeedback'] is FeedbackStruct
        ? snapshotData['userFeedback']
        : FeedbackStruct.maybeFromMap(snapshotData['userFeedback']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _type = snapshotData['type'] is AlertType
        ? snapshotData['type']
        : deserializeEnum<AlertType>(snapshotData['type']);
    _subType = snapshotData['subType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('alerts');

  static Stream<AlertsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlertsRecord.fromSnapshot(s));

  static Future<AlertsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlertsRecord.fromSnapshot(s));

  static AlertsRecord fromSnapshot(DocumentSnapshot snapshot) => AlertsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlertsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlertsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlertsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlertsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlertsRecordData({
  DocumentReference? userRef,
  bool? isAnonymous,
  String? description,
  ZoneStruct? zone,
  AttachmentStruct? attachment,
  AlertStatus? status,
  AlertPriority? priority,
  AlertSeverity? severity,
  String? resolutionDetails,
  FeedbackStruct? userFeedback,
  DateTime? timestamp,
  AlertType? type,
  String? subType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'isAnonymous': isAnonymous,
      'description': description,
      'zone': ZoneStruct().toMap(),
      'attachment': AttachmentStruct().toMap(),
      'status': status,
      'priority': priority,
      'severity': severity,
      'resolutionDetails': resolutionDetails,
      'userFeedback': FeedbackStruct().toMap(),
      'timestamp': timestamp,
      'type': type,
      'subType': subType,
    }.withoutNulls,
  );

  // Handle nested data for "zone" field.
  addZoneStructData(firestoreData, zone, 'zone');

  // Handle nested data for "attachment" field.
  addAttachmentStructData(firestoreData, attachment, 'attachment');

  // Handle nested data for "userFeedback" field.
  addFeedbackStructData(firestoreData, userFeedback, 'userFeedback');

  return firestoreData;
}

class AlertsRecordDocumentEquality implements Equality<AlertsRecord> {
  const AlertsRecordDocumentEquality();

  @override
  bool equals(AlertsRecord? e1, AlertsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.isAnonymous == e2?.isAnonymous &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.locations, e2?.locations) &&
        e1?.zone == e2?.zone &&
        e1?.attachment == e2?.attachment &&
        e1?.status == e2?.status &&
        e1?.priority == e2?.priority &&
        e1?.severity == e2?.severity &&
        listEquality.equals(e1?.institutionRefs, e2?.institutionRefs) &&
        listEquality.equals(e1?.operatorsRef, e2?.operatorsRef) &&
        e1?.resolutionDetails == e2?.resolutionDetails &&
        e1?.userFeedback == e2?.userFeedback &&
        e1?.timestamp == e2?.timestamp &&
        e1?.type == e2?.type &&
        e1?.subType == e2?.subType;
  }

  @override
  int hash(AlertsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.isAnonymous,
        e?.description,
        e?.locations,
        e?.zone,
        e?.attachment,
        e?.status,
        e?.priority,
        e?.severity,
        e?.institutionRefs,
        e?.operatorsRef,
        e?.resolutionDetails,
        e?.userFeedback,
        e?.timestamp,
        e?.type,
        e?.subType
      ]);

  @override
  bool isValidKey(Object? o) => o is AlertsRecord;
}
