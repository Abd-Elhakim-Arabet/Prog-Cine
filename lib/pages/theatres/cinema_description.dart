import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/single_use/theatre_page/cinema_image_title.dart';
import 'package:prog/components/multiple_use/date_slider.dart';
import 'package:prog/components/single_use/movie_page/movie_slider.dart';
import 'package:prog/services/models.dart';
import 'package:prog/services/data/dummy_data.dart';
import 'package:prog/services/storage/database_service.dart';

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
  String location = "Algiers, Algeria";
  var selectedDate = DateTime.now();
  final inputDate = DateTime(2024, 12, 20);
  String cinemaId = "3";
  DatabaseService _dbService = DatabaseService();
  @override
  void initState() {
    super.initState();
    title = widget.cinema.name;
    url = widget.cinema.image;
    cinemaColor = AppColors.myPrimary;
    firstMovieTime = widget.cinema.firstMovieTime;
    lastMovieTime = widget.cinema.lastMovieTime;
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
            cinemaImageTitle(imageUrl: url, title: title, color: cinemaColor),
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
            dateSlider(
              onDateChanged: _updateSelectedDate,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: FutureBuilder<List<Schedule>>(
                future: _dbService.getSchedulesByDateAndTheatreId(selectedDate, cinemaId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No schedules found'));
                  }

                  List<Schedule> shedules = snapshot.data!;
                  List<String> movieIds = [];
                  for (var schedule in shedules) {
                    movieIds.add(schedule.movieId);
                  }

                  return FutureBuilder<List<Movie>>(
                      future: _dbService.getMoviesByIds(movieIds),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Center(child: Text('No Movies found'));
                        }
                        List<Movie> movies = snapshot.data!;
                        return MovieSlider(
                          movies: movies,
                        );
                      });
                },
              ),
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

  List<Movie> getMovies(Theater theater, DateTime date) {
    // implemetation to be adjusted
    /*for (var day in theater.days) {
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
  }*/
    return [];
  }

  List<DateTime> getTimes(Theater theater, DateTime date) {
    // implemetation to be adjusted
    /*for (var day in theater.days) {
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
  }*/
    return [];
  }
}
