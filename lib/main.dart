import 'package:flutter/material.dart';
import 'package:prog/auth/auth_page.dart';
import 'package:prog/auth/directing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prog/data/dummy_data.dart';
import 'package:prog/pages/test_db.dart';
import 'package:prog/services/storage/shared_pref.dart';
import 'firebase_options.dart';
import 'package:prog/pages/cinema_description.dart';
import 'package:prog/pages/movie_description.dart';
import 'package:prog/pages/theatre_page.dart';
import 'firebase_options.dart';
import 'package:prog/pages/reset_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

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
