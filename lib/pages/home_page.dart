import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prog/assets/collections.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/single_use/utitlity_pages/lower_section.dart';
import 'package:prog/components/single_use/home_page/main_movie_menu.dart';
import 'package:prog/components/multiple_use/movie_card.dart';
import 'package:prog/components/single_use/movie_page/movie_slider.dart';
import 'package:prog/components/multiple_use/search_bar.dart';
import 'package:prog/components/single_use/home_page/see_all.dart';
import 'package:prog/components/single_use/home_page/upper_section.dart';
import 'package:prog/services/data/dummy_data.dart';
import 'package:prog/services/models.dart';
import 'package:prog/services/storage/database_calls.dart';
import 'package:prog/services/storage/database_service.dart';
import 'package:prog/utils/get_name.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final user = FirebaseAuth.instance.currentUser;
  DatabaseService _dbService = DatabaseService();
  List<String> Ids = [];



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(viewportFraction: 1);
    return Scaffold(

      backgroundColor: AppColors.myBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: upperSection(),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: mySearchBar( onSearch: (query){
                        print(query);
                    },),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 25.0),
                  child: seeAllBtn(),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 25.0),
                  child: Text(
                    "See All",
                    style: TextStyle(
                        color: AppColors.myPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            mainMovieMenu(
              movies: FeaturedMovies,
              pgController: pageController,
            ),
            SizedBox(
              height: 10,
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: FeaturedMovies.length,
              onDotClicked: (index) => pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn),
              effect: WormEffect(
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: AppColors.myPrimary,
                dotColor: AppColors.myAccent,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Popular movies", style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  color: AppColors.myYellow,
                  fontSize: 20
                ),),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: FutureBuilder<List<Movie>>(
                future: DatabaseCalls.getMoviesFromCollection(MovieCollections.popular),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No Movies found'));
                    }
                  }

                  List<Movie> movies = snapshot.data!;

                  return MovieSlider(
                    movies: movies,
                  );
                },
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("In theaters", style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  color: AppColors.myYellow,
                  fontSize: 20
                ),),
              ),
            ),
            SizedBox(height: 10,),
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

                  return MovieSlider(
                    movies: movies,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

