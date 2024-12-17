import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';

class upperSection extends StatelessWidget {
  const upperSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
      children: [
        Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            
            Text("Welcome Back", style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: AppFonts.mainFont
            ),),
            Text("Discover Latest Movies", style: TextStyle(
              color: AppColors.myAccent,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: AppFonts.mainFont
            ),)
          ],

          
        ),

        Row(
          children: [
            Icon(Icons.notifications_outlined, color: AppColors.myAccent,
              size: 30,
            )
          ],
        )
      ],
    );
  }
}