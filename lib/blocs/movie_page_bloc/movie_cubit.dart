import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog/blocs/movie_page_bloc/movie_state.dart';
import 'package:prog/services/models.dart';
import 'package:prog/services/storage/database_service.dart';
import 'package:prog/assets/collections.dart';

class MovieCubit extends Cubit<MovieState> {
  final DatabaseService _dbService;

  MovieCubit({DatabaseService? dbService})
      : _dbService = dbService ?? DatabaseService(),
        super(const MovieState());

  Future<void> loadInitialData() async {
    emit(state.copyWith(isLoading: true));
    try {
      final popularMovies = await _dbService.getMoviesFromCollection(
          MovieCollections.popular);
      final weekendMovies = await _dbService.getMoviesFromCollection(
          MovieCollections.this_weekend);
      final inTheatreMovies = await _dbService.getMoviesFromCollection(
          MovieCollections.in_theaters);

      emit(state.copyWith(
        popularMovies: popularMovies,
        weekendMovies: weekendMovies,
        inTheatreMovies: inTheatreMovies,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }

  void updateSearchResults(List<Movie> results) {
    emit(state.copyWith(
      searchResults: results,
      isSearching: results.isNotEmpty,
    ));
  }

  void clearSearch() {
    emit(state.copyWith(
      searchResults: [],
      isSearching: false,
    ));
  }
}