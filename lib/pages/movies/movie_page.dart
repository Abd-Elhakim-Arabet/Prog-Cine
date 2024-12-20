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
            const SizedBox(
              height: 70,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: mySearchBar(),
            ),
            const SizedBox(height: 20),
            Section(filter: "Popular"),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: FutureBuilder<List<Movie>>(
                future: _dbService.getMoviesFromCollection(MovieCollections.popular),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No Movies found'));
                  }

                  List<Movie> movies = snapshot.data!;

                  return movieMatrix(
                    movies: movies,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Section(filter: "This Weekend"),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: FutureBuilder<List<Movie>>(
                future: _dbService.getMoviesFromCollection(MovieCollections.this_weekend),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No Movies found'));
                  }

                  List<Movie> movies = snapshot.data!;

                  return movieMatrix(
                    movies: movies,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Section(filter: "In Theatres"),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: FutureBuilder<List<Movie>>(
                future: _dbService.getMoviesFromCollection(MovieCollections.in_theaters),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No Movies found'));
                  }

                  List<Movie> movies = snapshot.data!;

                  return movieMatrix(
                    movies: movies,
                  );
                },
              ),
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
