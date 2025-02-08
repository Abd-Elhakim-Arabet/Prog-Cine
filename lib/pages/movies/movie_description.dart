import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/blocs/review_create_bloc/review_create_bloc.dart';
import 'package:prog/blocs/review_delete_bloc/review_delete_bloc.dart';
import 'package:prog/blocs/review_get_bloc/review_get_bloc.dart';
import 'package:prog/blocs/movie_schedules/movie_schedules_bloc.dart';

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
                  child: BlocBuilder<MovieSchedulesBloc, MovieSchedulesState>(
                    builder: (context, state) {
                      return dateSlider(
                        firstDate: DateTime.now(),
                        initialDate: state.selectedDate,
                        onDateChanged: (date) {
                          context.read<MovieSchedulesBloc>().add(ChangeDateSelected(newDate: date));
                        },
                      );
                    },
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<MovieSchedulesBloc, MovieSchedulesState>(
              builder: (context, state) {
                if (state is MovieSchedulesLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is MovieSchedulesError) {
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
                if (state is MovieSchedulesLoaded && state.currentDaySchedules.isEmpty) {
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
                if (state is MovieSchedulesLoaded) {
                  List<Theater> theaters = state.currentDaySchedules
                      .map((schedule) => schedule.theater)
                      .toList();

                  return ShowtimeWidget(schedules: state.currentDaySchedules);
                }
                return Container();
              },
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

           MultiBlocListener(
            listeners: [
              BlocListener<ReviewDeleteBloc, ReviewDeleteState>(
                listener: (context, state) {
                  if (state is ReviewDeleteSuccess) {
                    context.read<ReviewGetBloc>().add(GetReviews());
                  }
                },
              ),
              BlocListener<ReviewCreateBloc, ReviewCreateState>(
                listener: (context, state) {
                  if (state is ReviewCreateSuccess) {
                    context.read<ReviewGetBloc>().add(GetReviews());
                  }
                },
              ),
            ],
  child: BlocBuilder<ReviewGetBloc, ReviewGetState>(
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

        var movieReviews = getMovieReviews(state.reviews, movieId);
        return ListView.builder(
          shrinkWrap: true, 
          physics: NeverScrollableScrollPhysics(),
          itemCount: movieReviews.length,
          itemBuilder: (context, index) {
            final review = movieReviews[index];
            return ReviewComment(
              review: review,
              userId: widget.user.id,
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
  ),
)
          ],
        ),
      ),
    );
  }

  void _updateSelectedDate(DateTime date) {
    // Removed the setState here, the bloc handles the state now
  }
}

class ReviewComment extends StatelessWidget {
  final Review review;
  final String userId;

  const ReviewComment({Key? key, required this.review, required this.userId})
      : super(key: key);

  @override

  
  Widget build(BuildContext context) {
     bool visibleDelete = review.user.id == userId;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.myBackground,
        ),
        padding: const EdgeInsets.all(12.0),
        child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded( 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              profilePicture(review.user.name),
              SizedBox(width: 10),
              Expanded( 
                child: Text(
                  review.user.name,
                  style: TextStyle(
                    color: Color(0xFFCBAAC5),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: AppFonts.mainFont,
                  ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              SizedBox(width: 10,),
              Text(
                review.comment,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: AppFonts.mainFont,
                ),
                softWrap: true,
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 10,),
              RatingBar.builder(
              initialRating: review.stars.toDouble(),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true, 
              itemCount: 5, 
              itemSize: 17, 
              ignoreGestures: true, 
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},  
                                  ),
            ],
          )
        ],
      ),
    ),
    
    GestureDetector(
      onTap: () {
        
        context
            .read<ReviewDeleteBloc>()
            .add(DeleteReview(review.id, review.user.id, userId));
      },
      child: Visibility(
        visible: visibleDelete,
        child: Text(
          "Delete",
          style: TextStyle(
            color: Color(0xFFCBAAC5),
            fontSize: 11,
            fontFamily: AppFonts.mainFont,
          ),
        ),
      ),
    ),
  ],
)
      ),
    );
  }
}

List<Review> getMovieReviews(List<Review> reviews, String movieId) {
  return reviews.where((review) => review.movieId == movieId ).toList();
}

Widget profilePicture(String name, {double size = 40}) {
  String initials = name.trim().isNotEmpty
      ? name.trim().split(" ").map((e) => e[0]).take(2).join().toUpperCase()
      : "?";

  return CircleAvatar(
    radius: size / 2,
    backgroundColor: Colors.black, 
    child: Text(
      initials,
      style: TextStyle(
        color: Color(0xFFCBAAC5),
        fontSize: size / 2.5,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}