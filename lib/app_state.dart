import 'package:flutter/material.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _nationality = prefs.containsKey('ff_nationality')
          ? deserializeEnum<UserNationality>(prefs.getString('ff_nationality'))
          : _nationality;
    });
    _safeInit(() {
      _showDashboard = prefs.getBool('ff_showDashboard') ?? _showDashboard;
    });
    _safeInit(() {
      _appProfile = prefs.containsKey('ff_appProfile')
          ? deserializeEnum<PlatformProfile>(prefs.getString('ff_appProfile'))
          : _appProfile;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserNationality? _nationality = UserNationality.chilean;
  UserNationality? get nationality => _nationality;
  set nationality(UserNationality? value) {
    _nationality = value;
    value != null
        ? prefs.setString('ff_nationality', value.serialize())
        : prefs.remove('ff_nationality');
  }

  bool _refresh = false;
  bool get refresh => _refresh;
  set refresh(bool value) {
    _refresh = value;
  }

  List<String> _debug = [];
  List<String> get debug => _debug;
  set debug(List<String> value) {
    _debug = value;
  }

  void addToDebug(String value) {
    debug.add(value);
  }

  void removeFromDebug(String value) {
    debug.remove(value);
  }

  void removeAtIndexFromDebug(int index) {
    debug.removeAt(index);
  }

  void updateDebugAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    debug[index] = updateFn(_debug[index]);
  }

  void insertAtIndexInDebug(int index, String value) {
    debug.insert(index, value);
  }

  bool _showDashboard = false;
  bool get showDashboard => _showDashboard;
  set showDashboard(bool value) {
    _showDashboard = value;
    prefs.setBool('ff_showDashboard', value);
  }

  PlatformProfile? _appProfile = PlatformProfile.citizen;
  PlatformProfile? get appProfile => _appProfile;
  set appProfile(PlatformProfile? value) {
    _appProfile = value;
    value != null
        ? prefs.setString('ff_appProfile', value.serialize())
        : prefs.remove('ff_appProfile');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
