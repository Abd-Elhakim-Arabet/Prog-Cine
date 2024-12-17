import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/movie_card_2.dart';
import 'package:prog/data/models.dart';

class movieMatrix extends StatefulWidget {
  final List<Movie> movies;
  const movieMatrix({super.key, required this.movies});

  @override
  State<movieMatrix> createState() => _movieMatrixState();
}

class _movieMatrixState extends State<movieMatrix> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.builder(
        shrinkWrap:
            true, // Ensure the GridView takes up only the necessary space
        physics:
            NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent:270 ,
            crossAxisCount: 2, mainAxisSpacing: 25, crossAxisSpacing: 20,
            childAspectRatio: 0.7
            ),
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          return movieCard2(
            movie: widget.movies[index],
          );
        },
      ),
    );
  }
}
