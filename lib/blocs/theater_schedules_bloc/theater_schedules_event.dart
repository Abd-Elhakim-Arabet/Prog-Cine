part of 'theater_schedules_bloc.dart';

sealed class TheaterSchedulesEvent extends Equatable {
  const TheaterSchedulesEvent();

  @override
  List<Object> get props => [];
}

class LoadTheaterSchedules extends TheaterSchedulesEvent {
  final String theaterId;
  const LoadTheaterSchedules({required this.theaterId});
  
  @override
  List<Object> get props => [theaterId];
}

class ChangeDateSelected extends TheaterSchedulesEvent {
  final DateTime newDate;
  const ChangeDateSelected({required this.newDate});
  
  @override
  List<Object> get props => [...super.props, newDate];
}
