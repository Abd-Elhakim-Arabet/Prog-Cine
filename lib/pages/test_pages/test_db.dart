import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/data/models.dart';
import 'package:prog/services/storage/database_service.dart';

class TestDb extends StatefulWidget {
  const TestDb({super.key});

  @override
  State<TestDb> createState() => _TestScheduleState();
}

class _TestScheduleState extends State<TestDb> {
  final TextEditingController movieNameController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController bigImageController = TextEditingController();
  final TextEditingController smallImageController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imdbRatingController = TextEditingController();
  final TextEditingController rottenTomatoesRatingController =
      TextEditingController();

  final DatabaseService databaseService = DatabaseService();
  final ScrollController _scrollController = ScrollController(); // Added ScrollController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        onPressed: inputDisplay,
        backgroundColor: AppColors.myPrimary,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: StreamBuilder(
        stream: databaseService.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No movies found'));
          }

          List movies = snapshot.data?.docs ?? [];

          return ListView.builder(
            controller: _scrollController, // Set ScrollController
            itemCount: movies.length,
            itemBuilder: (context, index) {
              Movie movie = movies[index].data();
              String id = movies[index].id;
              return Container(
                color: Colors.grey[350],
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("${movie.name}"),
                    Text("${movie.duration}"),
                    Image.network(movie.smallImage),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  void inputDisplay() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Movie'),
          content: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 500), // Limit height
              child: Column(
                children: [
                  TextField(
                    controller: movieNameController,
                    decoration: InputDecoration(hintText: 'Enter Movie Name'),
                  ),
                  TextField(
                    controller: durationController,
                    decoration: InputDecoration(hintText: 'Enter Duration'),
                  ),
                  TextField(
                    controller: genreController,
                    decoration: InputDecoration(hintText: 'Enter Genre'),
                  ),
                  TextField(
                    controller: bigImageController,
                    decoration: InputDecoration(hintText: 'Enter Big Image URL'),
                  ),
                  TextField(
                    controller: smallImageController,
                    decoration: InputDecoration(hintText: 'Enter Small Image URL'),
                  ),
                  TextField(
                    controller: yearController,
                    decoration: InputDecoration(hintText: 'Enter Year'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(hintText: 'Enter Description'),
                  ),
                  TextField(
                    controller: imdbRatingController,
                    decoration: InputDecoration(hintText: 'Enter IMDb Rating'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: rottenTomatoesRatingController,
                    decoration:
                        InputDecoration(hintText: 'Enter Rotten Tomatoes Rating'),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            MaterialButton(
              child: Text('Add'),
              color: AppColors.myPrimary,
              onPressed: () {
                Movie movie = Movie(
                  name: movieNameController.text,
                  id: 0,
                  duration: durationController.text,
                  genre: genreController.text,
                  bigImage: bigImageController.text,
                  smallImage: smallImageController.text,
                  year: int.tryParse(yearController.text) ?? 0,
                  description: descriptionController.text,
                  imdbRating: imdbRatingController.text,
                  rottenTomatoesRating: rottenTomatoesRatingController.text,
                );
                databaseService.addMovie(movie);
                Navigator.pop(context);

                movieNameController.clear();
                durationController.clear();
                genreController.clear();
                bigImageController.clear();
                smallImageController.clear();
                yearController.clear();
                descriptionController.clear();
                imdbRatingController.clear();
                rottenTomatoesRatingController.clear();
              },
            ),
          ],
        );
      },
    );
  }
}
