import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBE-9f0wzcKt-OqddQWJrCJqMYTc7tBTnU",
            authDomain: "polls-manage-jeyxy2.firebaseapp.com",
            projectId: "polls-manage-jeyxy2",
            storageBucket: "polls-manage-jeyxy2.firebasestorage.app",
            messagingSenderId: "939544849346",
            appId: "1:939544849346:web:6f469d9f5cc06de0cd045b"));
  } else {
    await Firebase.initializeApp();
  }
}
