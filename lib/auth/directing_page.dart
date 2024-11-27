import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prog/auth/auth_page.dart';
import 'package:prog/pages/home_page.dart';
import 'package:prog/pages/login.dart';

class directingPage extends StatelessWidget {
  const directingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return homePage();
          } else {
            return authPage();
          }
        },
      ),
    );
  }
}
