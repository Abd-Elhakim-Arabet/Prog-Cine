import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:prog/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:prog/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:prog/pages/auth/login.dart';
import 'package:prog/pages/auth/signup.dart';
import 'package:prog/pages/utillity%20pages/wlcome_page.dart';

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
      return welcomePage(
        goToAtuh: goToAuth,
      );
    }
    if (showLogin) {
      return BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(
          myUserRepository: context.read<AuthenticationBloc>().userRepository,
        ),
        child: loginPage(
          showRegisterPage: togglePages,
        ),
      );
    } else {
      return BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(
          myUserRepository: context.read<AuthenticationBloc>().userRepository,
        ),
        child: signupPage(
          showLoginPage: togglePages,
        ),
      );
    }
  }
}
