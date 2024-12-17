import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';

class seeAllBtn extends StatelessWidget {
  const seeAllBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: AppColors.myPrimary,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Icon(Icons.menu, color: Colors.white,),
    );
  }
}