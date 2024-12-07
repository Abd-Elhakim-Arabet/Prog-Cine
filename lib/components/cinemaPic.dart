import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';

class cinemaPic extends StatelessWidget {
  final String cinemaPath;
  final double? awidth;
  const cinemaPic({super.key, required this.cinemaPath, this.awidth});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                cinemaPath,
                width: awidth ?? 200,
              ),
              Text(
                "Algiers, Algeria",
                style: TextStyle(
                  color: AppColors.myAccent,
                  fontFamily: AppFonts.mainFont,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
