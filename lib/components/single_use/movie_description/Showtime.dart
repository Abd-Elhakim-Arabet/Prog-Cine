import 'package:flutter/material.dart';
import 'package:prog/services/models.dart';
import 'package:prog/assets/colors.dart';
import 'package:prog/assets/fonts.dart';
import 'package:prog/components/single_use/theatre_page/cinemaPic.dart';

class ShowtimeWidget extends StatelessWidget {
  final List<ScheduleWithTheater> schedules;

  const ShowtimeWidget({
    Key? key,
    required this.schedules,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (schedules.isEmpty) {
      return const Center(
        child: Text(
          "No Schedules Found.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: AppFonts.mainFont,
          ),
        ),
      );
    }

    // Group schedules by theater hopefully this works (hashes correctly)
    final Map<Theater, List<DateTime>> theaterSchedules = {};
    for (final schedule in schedules) {
      theaterSchedules.putIfAbsent(schedule.theater, () => []);
      theaterSchedules[schedule.theater]!.add(schedule.startTime);
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: theaterSchedules.length,
      itemBuilder: (context, index) {
        final theater = theaterSchedules.keys.elementAt(index);
        final scheduleTimes = theaterSchedules[theater]!;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.myPrimary, width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
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
                  children: scheduleTimes.map((startTime) {
                    final paddedMinute = startTime.minute.toString().padLeft(2, '0');
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
          ),
        );
      },
    );
  }
}