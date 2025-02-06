import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:prog/blocs/review_create_bloc/review_create_bloc.dart';
import 'package:prog/blocs/review_delete_bloc/review_delete_bloc.dart';
import 'package:prog/blocs/review_get_bloc/review_get_bloc.dart';
import 'package:prog/components/multiple_use/movie_card_2.dart';
import 'package:prog/pages/movies/movie_description.dart';
import 'package:prog/services/models.dart';
import 'package:review_repository/review_repository.dart';

class movieMatrix extends StatefulWidget {
  final List<Movie> movies;
  const movieMatrix({super.key, required this.movies});

  @override
  State<movieMatrix> createState() => _movieMatrixState();
}

class _movieMatrixState extends State<movieMatrix> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.builder(
        shrinkWrap:
            true, // Ensure the GridView takes up only the necessary space
        physics:
            NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 270,
            crossAxisCount: 2,
            mainAxisSpacing: 25,
            crossAxisSpacing: 20,
            childAspectRatio: 0.7),
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          return BlocBuilder<MyUserBloc, MyUserState>(
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MultiBlocProvider(
                                        providers: [
                                        
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
                child: movieCard2(
                  movie: widget.movies[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
