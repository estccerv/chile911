// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Dependencia requerida: visibility_detector: ^0.4.0+2
import 'package:visibility_detector/visibility_detector.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

import '/chat/chat_bubbles/chat_bubbles_widget.dart' as component;

class ChatCheckRead extends StatefulWidget {
  const ChatCheckRead({
    super.key,
    this.width,
    this.height,
    required this.message,
    this.user, // Parámetro de usuario ahora es opcional
  });

  final double? width;
  final double? height;
  final MessagesRecord message;
  final UsersRecord? user; // Tipo de usuario ahora es nullable

  @override
  State<ChatCheckRead> createState() => _ChatCheckReadState();
}

class _ChatCheckReadState extends State<ChatCheckRead> {
  bool _actionTriggered = false;

  @override
  void initState() {
    super.initState();
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  }

  Future<void> _markMessageAsSeen() async {
    // Agregamos una comprobación aquí también por seguridad.
    if (widget.user == null) return;

    final currentUserRef = currentUserReference;
    if (currentUserRef == null ||
        !widget.message.hasUserRef() ||
        widget.message.userRef == currentUserRef ||
        widget.message.seenRefs.contains(currentUserRef)) {
      return;
    }

    try {
      await widget.message.reference.update({
        'seenRefs': FieldValue.arrayUnion([currentUserRef]),
      });
    } catch (e) {
      print('Error al marcar el mensaje como visto: $e');
      if (mounted) setState(() => _actionTriggered = false);
    }
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.5 && !_actionTriggered) {
      setState(() => _actionTriggered = true);
      _markMessageAsSeen();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Verificamos si el widget recibió un usuario.
    if (widget.user == null) {
      // Si el usuario es nulo, no mostramos nada para evitar el crash.
      return SizedBox.shrink();
    }

    // Si el usuario NO es nulo, construimos el widget como antes.
    return IntrinsicHeight(
      child: VisibilityDetector(
        key: Key('chat_check_read_${widget.message.reference.id}'),
        onVisibilityChanged: _onVisibilityChanged,
        child: component.ChatBubblesWidget(
          message: widget.message,
          // Como ya comprobamos que no es nulo, podemos usar '!' con seguridad.
          user: widget.user!,
        ),
      ),
    );
  }
}
// END Custom Widget Code
