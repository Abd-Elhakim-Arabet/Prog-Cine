import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/cinemaPic.dart';

class theatreCard extends StatelessWidget {
  const theatreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed("/cinemaDescription");
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.myPrimary,
            width: 3,
            
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            
              Container(
               
                child: cinemaPic(cinemaPath:  "lib/assets/images/CosmosAlpha.png"),
              )
          ],
        ),
      ),
    );;
  }
}