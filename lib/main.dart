import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Register.dart';
import 'package:flutter_application_1/homepage.dart';

import 'package:flutter_application_1/route_method.dart';
import 'package:flutter_application_1/start.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAlodimlzU9fENywvVXQCd5WMp3D_XLbvY",
          authDomain: "quiz-app-797bc.firebaseapp.com",
          projectId: "quiz-app-797bc",
          storageBucket: "quiz-app-797bc.appspot.com",
          messagingSenderId: "961007306783",
          appId: "1:961007306783:web:d913d126eb1c26cacdad2a",
          measurementId: "G-35BE3DN95H"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MZCET SYMPOSIUM QUIZ APPLICATION',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Regsiter(),
      debugShowCheckedModeBanner: false,
    );
  }
}
