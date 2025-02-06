import 'package:equatable/equatable.dart';
import 'package:prog/services/models.dart';

class MovieState extends Equatable {
  final List<Movie> searchResults;
  final List<Movie> popularMovies;
  final List<Movie> weekendMovies;
  final List<Movie> inTheatreMovies;
  final bool isSearching;
  final bool isLoading;
  final String? error;
  

  const MovieState({
    this.searchResults = const [],
    this.popularMovies = const [],
    this.weekendMovies = const [],
    this.inTheatreMovies = const [],
    this.isSearching = false,
    this.isLoading = false,
    this.error,
  });

  MovieState copyWith({
    List<Movie>? searchResults,
    List<Movie>? popularMovies,
    List<Movie>? weekendMovies,
    List<Movie>? inTheatreMovies,
    bool? isSearching,
    bool? isLoading,
    String? error,
  }) {
    return MovieState(
      searchResults: searchResults ?? this.searchResults,
      popularMovies: popularMovies ?? this.popularMovies,
      weekendMovies: weekendMovies ?? this.weekendMovies,
      inTheatreMovies: inTheatreMovies ?? this.inTheatreMovies,
      isSearching: isSearching ?? this.isSearching,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        searchResults,
        popularMovies,
        weekendMovies,
        inTheatreMovies,
        isSearching,
        isLoading,
        error,
      ];
}