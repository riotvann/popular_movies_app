part of 'popular_movies_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends PopularMoviesState {}

class MoviesLoading extends PopularMoviesState {}

class MoviesLoaded extends PopularMoviesState {
  final List<Movie> movies;
  const MoviesLoaded(this.movies);
}

class MoviesError extends PopularMoviesState {
  final String message;
  const MoviesError(this.message);
}
