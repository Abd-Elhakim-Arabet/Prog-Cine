import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/cinemaPic.dart';
import 'package:prog/data/dummy_models.dart';

class theatreCard extends StatelessWidget {
  final Theater theatre;
  const theatreCard({super.key, required this.theatre});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.myPrimary,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: cinemaPic(
              cinemaPath: theatre.image,
              location: theatre.location,
            ),
          )
        ],
      ),
    );
    ;
    ;
  }
}
