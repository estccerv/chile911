import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAOsFJdmsYRg7_fdksSB4pPGitlGxgR5VM",
            authDomain: "chile911-a098f.firebaseapp.com",
            projectId: "chile911-a098f",
            storageBucket: "chile911-a098f.firebasestorage.app",
            messagingSenderId: "788864970081",
            appId: "1:788864970081:web:22fc681e3c868fe08a6920",
            measurementId: "G-ZNPB93VZ1R"));
  } else {
    await Firebase.initializeApp();
  }
}
