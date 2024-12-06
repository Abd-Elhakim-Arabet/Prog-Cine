import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prog/components/movie_card.dart';

class MovieSlider extends StatefulWidget {
  const MovieSlider({super.key});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      final PageController _pageController = PageController(viewportFraction: 0.5);
    return SizedBox(
      height: 300,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - (value.abs() * 0.3)).clamp(0.8, 1.0);
              }
              else {
                value = index == 0 ? 1.0 : 0.8;
              }
              return Center(
                child: Transform.scale(
                  scale: value,
                  child: GestureDetector(
                    onTap: () {},
                    child: movieCard(
                      value: value,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
