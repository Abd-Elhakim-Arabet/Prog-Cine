import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/multiple_use/date_slider.dart';
import 'package:prog/components/single_use/theatre_page/cinemaPic.dart';
import 'package:prog/components/single_use/utitlity_pages/lower_section.dart';
import 'package:prog/components/single_use/movie_page/movie_image_title.dart';
import 'package:prog/services/models.dart';
import 'package:prog/services/storage/database_service.dart';

class movieDescription extends StatefulWidget {
  final Movie movie;
  const movieDescription({super.key, required this.movie});

  @override
  State<movieDescription> createState() => _movieDescriptionState();
}

class _movieDescriptionState extends State<movieDescription> {
  DatabaseService _dbService = DatabaseService();
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
var selectedDate = DateTime.now();

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
                child: dateSlider(
                  onDateChanged: _updateSelectedDate,
                )),
            ),
            SizedBox(height: 30,),
            fun()
          ],
        ),
      ),
    );
  }
Widget TheatersList(var theaterSchedules) {
  return ListView.builder(
    itemBuilder: (context, index) {
      String theaterId = theaterSchedules.keys.elementAt(index);
      List<DateTime> schedules_starttime = theaterSchedules[theaterId];
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.myPrimary,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: FutureBuilder<Theater?>(
          future: _dbService.getTheaterById(theaterId),
          builder: (context, theaterSnapshot) {
            if (theaterSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
  
            if (!theaterSnapshot.hasData || theaterSnapshot.data == null) {
              //TODO: handle this case correctly
              return Center(child: Text('Theater not found'));
            }
  
            Theater theater = theaterSnapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
          Container(
            child: cinemaPic(
              cinemaPath: theater.image,
              location: theater.location,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 8.0,
              children: schedules_starttime.map((startTime) {
                return Chip(
            backgroundColor: AppColors.myPrimary,
            label: Text(
              "${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')}",
              style: TextStyle(
                color: AppColors.myAccent,
                fontFamily: AppFonts.mainFont,
                fontSize: 16,
              ),
            ),
                );
              }).toList(),
            ),
          ),
              ],
            );
          },
        ),
      );
    },
    
  );
}

void _updateSelectedDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

Widget fun(){
  return SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: FutureBuilder<List<Schedule>>(
                future: _dbService.getSchedulesByDateAndMovieId(selectedDate, widget.movie.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No schedules found'));
                  }
                    Map<String, List<DateTime>> theaterSchedules = {};
                    for (var schedule in snapshot.data!) {
                    if (!theaterSchedules.containsKey(schedule.theaterId)) {
                      theaterSchedules[schedule.theaterId] = [];
                    }
                    theaterSchedules[schedule.theaterId]!.add(schedule.startTime);
                    }
                  
                  return TheatersList(theaterSchedules) ;
                },
              ),
            );
}

}
