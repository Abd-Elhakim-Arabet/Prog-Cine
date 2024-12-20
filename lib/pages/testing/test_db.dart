import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/services/models.dart';
import 'package:prog/services/storage/database_service.dart';

class TestDb extends StatefulWidget {
  const TestDb({super.key});

  @override
  State<TestDb> createState() => _TestScheduleState();
}

class _TestScheduleState extends State<TestDb> {
  final DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: ListTest(),
      ),
    );
  }

  Widget ListTest() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.50,
      width: MediaQuery.sizeOf(context).width,
      child: FutureBuilder<List<Theater>>(
      future: databaseService.getTheaters(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No schedules found'));
        }

        List<Theater> theaters = snapshot.data!;

        return ListView.builder(
          itemCount: theaters.length,
          itemBuilder: (context, index) {
            Theater th = theaters[index];
            return Column(
              children: [
                Text("First Time: ${th.firstMovieTime}"),
                Text("Location: ${th.location}"),
              ],
            );
          },
        );
      },
    ),
    );
  }
}
