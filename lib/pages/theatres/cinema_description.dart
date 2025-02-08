import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/single_use/theatre_page/cinema_image_title.dart';
import 'package:prog/components/multiple_use/date_slider.dart';
import 'package:prog/components/single_use/movie_page/movie_slider.dart';
import 'package:prog/services/models.dart';
import 'package:prog/services/storage/database_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog/blocs/theater_schedules_bloc/theater_schedules_bloc.dart';

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
  String cinemaId = "1";
  

  @override
  void initState() {
    super.initState();
    title = widget.cinema.name;
    url = widget.cinema.image;
    cinemaColor = AppColors.myPrimary;
    firstMovieTime = widget.cinema.firstMovieTime;
    lastMovieTime = widget.cinema.lastMovieTime;
    location = widget.cinema.location;
    cinemaId = widget.cinema.id;
  }

  @override
  void dispose() {
    super.dispose();
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
            BlocBuilder<TheaterSchedulesBloc, TheaterSchedulesState>(
              builder: (context, state) {
                return dateSlider(
                  initialDate: state.selectedDate,
                  onDateChanged: (date) {
                    context.read<TheaterSchedulesBloc>().add(ChangeDateSelected(newDate: date));
                  },
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<TheaterSchedulesBloc, TheaterSchedulesState>(
              builder: (context, state) {
                if (state is TheaterSchedulesLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is TheaterSchedulesError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: AppFonts.mainFont,
                      ),
                    ),
                  );
                }
                if (state.currentDaySchedules.isEmpty) {
                  return Center(
                    child: Text(
                      "No Schedules Found.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: AppFonts.mainFont,
                      ),
                    ),
                  );
                }
                
                // Extract movies directly from ScheduleWithMovie objects
                List<Movie> movies = state.currentDaySchedules
                  .map((schedule) => schedule.movie)
                  .toList();
                
                return MovieSlider(movies: movies);
              },
            )
          ],
        ),
      ),
    );
  }
}
