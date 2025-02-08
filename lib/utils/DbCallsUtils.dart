import 'package:prog/services/models.dart';


Map<DateTime, List<ScheduleWithMovie>> groupScheduleByDay(List<ScheduleWithMovie> schedules){
  Map<DateTime, List<ScheduleWithMovie>> groupedSchedules = {};
  for (var schedule in schedules) {
    DateTime date = DateTime(schedule.startTime.year, schedule.startTime.month, schedule.date.day);
    if (groupedSchedules.containsKey(date)) {
      groupedSchedules[date]!.add(schedule);
    } else {
      groupedSchedules[date] = [schedule];
    }
  }
  return groupedSchedules;
}

Map<DateTime, List<ScheduleWithTheater>> groupScheduleByDayScheduleWithTheater(
    List<ScheduleWithTheater> schedules) {
  Map<DateTime, List<ScheduleWithTheater>> groupedSchedules = {};
  for (var schedule in schedules) {
    DateTime date = DateTime(
        schedule.startTime.year, schedule.startTime.month, schedule.date.day);
    if (groupedSchedules.containsKey(date)) {
      groupedSchedules[date]!.add(schedule);
    } else {
      groupedSchedules[date] = [schedule];
    }
  }
  return groupedSchedules;
}