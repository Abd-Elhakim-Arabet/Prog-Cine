import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';

class myLongBtn extends StatelessWidget {
  final mytext;
  const myLongBtn ({super.key, required this.mytext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 365,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: AppColors.myPrimary,
      ),
      child: Center(
        child: Text(mytext, style: const TextStyle(
          color: AppColors.myBackground,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: "hurme"
        ),),
      ),
    );
  }
}
