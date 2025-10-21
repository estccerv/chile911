// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dlibphonenumber/dlibphonenumber.dart';
import 'package:sealed_countries/sealed_countries.dart';

Future<bool> phoneVerify(
  String phoneNumber,
  String dialCode,
) async {
  PhoneNumberUtil phoneUtil = PhoneNumberUtil.instance;
  final sealedCountries = await WorldCountry.list;
  String phoneCode = "US";
  for (var country in sealedCountries) {
    if (country.idd.phoneCode() == dialCode) {
      phoneCode = country.codeShort;
    }
  }
  PhoneNumber phone = phoneUtil.parse(phoneNumber, phoneCode);
  return phoneUtil.isValidNumber(phone);
}
