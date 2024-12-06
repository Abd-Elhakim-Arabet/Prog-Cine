import 'package:flutter/material.dart';
import 'package:prog/pages/login.dart';
import 'package:prog/pages/signup.dart';
import 'package:prog/pages/wlcome_page.dart';

class authPage extends StatefulWidget {
  const authPage({super.key});

  @override
  State<authPage> createState() => _authPageState();
}

class _authPageState extends State<authPage> {
  @override
  bool showLogin = true;
  bool showWelcome = true;

  void togglePages() {
    showLogin = !showLogin;
    setState(() {});
  }

  void goToAuth() {
    showWelcome = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (showWelcome) {
      return welcomePage(goToAtuh: goToAuth,);
    }
    if (showLogin) {
      return loginPage(
        showRegisterPage: togglePages,
      );
    } else {
      return signupPage(
        showLoginPage: togglePages,
      );
    }
  }
}
