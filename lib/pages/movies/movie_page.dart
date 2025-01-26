import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/blocs/movie_page_bloc/movie_cubit.dart';
import 'package:prog/blocs/movie_page_bloc/movie_state.dart';
import 'package:prog/components/multiple_use/search_bar2.dart';
import 'package:prog/components/single_use/movie_page/movie_matrix.dart';

class moviePage extends StatelessWidget {
  const moviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..loadInitialData(),
      child: const MoviePageView(),
    );
  }
}

class MoviePageView extends StatelessWidget {
  const MoviePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(child: Text('Error: ${state.error}'));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: mySearchBare(
                    onSearchResults: (results) {
                      context.read<MovieCubit>().updateSearchResults(results);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                if (state.isSearching) ...[
                  const Section(filter: "Search Results"),
                  movieMatrix(movies: state.searchResults),
                ] else ...[
                  const Section(filter: "Popular"),
                  movieMatrix(movies: state.popularMovies),
                  const SizedBox(height: 20),
                  const Section(filter: "This Weekend"),
                  movieMatrix(movies: state.weekendMovies),
                  const SizedBox(height: 20),
                  const Section(filter: "In Theatres"),
                  movieMatrix(movies: state.inTheatreMovies),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}


class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.filter,
  });

  final String filter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            filter,
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.myPrimary,
              fontFamily: AppFonts.mainFont,
            ),
          ),
          const Row(
            children: [],
          )
        ],
      ),
    );
  }
}