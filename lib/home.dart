import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/colors.dart';
import 'package:food_app/signup.dart';

class Home_Screen extends StatelessWidget {
  Home_Screen({super.key});
  final _email = TextEditingController();
  final _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Cine Quest")),
        backgroundColor: background_colour,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
                  focusColor: background_colour,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: background_colour),
                      borderRadius: BorderRadius.circular(20)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'enter email',
                  prefixIcon: Icon(Icons.email)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 10.0,
              bottom: 10.0,
              right: 20.0,
            ),
            child: TextField(
              controller: _pass,
              decoration: InputDecoration(
                  focusColor: background_colour,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: background_colour),
                      borderRadius: BorderRadius.circular(20)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'enter pass',
                  prefixIcon: Icon(Icons.password)),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 250,
              ),
              Text('           don\'t have a account ? '),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Sign_Screen();
                  }));
                },
                child: Text(
                  'sign up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: background_colour,
                      fontSize: 18),
                ),
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {
              signIn(_email.toString(), _pass.toString());
            },
            child: Text(
              'login',
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: background_colour),
          )
        ],
      ),
    );
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
