import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/cinema_image_title.dart';
import 'package:prog/components/date_slider.dart';
import 'package:prog/components/movie_slider.dart';
import 'package:prog/data/models.dart';

class cinemaDescription extends StatefulWidget {
  final Theater cinema;
  const cinemaDescription({super.key, required this.cinema});

  @override
  State<cinemaDescription> createState() => _cinemaDescriptionState();
}

class _cinemaDescriptionState extends State<cinemaDescription> {
  String title = "Cinema";
  String url = "lib/assets/images/moviecard.png";
  Color cinemaColor = AppColors.myPrimary;
  String firstMovieTime = "11:00 am";
  String lastMovieTime = "7:30 pm";
  String location = "Algiers, ";

  void initState() {
    super.initState();
    title = widget.cinema.name;
     url = widget.cinema.image;
     cinemaColor = AppColors.myPrimary;
     firstMovieTime = widget.cinema.firstMovieTime;
     lastMovieTime =widget.cinema.lastMovieTime;
     location = widget.cinema.location;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.myAccent),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            cinemaImageTitle(
                imageUrl: url,
                title: title,
                color: cinemaColor),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Text(
                    "First Movie at:",
                    style: TextStyle(
                      color: AppColors.myAccent,
                      fontFamily: AppFonts.mainFont,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    firstMovieTime,
                    style: TextStyle(
                      color: cinemaColor,
                      fontFamily: AppFonts.mainFont,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Text(
                    "Last Movie at:",
                    style: TextStyle(
                      color: AppColors.myAccent,
                      fontFamily: AppFonts.mainFont,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    lastMovieTime,
                    style: TextStyle(
                      color: cinemaColor,
                      fontFamily: AppFonts.mainFont,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Text(
                    "Location:",
                    style: TextStyle(
                      color: AppColors.myAccent,
                      fontFamily: AppFonts.mainFont,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      color: cinemaColor,
                      fontFamily: AppFonts.mainFont,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            dateSlider(),
            SizedBox(
              height: 30,
            ),
            MovieSlider(
              movies: [],
            )
          ],
        ),
      ),
    );
  }
}
