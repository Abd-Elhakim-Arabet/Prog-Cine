import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/movie_matrix.dart';
import 'package:prog/components/search_bar.dart';
import 'package:prog/components/surfer.dart';
import 'package:prog/components/upper_section.dart';

class moviePage extends StatefulWidget {
  const moviePage({super.key});

  @override
  State<moviePage> createState() => _moviePageState();
}

class _moviePageState extends State<moviePage> {
  String filter = "Popular";
  String movieType = "Algerian Movies";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: AppColors.myBackground,
      body: SingleChildScrollView(
            child: Column(
              
              children: [

                SizedBox(height: 70,),
                Surfer(),
                SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: mySearchBar(),
                  ),
               
                
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        filter,
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.myPrimary,
                          fontFamily: AppFonts.mainFont,
                        ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.tune,
                            color: AppColors.myAccent,
                            )
                          ],
                        )
                    ],
                  ),
                ),
                movieMatrix(),
              ],
            ),
      ),
    );
  }
}