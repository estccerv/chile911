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

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String?> getCountryByIpAdress() async {
  // Make a request to the IP API to get the user's IP address
  final response = await http.get(Uri.parse('https://ipapi.co/json/'));
  if (response.statusCode == 200) {
    // Parse the response JSON to get the country code
    final data = jsonDecode(response.body);
    return data['country'];
  } else {
    // If the request fails, return null
    return null;
  }
}
