import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:prog/pages/dashboard/mini_dashboard.dart';
import 'package:prog/pages/auth/auth_page.dart';
import 'package:prog/pages/testing/test_functions.dart';
import 'package:prog/services/data/dummy_data.dart';
import 'package:prog/pages/utillity%20pages/pages_navigator.dart';
import 'package:prog/pages/auth/reset_password.dart';
import 'package:prog/pages/movies/movie_description.dart';
import 'package:prog/pages/testing/test_db.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MiniDashboard()/*BlocBuilder<AuthenticationBloc, AuthenticationState>( 
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  return pagesNavigator();
                } else {
                  return authPage();
                }
              },
            );
          } else {
            return authPage();
          }
        },
      ),*/,
      routes: {
        "/testDB": (context) => TestDb(),
        "/resetPassword": (context) => resetPassword(),
        "/auth": (context) => authPage(),
        "/movieDescription": (context) => movieDescription(movie: allMovies[0]),
      },
    );
  }
}