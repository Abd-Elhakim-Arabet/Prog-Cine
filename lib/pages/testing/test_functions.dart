import 'package:flutter/material.dart';
import 'package:prog/services/models.dart';
import 'package:prog/services/storage/database_service.dart';

class TestFunctions extends StatefulWidget {
  const TestFunctions({super.key});

  @override
  State<TestFunctions> createState() => _TestFunctionsState();
}

class _TestFunctionsState extends State<TestFunctions> {
  final DatabaseService databaseService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(child: ListFunction()),
    );
  }

  Widget ListFunction() {
    final inputDate = DateTime(2024, 12, 20);
    const inputMovieId = '1';

    return SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: FutureBuilder<List<Schedule>>(
                future: databaseService.getSchedulesByDateAndMovieId(inputDate,inputMovieId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No schedules found'));
                  }

                  List<Schedule> shedules = snapshot.data!;
                  List<String> movieIds = [];
                  for (var schedule in shedules) {
                    movieIds.add(schedule.movieId);
                  }

                  return FutureBuilder<List<Movie>>(
                      future: databaseService.getMoviesByIds(movieIds),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Center(child: Text('No movies found'));
                        }
                        List<Movie> movies = snapshot.data!;
                        return Center(child: Text('${movies.length}'));
                      });
                },
              ),
            );
  }
}
