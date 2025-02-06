import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/blocs/review_create_bloc/review_create_bloc.dart';
import 'package:prog/blocs/review_get_bloc/review_get_bloc.dart';

import 'package:prog/components/multiple_use/date_slider.dart';
import 'package:prog/components/single_use/movie_description/Showtime.dart';
import 'package:prog/components/single_use/movie_description/post_comment.dart';

import 'package:prog/components/single_use/movie_page/movie_slider.dart';
import 'package:prog/components/single_use/utitlity_pages/lower_section.dart';
import 'package:prog/components/single_use/movie_page/movie_image_title.dart';
import 'package:prog/utils/convert_time.dart';
import 'package:prog/services/models.dart';
import 'package:prog/services/storage/database_service.dart';
import 'package:review_repository/review_repository.dart';
import 'package:user_repository/user_repository.dart';

class movieDescription extends StatefulWidget {
  final MyUser user;
  final Movie movie;

  const movieDescription({super.key, required this.user, required this.movie});

  @override
  State<movieDescription> createState() => _movieDescriptionState();
}

class _movieDescriptionState extends State<movieDescription> {
  final TextEditingController reviewController = TextEditingController();
  late Review review;
  int rating = 1;
  DatabaseService _dbService = DatabaseService();
  late int years;
  String genres = " Genre1/Genre2";
  String duration = "90";
  String title = "Titles";
  String url =
      "https://platform.polygon.com/wp-content/uploads/sites/2/chorus/uploads/chorus_asset/file/23883921/Cover_2.png?quality=90&strip=all&crop=0%2C5.4405630865485%2C100%2C89.676746611053&w=2400";
  String imdbRating = "8.9";
  String tomatoesPercent = "98";
  String description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec purus nec nunc";
  var selectedDate = DateTime.now();

  final DatabaseService _dbservice = DatabaseService();
  String movieId = "1";
  @override
  void initState() {
    super.initState();
    title = widget.movie.name;
    rating = 1;
    url = widget.movie.bigImage;
    imdbRating = widget.movie.imdbRating;
    tomatoesPercent = widget.movie.rottenTomatoesRating;
    description = widget.movie.description;
    genres = widget.movie.genre;
    duration = widget.movie.duration;
    years = widget.movie.year;
    movieId = widget.movie.id;
    review = Review.empty;
    review.user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    print(review);
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
                    minutesToHours(int.parse(duration)),
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
            SizedBox(
              height: 10,
            ),
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: dateSlider(
                    firstDate: DateTime(2024, 12, 20),
                    onDateChanged: _updateSelectedDate,
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            ShowtimeWidget(
              dbService: _dbService,
              selectedDate: selectedDate,
              movieId: widget.movie.id,
            ),
            //line
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Container(
                width: double.infinity,
                height: 1,
                color: AppColors.myAccent,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PostComment(controller: reviewController),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar.builder(
                        minRating: 1,
                        itemSize: 30,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) => setState(() {
                          this.rating = rating.toInt();
                        }),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (reviewController.text.isNotEmpty) {
                            setState(() {
                              review.comment = reviewController.text;
                              review.movieId = movieId;
                              review.stars = rating;
                            });
                            context
                                .read<ReviewCreateBloc>()
                                .add(CreateReview(review));
                            print(review.toString());
                          }
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                              color: AppColors.myPrimary,
                              borderRadius: BorderRadius.circular(7)),
                          child: Text(
                            "Post",
                            style: TextStyle(
                                color: AppColors.myAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),

            BlocBuilder<ReviewGetBloc, ReviewGetState>(
  builder: (context, state) {
    if (state is ReviewGetSuccess) {
      if (state.reviews.isEmpty) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            "No reviews available.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: AppFonts.mainFont,
            ),
          ),
        );
      }

      return ListView.builder(
        shrinkWrap: true, // Let ListView fit its content
        physics: NeverScrollableScrollPhysics(), // Disable its own scrolling
        itemCount: state.reviews.length,
        itemBuilder: (context, index) {
          final review = state.reviews[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.myPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.user.name,
                    style: TextStyle(
                      color: AppColors.myAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: AppFonts.mainFont,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    review.comment,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: AppFonts.mainFont,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else if (state is ReviewGetLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          "Cannot get reviews at this time.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: AppFonts.mainFont,
          ),
        ),
      );
    }
  },
)
          ],
        ),
      ),
    );
  }

  void _updateSelectedDate(DateTime date) {
    setState(() {
    });
  }
}
