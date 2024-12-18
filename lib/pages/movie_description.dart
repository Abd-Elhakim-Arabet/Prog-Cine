import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/date_slider.dart';
import 'package:prog/components/lower_section.dart';
import 'package:prog/components/movie_image_title.dart';
import 'package:prog/data/models.dart';

class movieDescription extends StatefulWidget {
  final Movie movie;
  const movieDescription({super.key, required this.movie});

  @override
  State<movieDescription> createState() => _movieDescriptionState();
}

class _movieDescriptionState extends State<movieDescription> {
  late int years;
  String genres = " Genre1/Genre2";
  String duration = "2h 15min";
  String title = "Titles";
  String url =
      "https://platform.polygon.com/wp-content/uploads/sites/2/chorus/uploads/chorus_asset/file/23883921/Cover_2.png?quality=90&strip=all&crop=0%2C5.4405630865485%2C100%2C89.676746611053&w=2400";
  String imdbRating = "8.9";
  String tomatoesPercent = "98";
  String description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec purus nec nunc";

  @override
  void initState() {
    super.initState();
    title = widget.movie.name;
    url = widget.movie.bigImage;
    imdbRating = widget.movie.imdbRating;
    tomatoesPercent = widget.movie.rottenTomatoesRating;
    description = widget.movie.description;
    genres = widget.movie.genre;
    duration = widget.movie.duration;
    years = widget.movie.year;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.myAccent),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors.myBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieImageTitle(
              imageUrl: url,
              title: title,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    years.toString(),
                    style: TextStyle(
                      color: AppColors.myAccent,
                      fontFamily: AppFonts.mainFont,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    genres,
                    style: TextStyle(
                      color: AppColors.myAccent,
                      fontFamily: AppFonts.mainFont,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    duration,
                    style: TextStyle(
                      color: AppColors.myAccent,
                      fontFamily: AppFonts.mainFont,
                      fontSize: 17,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/assets/images/imdb.png",
                  width: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  imdbRating.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: AppFonts.mainFont,
                    fontSize: 19,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 35,
                ),
                Image.asset(
                  "lib/assets/images/tomatoes.png",
                  width: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "$tomatoesPercent%",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: AppFonts.mainFont,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  description,
                  style: TextStyle(
                    color: AppColors.myAccent,
                    fontFamily: AppFonts.mainFont,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: dateSlider()),
            ),
            Text("Cosmos Alpha", style: TextStyle(
              
            ))
          ],
        ),
      ),
    );
  }
}
