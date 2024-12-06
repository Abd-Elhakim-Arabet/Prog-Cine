import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/components/date_card.dart';

class dateSlider extends StatefulWidget {
  final Color colored;
  const dateSlider({super.key, this.colored = AppColors.myPrimary});

  @override
  State<dateSlider> createState() => _dateSliderState();
}

class _dateSliderState extends State<dateSlider> {
  int active = 0;

  @override
  void initState() {
    super.initState();
    active = 0;
  }

  void selectDay(index) {
    active = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
          height: 93,
          viewportFraction: 0.3,
          enableInfiniteScroll: false,
          padEnds: false),
      itemCount: 5,
      itemBuilder: (context, index, realIndex) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
              selectDay(index);
            },
            child: dateCard(
              day: "Mon",
              number: index,
              month: "Dec",
              isActive: index == active,
              color: widget.colored,
            ),
          ),
        );
      },
    );
  }
}
