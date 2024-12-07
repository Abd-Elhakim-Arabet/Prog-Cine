import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/cinema_image_title.dart';
import 'package:prog/components/date_slider.dart';
import 'package:prog/components/movie_slider.dart';
import 'package:prog/data/dummy_data.dart';
import 'package:prog/data/dummy_models.dart';

class cinemaDescription extends StatefulWidget {
  const cinemaDescription({super.key});

  @override
  State<cinemaDescription> createState() => _cinemaDescriptionState();
}

class _cinemaDescriptionState extends State<cinemaDescription> {
    String title = "Cinema";
  String url = "lib/assets/images/moviecard.png";
  Color cinemaColor =  AppColors.myPrimary;
  String firstMovieTime = "11:00 am";
  String lastMovieTime = "7:30 pm";
  String location = "Algiers, Algeria";
  var selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.myAccent),
        backgroundColor:Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            cinemaImageTitle(
              imageUrl: "lib/assets/images/moviecard.png",
              title: title,
              color: cinemaColor
            ),
        
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
                        SizedBox(width: 10,),
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
                        SizedBox(width: 10,),
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
                        SizedBox(width: 10,),
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
        
            SizedBox(height: 30,),
            dateSlider(
              onDateChanged: _updateSelectedDate,
            ),
            SizedBox(height: 30,),
            MovieSlider(
              movies: getMovies(theaters[0], selectedDate),
              dates: getTimes(theaters[0], selectedDate),
            )
          ],
        ),
      ),
    );
  }

  void _updateSelectedDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  List<Movie> getMovies(Theater theater,DateTime date) {
    for (var day in theater.days) {
      if(
        day.date.weekday == selectedDate.weekday
      ){ {
        var schedules = day.schedules;
        List<Movie> todayMovies = [];
        for (var schedule in schedules) {
          todayMovies.add(allMovies[schedule.movieId-1]);
        }
        return todayMovies;
      }
    }
  }
    return [];
}

List<DateTime> getTimes(Theater theater,DateTime date) {
    for (var day in theater.days) {
      if(
        day.date.weekday == selectedDate.weekday
      ){ {
        var schedules = day.schedules;
        List<DateTime> times = [];
        for (var schedule in schedules) {
          times.add(schedule.startTime);
        }
        return times;
      }
    }
  }
    return [];
}
}