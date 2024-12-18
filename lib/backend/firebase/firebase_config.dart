import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBkjBFwvWj1GXcXlbgIwiedhWElkzm30Pg",
            authDomain: "nome-azul-uqoueq.firebaseapp.com",
            projectId: "nome-azul-uqoueq",
            storageBucket: "nome-azul-uqoueq.appspot.com",
            messagingSenderId: "668884829285",
            appId: "1:668884829285:web:618331a76e57353227328c"));
  } else {
    await Firebase.initializeApp();
  }
}
