import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';

class Surfer extends StatefulWidget {
  const Surfer({super.key});

  @override
  State<Surfer> createState() => _SurferState();
}

class _SurferState extends State<Surfer> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CarouselSlider.builder(
        itemCount: 4,
        options: CarouselOptions(
          height: 50,
          aspectRatio: 16/9,
          viewportFraction: 0.3,
          initialPage: 0,
          enableInfiniteScroll: false,
          scrollDirection: Axis.horizontal,
          padEnds: false,
        ),
        itemBuilder: (context, index, realIndex) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: index == _currentIndex ? AppColors.myYellow : AppColors.myAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text("Something", style: TextStyle(
                  color: index == _currentIndex ? AppColors.myPrimary : AppColors.myBackground,
                  fontFamily: AppFonts.mainFont,
                  fontSize: 16,
                ),),
              ),
            ),
          );
        },
      ),
    );
  }
}