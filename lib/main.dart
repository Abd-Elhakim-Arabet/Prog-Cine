import 'package:flutter/material.dart';
import 'package:prog/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prog/services/storage/shared_pref.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
