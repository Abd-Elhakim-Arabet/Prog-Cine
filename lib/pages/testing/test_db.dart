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
      child: StreamBuilder(
        stream: databaseService.getTheaters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No theatersday found'));
          }

          List theaters = snapshot.data?.docs ?? [];
          print(theaters);
        

          return ListView.builder(
            itemCount: theaters.length,
            itemBuilder: (context, index) {
              // Theater theater=theaters[0].data();
              Theater th = theaters[0].data();
              return Column(
                children: [Text("${th.days[0]}")],
              );
            },
          );
        },
      ),
    );
  }
}
