// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CountryStruct extends FFFirebaseStruct {
  CountryStruct({
    String? name,
    String? commonName,
    String? code,
    String? dialCode,
    String? emoji,
    String? search,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _commonName = commonName,
        _code = code,
        _dialCode = dialCode,
        _emoji = emoji,
        _search = search,
        _image = image,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "commonName" field.
  String? _commonName;
  String get commonName => _commonName ?? '';
  set commonName(String? val) => _commonName = val;

  bool hasCommonName() => _commonName != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "dialCode" field.
  String? _dialCode;
  String get dialCode => _dialCode ?? '';
  set dialCode(String? val) => _dialCode = val;

  bool hasDialCode() => _dialCode != null;

  // "emoji" field.
  String? _emoji;
  String get emoji => _emoji ?? '';
  set emoji(String? val) => _emoji = val;

  bool hasEmoji() => _emoji != null;

  // "search" field.
  String? _search;
  String get search => _search ?? '';
  set search(String? val) => _search = val;

  bool hasSearch() => _search != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  static CountryStruct fromMap(Map<String, dynamic> data) => CountryStruct(
        name: data['name'] as String?,
        commonName: data['commonName'] as String?,
        code: data['code'] as String?,
        dialCode: data['dialCode'] as String?,
        emoji: data['emoji'] as String?,
        search: data['search'] as String?,
        image: data['image'] as String?,
      );

  static CountryStruct? maybeFromMap(dynamic data) =>
      data is Map ? CountryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'commonName': _commonName,
        'code': _code,
        'dialCode': _dialCode,
        'emoji': _emoji,
        'search': _search,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'commonName': serializeParam(
          _commonName,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'dialCode': serializeParam(
          _dialCode,
          ParamType.String,
        ),
        'emoji': serializeParam(
          _emoji,
          ParamType.String,
        ),
        'search': serializeParam(
          _search,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static CountryStruct fromSerializableMap(Map<String, dynamic> data) =>
      CountryStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        commonName: deserializeParam(
          data['commonName'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        dialCode: deserializeParam(
          data['dialCode'],
          ParamType.String,
          false,
        ),
        emoji: deserializeParam(
          data['emoji'],
          ParamType.String,
          false,
        ),
        search: deserializeParam(
          data['search'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CountryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CountryStruct &&
        name == other.name &&
        commonName == other.commonName &&
        code == other.code &&
        dialCode == other.dialCode &&
        emoji == other.emoji &&
        search == other.search &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, commonName, code, dialCode, emoji, search, image]);
}

CountryStruct createCountryStruct({
  String? name,
  String? commonName,
  String? code,
  String? dialCode,
  String? emoji,
  String? search,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CountryStruct(
      name: name,
      commonName: commonName,
      code: code,
      dialCode: dialCode,
      emoji: emoji,
      search: search,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CountryStruct? updateCountryStruct(
  CountryStruct? country, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    country
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCountryStructData(
  Map<String, dynamic> firestoreData,
  CountryStruct? country,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (country == null) {
    return;
  }
  if (country.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && country.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final countryData = getCountryFirestoreData(country, forFieldValue);
  final nestedData = countryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = country.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCountryFirestoreData(
  CountryStruct? country, [
  bool forFieldValue = false,
]) {
  if (country == null) {
    return {};
  }
  final firestoreData = mapToFirestore(country.toMap());

  // Add any Firestore field values
  country.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCountryListFirestoreData(
  List<CountryStruct>? countrys,
) =>
    countrys?.map((e) => getCountryFirestoreData(e, true)).toList() ?? [];
