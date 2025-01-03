part of 'popular_movies_bloc.dart';

abstract class PopularMoviesEvent extends Equatable {
  const PopularMoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchPopularMovies extends PopularMoviesEvent {}

class FetchPopularMoviesPage extends PopularMoviesEvent {
  final int page;

  const FetchPopularMoviesPage(this.page);
}
