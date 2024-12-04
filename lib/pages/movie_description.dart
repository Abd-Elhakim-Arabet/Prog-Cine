import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/components/lower_section.dart';
import 'package:prog/components/movie_image_title.dart';

class movieDescription extends StatefulWidget {
  final String imageUrl;
  final String title;  
  const movieDescription({super.key, required this.imageUrl, required this.title});
 
  @override
  State<movieDescription> createState() => _movieDescriptionState();
}

class _movieDescriptionState extends State<movieDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: MovieImageTitle(imageUrl: widget.imageUrl,title: widget.title,),
      bottomNavigationBar:BottomNavBar(),
    );
  }
}
