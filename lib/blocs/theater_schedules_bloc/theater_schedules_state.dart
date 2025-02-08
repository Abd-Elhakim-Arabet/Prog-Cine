part of 'theater_schedules_bloc.dart';


sealed class TheaterSchedulesState extends Equatable {
  final DateTime selectedDate;
  final List<ScheduleWithMovie> currentDaySchedules;
  final Map<DateTime, List<ScheduleWithMovie>> allSchedules;
  const TheaterSchedulesState({
    required this.selectedDate,
    required this.currentDaySchedules,
    required this.allSchedules,
  });
  
  @override
  List<Object> get props => [selectedDate, currentDaySchedules, allSchedules];
}

final class TheaterSchedulesLoading extends TheaterSchedulesState {
  TheaterSchedulesLoading() : super(
    selectedDate: DateTime.now(),
    currentDaySchedules: [],
    allSchedules: {},
  );
}

final class TheaterSchedulesLoaded extends TheaterSchedulesState {
  const TheaterSchedulesLoaded({
    required super.selectedDate,
    required super.currentDaySchedules,
    required super.allSchedules,
  });
}

final class TheaterSchedulesError extends TheaterSchedulesState {
  final String message;
  TheaterSchedulesError({required this.message})
      : super(
          selectedDate: DateTime.now(), 
          currentDaySchedules: [], 
          allSchedules: {}
        );
  
  @override
  List<Object> get props => [message, ...super.props];
}
