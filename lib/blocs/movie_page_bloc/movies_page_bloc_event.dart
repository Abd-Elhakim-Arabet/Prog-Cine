part of 'movies_page_bloc.dart';

sealed class MoviesPageBlocEvent extends Equatable {
  const MoviesPageBlocEvent();

  @override
  List<Object> get props => [];
}

final class MoviesPageLoadCollections extends MoviesPageBlocEvent {
  const MoviesPageLoadCollections();
}

final class MoviesPageSearch extends MoviesPageBlocEvent {
  final Map<String, dynamic> searchParams;
  const MoviesPageSearch(this.searchParams);

  @override
  List<Object> get props => [searchParams];
}


