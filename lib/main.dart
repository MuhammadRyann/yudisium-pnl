import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'sign/login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBSKEOKiN02-VR513rnCTkgEDALmzmgPxs",
          authDomain: "yudisium-pnl.firebaseapp.com",
          projectId: "yudisium-pnl",
          storageBucket: "yudisium-pnl.appspot.com",
          messagingSenderId: "753934366540",
          appId: "1:753934366540:web:e35e366a3718df480181e9"),
    );
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBcdfoiJwfhOuspqcJvV3tzZdiBVia_1I8",
          authDomain: "yudisium-pnl.firebaseapp.com",
          projectId: "yudisium-pnl",
          storageBucket: "yudisium-pnl.appspot.com",
          messagingSenderId: "753934366540",
          appId: "1:753934366540:android:5aadb427234b62550181e9"),
    );
  }
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yudisium PNL',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LoginPage(),
      },
      theme: ThemeData(),
    );
  }
}
