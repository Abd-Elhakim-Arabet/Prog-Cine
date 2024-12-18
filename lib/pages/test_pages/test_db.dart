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
  final DatabaseService databaseService = DatabaseService();

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
      body: SingleChildScrollView(
        child: ListTest(),
      ),
    );
  }

  Widget ListTest() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.50,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(
        stream: databaseService.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No theatersday found'));
          }

          List movies = snapshot.data?.docs ?? [];

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              Movie movie = movies[index].data();
              String id = movies[index].id;
              print(id);
              return Container(
                color: Colors.grey[350],
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("${{movie.name}}"),
                    Text("${{movie.duration}}"),
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
            content: TextField(
              controller: movieNameController,
              decoration: InputDecoration(hintText: 'Enter Movie Name'),
            ),
            actions: [
              MaterialButton(
                child: Text('Add'),
                color: AppColors.myPrimary,
                onPressed: () {
                  Movie movie = Movie(
                      name: movieNameController.text,
                      id: 0,
                      duration: "0",
                      genre: "0",
                      bigImage: "0",
                      smallImage: "0",
                      year: 0,
                      description: "0",
                      imdbRating: "0",
                      rottenTomatoesRating: "0");
                  databaseService.addMovie(movie);
                  Navigator.pop(context);
                  movieNameController.clear();
                },
              )
            ],
          );
        });
  }
}
