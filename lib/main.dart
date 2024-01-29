import 'package:flutter/material.dart';
import 'package:food_app/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAluacBocP_38R5tD0kPeN9EL3rTfnzjdc",
      projectId: "cinequest1",
      messagingSenderId: "527102060268",
      appId: "1:527102060268:android:f11aaef383ce80191467c9",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CINE QUEST',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: Main_Screen());
  }
}

// Sign Up
Future<void> signUp(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print(e.toString());
  }
}

// Sign In
Future<void> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print(e.toString());
  }
}

// Sign Out
Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
