import 'package:flutter/material.dart';
import 'package:prog/pages/login.dart';
import 'package:prog/pages/signup.dart';

class authPage extends StatefulWidget {
  const authPage({super.key});

  @override
  State<authPage> createState() => _authPageState();
}

class _authPageState extends State<authPage> {
  @override
  bool showLogin = true;

  void togglePages() {
    showLogin = !showLogin;
    setState(() {
      
    });
  }

  Widget build(BuildContext context) {
    if (showLogin) {
      return loginPage(showRegisterPage: togglePages,);
    } else {
      return signupPage(showLoginPage: togglePages,);
    }
  }
}
