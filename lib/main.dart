import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prog/auth/directing_page.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:prog/components/movie_image_title.dart';
import 'package:prog/pages/home_page.dart';
import 'package:prog/pages/movie_description.dart';
import 'package:prog/pages/reset_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const movieDescription(imageUrl:'https://geeksofcolor.co/wp-content/uploads/2024/09/1355092.jpg' ,title: "The Wild Robot",),
      routes: {
        "/resetPassword": (context) => resetPassword()
      },
      );
  }
}