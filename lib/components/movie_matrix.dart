import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/movie_card_2.dart';

class movieMatrix extends StatefulWidget {
  const movieMatrix({super.key});

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
            crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20,
            childAspectRatio: 0.7
            ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return movieCard2();
        },
      ),
    );
  }
}
