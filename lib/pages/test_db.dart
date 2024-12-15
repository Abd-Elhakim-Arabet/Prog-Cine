import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/data/models.dart';
import 'package:prog/services/storage/database_service.dart';

class TestDb extends StatefulWidget {
  const TestDb({super.key});

  @override
  State<TestDb> createState() => _TestDbState();
}

class _TestDbState extends State<TestDb> {
  final DatabaseService databaseService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SingleChildScrollView(
        child: movieListTest(),
      ),
    );
  }
  Widget movieListTest() {
    return SizedBox(
      
      height: MediaQuery.sizeOf(context).height * 0.50,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(
          stream: databaseService.getMovies(),
          builder: (context, snapshot) {
            List movies = snapshot.data?.docs ?? [];
            if (movies.isEmpty) {
              return Center(
                child: Text('No movies found'),
              );
            }
            print(movies);
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
              Movie movie = movies[index].data();
              String movieId = movies[index].id;
              return Column(
                children: [
                  ListTile(
                    title: Text(movie.name),
                    subtitle: Text(movie.description),
                    
                  ),
                  Text(movie.imdbRating),
                  Text(movie.imdbRating),
                  Text("${DateTime(2024, 11, 07)}")
                  
                ],
              );
            });
          }),
    );
  }
}