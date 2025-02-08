import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prog/services/storage/database_calls.dart';
import 'package:prog/services/models.dart';
import 'package:prog/utils/DbCallsUtils.dart';

part 'theater_schedules_event.dart';
part 'theater_schedules_state.dart';

class TheaterSchedulesBloc extends Bloc<TheaterSchedulesEvent, TheaterSchedulesState> {
  final DatabaseCalls _databaseCalls = DatabaseCalls();
  late final Map<DateTime, List<ScheduleWithMovie>> _groupedSchedules;
  DateTime _selectedDate = DateTime.now();
  
  TheaterSchedulesBloc({required String theaterId}) : 
      super(TheaterSchedulesLoading()) {
    
    on<LoadTheaterSchedules>((event, emit) async {
      try {
        final schedules = await DatabaseCalls.getSchedulesByDateAndTheaterId(DateTime.now(), event.theaterId);
        _groupedSchedules = groupScheduleByDay(schedules);
        _selectedDate = DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day);
        emit(TheaterSchedulesLoaded(
          selectedDate: _selectedDate,
          currentDaySchedules: _groupedSchedules[_selectedDate] ?? [],
          allSchedules: _groupedSchedules,
        ));
      } catch (e) {
        emit(TheaterSchedulesError(message: e.toString()));
      }
    });
    
    on<ChangeDateSelected>((event, emit) {
      _selectedDate = DateTime(event.newDate.year, event.newDate.month, event.newDate.day);
      emit(TheaterSchedulesLoaded(
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
