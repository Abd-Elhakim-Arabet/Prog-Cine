part of 'movies_page_bloc.dart';

enum DataStatus { loading, success, error }

sealed class MoviesPageBlocState extends Equatable {
  final DataStatus status;
  final String? errorMessage;

  const MoviesPageBlocState({
    this.status = DataStatus.loading,
    this.errorMessage,
  });
  
  @override
  List<Object> get props => [status, errorMessage ?? ''];
}

final class MoviesPageCollectionState extends MoviesPageBlocState {
  final List<Movie> popularMovies;
  final List<Movie> thisWeekendMovies;
  final List<Movie> inTheaterMovies;
  final DataStatus popularStatus;
  final DataStatus thisWeekendStatus;
  final DataStatus inTheaterStatus;

  const MoviesPageCollectionState({
    super.status,
    super.errorMessage,
    this.popularMovies = const [],
    this.thisWeekendMovies = const [],
    this.inTheaterMovies = const [],
    this.popularStatus = DataStatus.loading,
    this.thisWeekendStatus = DataStatus.loading,
    this.inTheaterStatus = DataStatus.loading,
  });

  factory MoviesPageCollectionState.loading() {
    return const MoviesPageCollectionState(status: DataStatus.loading);
  }

  @override
  List<Object> get props => [
    ...super.props,
    popularMovies,
    thisWeekendMovies,
    inTheaterMovies,
    popularStatus,
    thisWeekendStatus,
    inTheaterStatus,
  ];
}

final class MoviesPageSearchState extends MoviesPageBlocState {
  final List<Movie> searchResults;
  final Map<String, dynamic> searchParams;

  const MoviesPageSearchState({
    super.status,
    super.errorMessage,
    this.searchResults = const [],
    this.searchParams = const {},
  });

  factory MoviesPageSearchState.loading(Map<String, dynamic> params) {
    return MoviesPageSearchState(
      status: DataStatus.loading,
      searchParams: params,
    );
  }

  @override
  List<Object> get props => [...super.props, searchResults, searchParams];
}
