import 'package:flutter/material.dart';
import 'package:prog/assets/collections.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/single_use/movie_page/movie_matrix.dart';
import 'package:prog/components/multiple_use/search_bar.dart';
import 'package:prog/components/single_use/home_page/upper_section.dart';
import 'package:prog/services/data/dummy_data.dart';
import 'package:prog/services/models.dart';
import 'package:prog/services/storage/database_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog/blocs/movie_page_bloc/movies_page_bloc.dart';


class moviePage extends StatefulWidget {
  const moviePage({super.key});

  @override
  State<moviePage> createState() => _moviePageState();
}

class _moviePageState extends State<moviePage> {
  String filter = "Popular";
  String movieType = "Algerian Movies";
  DatabaseService _dbService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: mySearchBar(
                onSearch: (searchParams) {
                  if (searchParams.values.every((value) => value == null)) {
                    context.read<MoviesPageBloc>().add(const MoviesPageLoadCollections());
                  } else {
                    context.read<MoviesPageBloc>().add(MoviesPageSearch(searchParams));
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<MoviesPageBloc, MoviesPageBlocState>(
              builder: (context, state) {
                if (state is MoviesPageCollectionState) {
                  return Column(
                    children: [
                      Section(filter: "Popular"),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: state.popularStatus == DataStatus.loading
                            ? Center(child: CircularProgressIndicator())
                            : state.popularStatus == DataStatus.error
                                ? Center(child: Text('Failed to load popular movies'))
                                : movieMatrix(
                                    movies: state.popularMovies,
                                  ),
                      ),
                      const SizedBox(height: 20),
                      Section(filter: "This Weekend"),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: state.thisWeekendStatus == DataStatus.loading
                            ? Center(child: CircularProgressIndicator())
                            : state.thisWeekendStatus == DataStatus.error
                                ? Center(child: Text('Failed to load this weekend movies'))
                                : movieMatrix(
                                    movies: state.thisWeekendMovies,
                                  ),
                      ),
                      const SizedBox(height: 20),
                      Section(filter: "In Theatres"),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: state.inTheaterStatus == DataStatus.loading
                            ? Center(child: CircularProgressIndicator())
                            : state.inTheaterStatus == DataStatus.error
                                ? Center(child: Text('Failed to load in theater movies'))
                                : movieMatrix(
                                    movies: state.inTheaterMovies,
                                  ),
                      ),
                    ],
                  );
                } else if (state is MoviesPageSearchState) {
                  return Column(
                    children: [
                      Section(filter: "Search Results"),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: state.status == DataStatus.loading
                            ? Center(child: CircularProgressIndicator())
                            : state.status == DataStatus.error
                                ? Center(child: Text('Error'))
                                : state.searchResults.isEmpty
                                    ? Center(child: Text('No results found'))
                                    : movieMatrix(movies: state.searchResults),
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator(
                    color: Colors.red,
                  ));
                }
              },
            ),
          ],
        ),
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
            children: [
              /* Icon(
                Icons.tune,
                color: AppColors.myAccent,
              ) */
            ],
          )
        ],
      ),
    );
  }
}
