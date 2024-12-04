import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/main_movie_menu copy.dart';
import 'package:prog/components/movie_card.dart';
import 'package:prog/components/movie_slider.dart';
import 'package:prog/components/search_bar.dart';
import 'package:prog/components/theater_card.dart';
import 'package:prog/components/see_all.dart';
import 'package:prog/components/upper_section.dart';
import 'package:prog/readData/get_name.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final user = FirebaseAuth.instance.currentUser;
  List<String> Ids = [];
  @override
  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
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
              children: const [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: mySearchBar(),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Padding(
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
            mainMovieMenu(),
            //MovieSlider(),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: const Text(
                  "Featured",
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFonts.mainFont),
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            movieListBuilder(context),
            SizedBox(
              height: 6,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: const Text(
                  "Comming Soon",
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFonts.mainFont),
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            movieListBuilder(context),
            SizedBox(
              height: 6,
            ),
            TheaterCard(
              backgroundColor: Colors.orange,
              title: "Salle Cosmos Alpha",
              subtitle: "Memorial du Martyr, El Madania",
              location: "Algiers",
              status: "NEW",
            ),
            SizedBox(
              height: 6,
            ),
            ElevatedButton(onPressed: logOut, child: Text("logout"))
          ],
        ),
      ),
    );
  }
}

Widget movieListBuilder(context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    height: MediaQuery.of(context).size.height * 0.35,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 7,
      itemBuilder: (context, index) {
        return movieCard(
          value: 1.0,
        );
      },
    ),
  );
}
