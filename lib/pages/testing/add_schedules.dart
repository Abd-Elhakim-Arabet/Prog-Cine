import 'package:flutter/material.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/services/models.dart';
import 'package:prog/services/storage/database_service.dart';
import 'package:intl/intl.dart'; // Import for formatting DateTime

class AddSchedules extends StatefulWidget {
  const AddSchedules({super.key});

  @override
  State<AddSchedules> createState() => _AddSchedulesState();
}

class _AddSchedulesState extends State<AddSchedules> {
  final DatabaseService _dbService = DatabaseService();
  final ScrollController _scrollController = ScrollController();

  String? movieDropDownValue;
  String? theaterDropDownValue;

  DateTime? selectedDate;
  TimeOfDay? selectedStartTime;

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
      body: Column(
        children: [
          Expanded(
            child: DisplaySchedules(),
          ),
        ],
      ),
    );
  }

  Widget DisplaySchedules() {
    return FutureBuilder<List<Schedule>>(
      future: _dbService.getSchedules(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text(
            "No Schedules Found.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: AppFonts.mainFont,
            ),
          ));
        }

        List<Schedule> schedules = snapshot.data!;

        return ListView.builder(
          controller: _scrollController,
          itemCount: schedules.length,
          itemBuilder: (context, index) {
            Schedule sc = schedules[index];
            return Container(
              color: Colors.grey[350],
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("Movie ID: ${sc.movieId}"),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void inputDisplay() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Add Schedule',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setDialogState) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 600),
                  child: Column(
                    children: [
                      buildDropdown<Movie>(
                        future: _dbService.getMovies(),
                        value: movieDropDownValue,
                        hint: "Select Movie",
                        onChanged: (value) {
                          setDialogState(() {
                            movieDropDownValue = value;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      buildDropdown<Theater>(
                        future: _dbService.getTheaters(),
                        value: theaterDropDownValue,
                        hint: "Select Theater",
                        onChanged: (value) {
                          setDialogState(() {
                            theaterDropDownValue = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            setDialogState(() {
                              selectedDate = pickedDate;
                            });
                          }
                        },
                        child: Text(
                          selectedDate == null
                              ? 'Select Date'
                              : 'Date: ${DateFormat.yMMMd().format(selectedDate!)}',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () async {
                          final pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            setDialogState(() {
                              selectedStartTime = pickedTime;
                            });
                          }
                        },
                        child: Text(
                          selectedStartTime == null
                              ? 'Select Start Time'
                              : 'Start Time: ${selectedStartTime!.format(context)}',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (movieDropDownValue != null &&
                    theaterDropDownValue != null &&
                    selectedDate != null &&
                    selectedStartTime != null) {
                  final schedule = Schedule(
                    movieId: movieDropDownValue!,
                    theaterId: theaterDropDownValue!,
                    date: DateTime(
                      selectedDate!.year,
                      selectedDate!.month,
                      selectedDate!.day,
                    ),
                    startTime: DateTime(
                      selectedDate!.year,
                      selectedDate!.month,
                      selectedDate!.day,
                      selectedStartTime!.hour,
                      selectedStartTime!.minute,
                    ),
                  );
                  _dbService.addSchedule(schedule);
                  Navigator.of(context).pop(); // Close the dialog
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please select all fields.")),
                  );
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Widget buildDropdown<T>({
    required Future<List<T>> future,
    required String? value,
    required String hint,
    required ValueChanged<String?> onChanged,
  }) {
    return FutureBuilder<List<T>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No items found'));
        }

        final items = snapshot.data!;
        return DropdownButton<String>(
          value: value,
          hint: Text(hint),
          items: items.map((item) {
            if (item is Movie) {
              return DropdownMenuItem<String>(
                value: item.id,
                child: Text(item.name),
              );
            } else if (item is Theater) {
              return DropdownMenuItem<String>(
                value: item.id,
                child: Text(item.name),
              );
            }
            return null;
          }).where((item) => item != null).cast<DropdownMenuItem<String>>().toList(),
          onChanged: onChanged,
        );
      },
    );
  }
}