import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prog/services/storage/database_calls.dart';
import 'package:prog/services/models.dart';
import 'package:prog/utils/DbCallsUtils.dart';

part 'movie_schedules_event.dart';
part 'movie_schedules_state.dart';

class MovieSchedulesBloc extends Bloc<MovieSchedulesEvent, MovieSchedulesState> {
  final DatabaseCalls _databaseCalls = DatabaseCalls();
  late final Map<DateTime, List<ScheduleWithTheater>> _groupedSchedules;
  DateTime _selectedDate = DateTime.now();

  MovieSchedulesBloc({required String movieId}) : super(MovieSchedulesLoading()) {
    on<LoadMovieSchedules>((event, emit) async {
      try {
        final schedules = await DatabaseCalls.getSchedulesByDateAndMovieId(
            DateTime.now(), event.movieId);
        _groupedSchedules = groupScheduleByDayScheduleWithTheater(schedules);
        _selectedDate =
            DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day);
        emit(MovieSchedulesLoaded(
          selectedDate: _selectedDate,
          currentDaySchedules: _groupedSchedules[_selectedDate] ?? [],
          allSchedules: _groupedSchedules,
        ));
      } catch (e) {
        emit(MovieSchedulesError(message: e.toString()));
      }
    });

    on<ChangeDateSelected>((event, emit) {
      _selectedDate =
          DateTime(event.newDate.year, event.newDate.month, event.newDate.day);
      emit(MovieSchedulesLoaded(
        selectedDate: _selectedDate,
        currentDaySchedules: _groupedSchedules[_selectedDate] ?? [],
        allSchedules: _groupedSchedules,
      ));
    });
  }

  @override
  Future<void> close() {
    print("we're closing buddy");
    return super.close();
  }
}


