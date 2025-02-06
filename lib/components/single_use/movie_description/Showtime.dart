// showtime_widget.dart
import 'package:flutter/material.dart';
import 'package:prog/services/models.dart';
import 'package:prog/services/storage/database_service.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/single_use/theatre_page/cinemaPic.dart';

class ShowtimeWidget extends StatelessWidget {
  final DatabaseService dbService;
  final DateTime selectedDate;
  final String movieId;

  const ShowtimeWidget({
    Key? key,
    required this.dbService,
    required this.selectedDate,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Schedule>>(
      future: dbService.getSchedulesByDateAndMovieId(selectedDate, movieId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No schedules found'));
        }

        final theaterSchedules = <String, List<DateTime>>{};
        for (final schedule in snapshot.data!) {
          theaterSchedules.putIfAbsent(schedule.theaterId, () => []);
          theaterSchedules[schedule.theaterId]!.add(schedule.startTime);
        }
        return _TheatersList(
          theaterSchedules: theaterSchedules,
          dbService: dbService,
        );
      },
    );
  }
}

class _TheatersList extends StatelessWidget {
  final Map<String, List<DateTime>> theaterSchedules;
  final DatabaseService dbService;

  const _TheatersList({
    Key? key,
    required this.theaterSchedules,
    required this.dbService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: theaterSchedules.length,
      itemBuilder: (context, index) {
        final theaterId = theaterSchedules.keys.elementAt(index);
        final schedulesStartTime = theaterSchedules[theaterId]!;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.myPrimary, width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: FutureBuilder<Theater?>(
            future: dbService.getTheaterById(theaterId),
            builder: (context, theaterSnapshot) {
              if (theaterSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!theaterSnapshot.hasData || theaterSnapshot.data == null) {
                return const Center(child: Text('Theater not found'));
              }

              final theater = theaterSnapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  cinemaPic(
                    cinemaPath: theater.image,
                    location: theater.location,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 8,
                      children: schedulesStartTime.map((startTime) {
                        final paddedMinute =
                            startTime.minute.toString().padLeft(2, '0');
                        return Chip(
                          backgroundColor: AppColors.myPrimary,
                          label: Text(
                            '${startTime.hour}:$paddedMinute',
                            style: TextStyle(
                              color: AppColors.myAccent,
                              fontFamily: AppFonts.mainFont,
                              fontSize: 16,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}