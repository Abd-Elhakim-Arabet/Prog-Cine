import 'package:flutter/material.dart';
import 'package:prog/components/movie_image_title.dart';

class movieDescription extends StatefulWidget {
  const movieDescription({super.key});

  @override
  State<movieDescription> createState() => _movieDescriptionState();
}

class _movieDescriptionState extends State<movieDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: movieImageTitle(),
    );
  }
}
