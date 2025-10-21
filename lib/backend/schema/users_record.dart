import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Almacena la información de cada usuario registrado
class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "status" field.
  UserStatus? _status;
  UserStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "nationality" field.
  UserNationality? _nationality;
  UserNationality? get nationality => _nationality;
  bool hasNationality() => _nationality != null;

  // "gender" field.
  UserGender? _gender;
  UserGender? get gender => _gender;
  bool hasGender() => _gender != null;

  // "birthDate" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  bool hasBirthDate() => _birthDate != null;

  // "identityDocument" field.
  IdentityDocumentStruct? _identityDocument;
  IdentityDocumentStruct get identityDocument =>
      _identityDocument ?? IdentityDocumentStruct();
  bool hasIdentityDocument() => _identityDocument != null;

  // "emergencyContacts" field.
  List<ContactStruct>? _emergencyContacts;
  List<ContactStruct> get emergencyContacts => _emergencyContacts ?? const [];
  bool hasEmergencyContacts() => _emergencyContacts != null;

  // "medicalInformation" field.
  MedicalInformationStruct? _medicalInformation;
  MedicalInformationStruct get medicalInformation =>
      _medicalInformation ?? MedicalInformationStruct();
  bool hasMedicalInformation() => _medicalInformation != null;

  // "isOnline" field.
  bool? _isOnline;
  bool get isOnline => _isOnline ?? false;
  bool hasIsOnline() => _isOnline != null;

  // "lastOnline" field.
  DateTime? _lastOnline;
  DateTime? get lastOnline => _lastOnline;
  bool hasLastOnline() => _lastOnline != null;

  // "currentZone" field.
  ZoneStruct? _currentZone;
  ZoneStruct get currentZone => _currentZone ?? ZoneStruct();
  bool hasCurrentZone() => _currentZone != null;

  // "lastZone" field.
  ZoneStruct? _lastZone;
  ZoneStruct get lastZone => _lastZone ?? ZoneStruct();
  bool hasLastZone() => _lastZone != null;

  // "platformRol" field.
  PlatformProfile? _platformRol;
  PlatformProfile? get platformRol => _platformRol;
  bool hasPlatformRol() => _platformRol != null;

  // "institutionRoles" field.
  List<InstitutionRoleStruct>? _institutionRoles;
  List<InstitutionRoleStruct> get institutionRoles =>
      _institutionRoles ?? const [];
  bool hasInstitutionRoles() => _institutionRoles != null;

  // "addresses" field.
  List<LocationStruct>? _addresses;
  List<LocationStruct> get addresses => _addresses ?? const [];
  bool hasAddresses() => _addresses != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _status = snapshotData['status'] is UserStatus
        ? snapshotData['status']
        : deserializeEnum<UserStatus>(snapshotData['status']);
    _nationality = snapshotData['nationality'] is UserNationality
        ? snapshotData['nationality']
        : deserializeEnum<UserNationality>(snapshotData['nationality']);
    _gender = snapshotData['gender'] is UserGender
        ? snapshotData['gender']
        : deserializeEnum<UserGender>(snapshotData['gender']);
    _birthDate = snapshotData['birthDate'] as DateTime?;
    _identityDocument = snapshotData['identityDocument']
            is IdentityDocumentStruct
        ? snapshotData['identityDocument']
        : IdentityDocumentStruct.maybeFromMap(snapshotData['identityDocument']);
    _emergencyContacts = getStructList(
      snapshotData['emergencyContacts'],
      ContactStruct.fromMap,
    );
    _medicalInformation =
        snapshotData['medicalInformation'] is MedicalInformationStruct
            ? snapshotData['medicalInformation']
            : MedicalInformationStruct.maybeFromMap(
                snapshotData['medicalInformation']);
    _isOnline = snapshotData['isOnline'] as bool?;
    _lastOnline = snapshotData['lastOnline'] as DateTime?;
    _currentZone = snapshotData['currentZone'] is ZoneStruct
        ? snapshotData['currentZone']
        : ZoneStruct.maybeFromMap(snapshotData['currentZone']);
    _lastZone = snapshotData['lastZone'] is ZoneStruct
        ? snapshotData['lastZone']
        : ZoneStruct.maybeFromMap(snapshotData['lastZone']);
    _platformRol = snapshotData['platformRol'] is PlatformProfile
        ? snapshotData['platformRol']
        : deserializeEnum<PlatformProfile>(snapshotData['platformRol']);
    _institutionRoles = getStructList(
      snapshotData['institutionRoles'],
      InstitutionRoleStruct.fromMap,
    );
    _addresses = getStructList(
      snapshotData['addresses'],
      LocationStruct.fromMap,
    );
    _isAdmin = snapshotData['isAdmin'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  UserStatus? status,
  UserNationality? nationality,
  UserGender? gender,
  DateTime? birthDate,
  IdentityDocumentStruct? identityDocument,
  MedicalInformationStruct? medicalInformation,
  bool? isOnline,
  DateTime? lastOnline,
  ZoneStruct? currentZone,
  ZoneStruct? lastZone,
  PlatformProfile? platformRol,
  bool? isAdmin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'status': status,
      'nationality': nationality,
      'gender': gender,
      'birthDate': birthDate,
      'identityDocument': IdentityDocumentStruct().toMap(),
      'medicalInformation': MedicalInformationStruct().toMap(),
      'isOnline': isOnline,
      'lastOnline': lastOnline,
      'currentZone': ZoneStruct().toMap(),
      'lastZone': ZoneStruct().toMap(),
      'platformRol': platformRol,
      'isAdmin': isAdmin,
    }.withoutNulls,
  );

  // Handle nested data for "identityDocument" field.
  addIdentityDocumentStructData(
      firestoreData, identityDocument, 'identityDocument');

  // Handle nested data for "medicalInformation" field.
  addMedicalInformationStructData(
      firestoreData, medicalInformation, 'medicalInformation');

  // Handle nested data for "currentZone" field.
  addZoneStructData(firestoreData, currentZone, 'currentZone');

  // Handle nested data for "lastZone" field.
  addZoneStructData(firestoreData, lastZone, 'lastZone');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.status == e2?.status &&
        e1?.nationality == e2?.nationality &&
        e1?.gender == e2?.gender &&
        e1?.birthDate == e2?.birthDate &&
        e1?.identityDocument == e2?.identityDocument &&
        listEquality.equals(e1?.emergencyContacts, e2?.emergencyContacts) &&
        e1?.medicalInformation == e2?.medicalInformation &&
        e1?.isOnline == e2?.isOnline &&
        e1?.lastOnline == e2?.lastOnline &&
        e1?.currentZone == e2?.currentZone &&
        e1?.lastZone == e2?.lastZone &&
        e1?.platformRol == e2?.platformRol &&
        listEquality.equals(e1?.institutionRoles, e2?.institutionRoles) &&
        listEquality.equals(e1?.addresses, e2?.addresses) &&
        e1?.isAdmin == e2?.isAdmin;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.status,
        e?.nationality,
        e?.gender,
        e?.birthDate,
        e?.identityDocument,
        e?.emergencyContacts,
        e?.medicalInformation,
        e?.isOnline,
        e?.lastOnline,
        e?.currentZone,
        e?.lastZone,
        e?.platformRol,
        e?.institutionRoles,
        e?.addresses,
        e?.isAdmin
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
