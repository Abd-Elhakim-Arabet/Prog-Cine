import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/theatres_list.dart';

class theatrePage extends StatefulWidget {
  const theatrePage({super.key});

  @override
  State<theatrePage> createState() => _theatrePageState();
}

class _theatrePageState extends State<theatrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SingleChildScrollView(
            child:  Column(
              
              children: [
                SizedBox(height: 70,),
                  
               
                
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cinema",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.myPrimary,
                          fontFamily: AppFonts.mainFont,
                        ),
                        ),
                       
                        
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                theatresList()
              ],
            ),
      ),
    );
  } 
}