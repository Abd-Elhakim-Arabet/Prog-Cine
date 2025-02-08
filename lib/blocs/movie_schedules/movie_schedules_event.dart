part of 'movie_schedules_bloc.dart';

sealed class MovieSchedulesEvent extends Equatable {
  const MovieSchedulesEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieSchedules extends MovieSchedulesEvent {
  final String movieId;
  const LoadMovieSchedules({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

class ChangeDateSelected extends MovieSchedulesEvent {
  final DateTime newDate;
  const ChangeDateSelected({required this.newDate});

  @override
  List<Object> get props => [...super.props, newDate];
}
