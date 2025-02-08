import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog/blocs/movie_schedules/movie_schedules_bloc.dart';
import 'package:prog/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:prog/blocs/review_create_bloc/review_create_bloc.dart';
import 'package:prog/blocs/review_delete_bloc/review_delete_bloc.dart';
import 'package:prog/blocs/review_get_bloc/review_get_bloc.dart';
import 'package:prog/components/multiple_use/movie_card.dart';
import 'package:prog/services/data/dummy_data.dart';
import 'package:prog/services/models.dart';
import 'package:prog/pages/movies/movie_description.dart';
import 'package:review_repository/review_repository.dart';

class MovieSlider extends StatefulWidget {
  const MovieSlider({super.key, required this.movies, this.dates});
  final List<Movie> movies;
  final List<DateTime>? dates;
  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PageController _pageController =
        PageController(viewportFraction: 0.5);
    return SizedBox(
      height: 350,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - (value.abs() * 0.3)).clamp(0.8, 1.0);
              } else {
                value = index == 0 ? 1.0 : 0.8;
              }
              return BlocBuilder<MyUserBloc, MyUserState>(
                builder: (context, state) {
                  return Center(
                    child: Transform.scale(
                      scale: value,
                      child: InkWell(
                        onTap: () {
                          var movie = widget.movies[index];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MultiBlocProvider(
                                        providers: [
                                          BlocProvider(create: (_)=>MovieSchedulesBloc(movieId: movie.id)..add(LoadMovieSchedules(movieId: movie.id))),
                                          BlocProvider(
                                            create: (context) => ReviewCreateBloc(
                                                reviewRepository:
                                                    FirebaseReviewRepository()),
                                          ),
                                          BlocProvider(
                                            create: (context) => ReviewGetBloc(
                                                reviewRepository:
                                                    FirebaseReviewRepository())..add(GetReviews()),
                                          ),

                                          BlocProvider(
                                            create: (context) => ReviewDeleteBloc(
                                              reviewRepository: FirebaseReviewRepository()))
                                        ],
                                        child: movieDescription(
                                          user: state.user!,
                                          movie: widget.movies[index],
                                        ),
                                      )));
                        },
                        child: movieCard(
                          date: widget.dates?[index],
                          movie: widget.movies[index],
                          value: value,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
