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

import 'package:sealed_countries/sealed_countries.dart';

Future<List<String>> phoneValuesList(String? locale) async {
  List<String> countries = [];
  final sealedCountries = await WorldCountry.list;
  BasicLocale basicLocale;
  switch (locale) {
    case 'en':
      basicLocale = const BasicLocale(LangEng());
      break;
    case 'es':
      basicLocale = const BasicLocale(LangSpa());
      break;
    case 'hi':
      basicLocale = const BasicLocale(LangHin());
      break;
    case 'pt':
      basicLocale = const BasicLocale(LangPor());
      break;
    case 'tr':
      basicLocale = const BasicLocale(LangTur());
      break;
    case 'pl':
      basicLocale = const BasicLocale(LangPol());
      break;
    case 'de':
      basicLocale = const BasicLocale(LangDeu());
      break;
    case 'zh_Hans':
      basicLocale = const BasicLocale(LangZho());
      break;
    case 'fr':
      basicLocale = const BasicLocale(LangFra());
      break;
    case 'ar':
      basicLocale = const BasicLocale(LangAra());
      break;
    case 'ru':
      basicLocale = const BasicLocale(LangRus());
      break;
    case 'ja':
      basicLocale = const BasicLocale(LangJpn());
      break;
    default:
      basicLocale = const BasicLocale(LangEng());
      break;
  }
  sealedCountries.forEach((country) {
    countries.add(country.idd.phoneCode());
  });
  return countries;
}
