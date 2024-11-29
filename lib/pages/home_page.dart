import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/components/main_movie_menu.dart';
import 'package:prog/components/movie_slider.dart';
import 'package:prog/components/search_bar.dart';
import 'package:prog/components/see_all.dart';
import 'package:prog/components/upper_section.dart';
import 'package:prog/readData/get_name.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  //final user = FirebaseAuth.instance.currentUser;
  List<String> Ids = [];
  @override
  void logOut() {
    //FirebaseAuth.instance.signOut();
  }

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: const Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: upperSection(),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: mySearchBar(),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: seeAllBtn(),
              ),
            ],
          ),
          SizedBox(height: 
          10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 25.0),
                child: Text("See All", style: TextStyle(
                  color: AppColors.myPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
                ),),
              ),

              
            ],
          ),
          SizedBox(height: 30,),
             // mainMovieMenu(),
          MovieSlider()
        ],
      ),
    );
  }
}
