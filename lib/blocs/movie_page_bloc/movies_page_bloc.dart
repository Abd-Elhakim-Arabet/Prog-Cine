import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prog/services/models.dart';
import 'package:prog/services/storage/database_calls.dart';
import 'package:rxdart/rxdart.dart';
part 'movies_page_bloc_event.dart';
part 'movies_page_bloc_state.dart';


class MoviesPageBloc extends Bloc<MoviesPageBlocEvent, MoviesPageBlocState> {
  MoviesPageBloc() : super(MoviesPageCollectionState.loading()) {
    on<MoviesPageLoadCollections>(_onLoadCollections);
    on<MoviesPageSearch>(_onSearch, transformer: debounce(const Duration(milliseconds: 500)));
    _initialize();
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  Future<void> _initialize() async {
    add(const MoviesPageLoadCollections());
  }

  Future<void> _onLoadCollections(
    MoviesPageLoadCollections event,
    Emitter<MoviesPageBlocState> emit,
  ) async {
    emit(MoviesPageCollectionState.loading());
    
    DataStatus popularStatus = DataStatus.loading;
    DataStatus thisWeekendStatus = DataStatus.loading;
    DataStatus inTheaterStatus = DataStatus.loading;
    List<Movie> popularMovies = [];
    List<Movie> thisWeekendMovies = [];
    List<Movie> inTheaterMovies = [];
    String? errorMessage;

    try {
      popularMovies = await DatabaseCalls.getMoviesFromCollection('popular');
      popularStatus = DataStatus.success;
    } catch (e) {
      popularStatus = DataStatus.error;
      errorMessage = 'Failed to load popular movies: ${e.toString()}';
    }

    try {
      thisWeekendMovies = await DatabaseCalls.getMoviesFromCollection('thisWeekend');
      thisWeekendStatus = DataStatus.success;
    } catch (e) {
      thisWeekendStatus = DataStatus.error;
      errorMessage ??= 'Failed to load this weekend movies: ${e.toString()}';
    }

    try {
      inTheaterMovies = await DatabaseCalls.getMoviesFromCollection('inTheater');
      inTheaterStatus = DataStatus.success;
    } catch (e) {
      inTheaterStatus = DataStatus.error;
      errorMessage ??= 'Failed to load in theater movies: ${e.toString()}';
    }

    emit(MoviesPageCollectionState(
      status: errorMessage == null ? DataStatus.success : DataStatus.error,
      errorMessage: errorMessage,
      popularStatus: popularStatus,
      thisWeekendStatus: thisWeekendStatus,
      inTheaterStatus: inTheaterStatus,
      popularMovies: popularMovies,
      thisWeekendMovies: thisWeekendMovies,
      inTheaterMovies: inTheaterMovies,
    ));
  }

  Future<void> _onSearch(
    MoviesPageSearch event,
    Emitter<MoviesPageBlocState> emit,
  ) async {
    final searchParams = event.searchParams;
    
    if (searchParams.values.every((value) => value == null)) {
      add(const MoviesPageLoadCollections());
      return;
    }

    emit(MoviesPageSearchState.loading(searchParams));
    
    try {
      final results = await DatabaseCalls.searchMovies(
        searchParams['name'] as String?,
        searchParams['genre'] as String?,
        searchParams['year'] as int?,
      );
      emit(MoviesPageSearchState(
        searchResults: results,
        searchParams: searchParams,
        status: DataStatus.success,
      ));
    } catch (e) {
      emit(MoviesPageSearchState(
        status: DataStatus.error,
        errorMessage: 'Failed to search movies: ${e.toString()}',
        searchParams: searchParams,
      ));
    }
  }
}
