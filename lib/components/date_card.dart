import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';

class dateCard extends StatelessWidget {
  final String day;
  final int number;
  final String month;
  final bool isActive;
  final Color? color;
  const dateCard(
      {super.key,
      required this.day,
      required this.number,
      required this.month,
      this.isActive = false,
      this.color = AppColors.myPrimary});

  @override
  Widget build(BuildContext context) {
    Color? containerColor = AppColors.myAccent;
    Color textColor = AppColors.myBackground;
    double scale = 0.8;
    if (isActive) {
      containerColor = color;
      textColor = Colors.white;
      scale = 1;
    }
    return Container(
      height: 93 * scale,
      width: 79 * scale,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            day,
            style: TextStyle(
              color: textColor,
              fontFamily: AppFonts.mainFont,
              fontSize: 16,
            ),
          ),
          Column(
            children: [
              Text(
                number.toString(),
                style: TextStyle(
                  color: textColor,
                  fontFamily: AppFonts.mainFont,
                  fontSize: 19,
                ),
              ),
              Text(
                month,
                style: TextStyle(
                  color: textColor,
                  fontFamily: AppFonts.mainFont,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
