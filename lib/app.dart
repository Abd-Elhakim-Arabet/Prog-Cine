import 'package:flutter/material.dart';
import 'package:prog/auth/auth_page.dart';
import 'package:prog/auth/directing_page.dart';
import 'package:prog/data/dummy_data.dart';
import 'package:prog/pages/reset_password.dart';
import 'package:prog/pages/movie_description.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  directingPage(),
      routes: {
        "/resetPassword": (context) => resetPassword(),
        "/auth": (context) => authPage(),
        "/movieDescription":(context) => movieDescription(movie: allMovies[0],),
        },
    );
  }
}
