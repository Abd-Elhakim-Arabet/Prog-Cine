part of 'movie_schedules_bloc.dart';

sealed class MovieSchedulesState extends Equatable {
  final DateTime selectedDate;
  final List<ScheduleWithTheater> currentDaySchedules;
  final Map<DateTime, List<ScheduleWithTheater>> allSchedules;

  const MovieSchedulesState({
    required this.selectedDate,
    required this.currentDaySchedules,
    required this.allSchedules,
  });

  @override
  List<Object> get props => [selectedDate, currentDaySchedules, allSchedules];
}

final class MovieSchedulesLoading extends MovieSchedulesState {
  MovieSchedulesLoading()
      : super(
          selectedDate: DateTime.now(),
          currentDaySchedules: [],
          allSchedules: {},
        );
}

final class MovieSchedulesLoaded extends MovieSchedulesState {
  const MovieSchedulesLoaded({
    required super.selectedDate,
    required super.currentDaySchedules,
    required super.allSchedules,
  });
}

final class MovieSchedulesError extends MovieSchedulesState {
  final String message;
  MovieSchedulesError({required this.message})
      : super(
            selectedDate: DateTime.now(),
            currentDaySchedules: [],
            allSchedules: {});

  @override
  List<Object> get props => [message, ...super.props];
}
