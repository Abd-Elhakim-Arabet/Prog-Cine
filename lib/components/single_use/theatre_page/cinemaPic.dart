import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';

class cinemaPic extends StatelessWidget {
  final String cinemaPath;
  final double? awidth;
  final String location;
  const cinemaPic({super.key, required this.cinemaPath, this.awidth, required this.location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              cinemaPath,
              width: awidth ?? 200,
            ),
            Text(
              location,
              style: TextStyle(
                color: AppColors.myAccent,
                fontFamily: AppFonts.mainFont,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
