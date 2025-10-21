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

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '/custom_code/actions/index.dart' as actions;

// Variables globales (sin cambios)
StreamSubscription<User?>? _authSubscription;
StreamSubscription<DatabaseEvent>? _connectionSubscription;
DatabaseReference? _currentConnectionRef;
String? _currentUserId;
String? _currentConnectionKey;

// --- Custom Action Principal: userPresence (Llamando con 'actions.') ---
Future<void> userPresence() async {
  await actions.debugLog('Iniciando sistema de presencia', '🚀');

  await _authSubscription?.cancel();
  await _connectionSubscription?.cancel();

  _authSubscription =
      FirebaseAuth.instance.authStateChanges().listen((user) async {
    if (user != null) {
      await _handleUserConnected(user.uid);
    } else {
      await _handleUserDisconnected();
    }
  });
}

// --- Manejador Conectado (Llamando con 'actions.') ---
Future<void> _handleUserConnected(String userId) async {
  try {
    await actions.debugLog('Iniciando conexión para UID: $userId', '🟡');
    _currentUserId = userId;
    final rtdb = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: 'https://chile911-a098f-default-rtdb.firebaseio.com/',
    );

    final connectionsRef = rtdb.ref('users/$userId/connections');
    final connectedRef = rtdb.ref('.info/connected');

    await _connectionSubscription?.cancel();

    _connectionSubscription = connectedRef.onValue.listen((event) async {
      final connected = event.snapshot.value as bool? ?? false;
      await actions.debugLog(
          'Estado conexión RTDB: ${connected ? 'ONLINE' : 'OFFLINE'}', '📶');
      if (connected) {
        // Usando la lógica original donde siempre se crea si está conectado
        _currentConnectionRef = connectionsRef.push();
        _currentConnectionKey = _currentConnectionRef!.key;

        await _currentConnectionRef!.set(ServerValue.timestamp);
        await _currentConnectionRef!.onDisconnect().remove();

        await actions.debugLog(
            'Nueva conexión establecida: $_currentConnectionKey', '🔑');
      } else {
        _currentConnectionRef = null;
        _currentConnectionKey = null;
        await actions.debugLog(
            'Desconectado de RTDB. Limpiada ref local.', '🔌');
      }
    });
  } catch (e, stackTrace) {
    await actions.debugLog(
        'Error en _handleUserConnected: ${e.toString()}', '❌');
    await actions.debugLog('StackTrace: ${stackTrace.toString()}', ' M');
  }
}

// --- Manejador Desconectado (Llamando con 'actions.') ---
Future<void> _handleUserDisconnected() async {
  try {
    await actions.debugLog('Iniciando proceso de desconexión', '🔄');

    // Usando tu condición original restaurada
    if (_currentUserId != null &&
        _currentConnectionKey != null &&
        _currentConnectionRef != null) {
      await actions.debugLog(
          'Conexión activa encontrada. Limpieza manual para key: $_currentConnectionKey',
          '🧹');
      await _currentConnectionRef!
          .onDisconnect()
          .cancel()
          .catchError((e) async {
        await actions.debugLog(
            'Error cancelando onDisconnect (normal?): ${e.toString()}', '⚠️');
      });
      await _currentConnectionRef!.remove().catchError((e) async {
        await actions.debugLog(
            'Error eliminando conexión (normal?): ${e.toString()}', '⚠️');
      });
      await actions.debugLog(
          'Limpieza manual intentada para: $_currentConnectionKey', '🗑️');
    } else {
      await actions.debugLog(
          'No hay conexión activa para limpieza manual.', '⚠️');
    }
  } catch (e, stackTrace) {
    await actions.debugLog(
        'Error en _handleUserDisconnected: ${e.toString()}', '❌');
    await actions.debugLog('StackTrace: ${stackTrace.toString()}', ' M');
  } finally {
    await _connectionSubscription?.cancel();
    _connectionSubscription = null;
    _currentConnectionRef = null;
    _currentConnectionKey = null;
    _currentUserId = null;
    await actions.debugLog('Variables globales limpiadas', '✔️');
  }
}
