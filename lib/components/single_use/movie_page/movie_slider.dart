import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prog/components/multiple_use/movie_card.dart';
import 'package:prog/data/dummy_data.dart';
import 'package:prog/data/models.dart';
import 'package:prog/pages/movies/movie_description.dart';

class MovieSlider extends StatefulWidget {
  const MovieSlider({super.key, required this.movies, this.dates});
  final List<Movie> movies;
  final List<DateTime>? dates;
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
      height: 350,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.movies.length,
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
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => movieDescription(movie: widget.movies[index])));
                    },
                    child: movieCard(
                      date: widget.dates?[index],
                      movie:widget.movies[index],
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
