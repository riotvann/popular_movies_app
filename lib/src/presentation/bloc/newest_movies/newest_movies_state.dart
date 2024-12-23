part of 'newest_movies_bloc.dart';

abstract class NewestMoviesState extends Equatable {
  const NewestMoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends NewestMoviesState {}

class MoviesLoading extends NewestMoviesState {}

class MoviesLoaded extends NewestMoviesState {
  final List<Movie> movies;
  const MoviesLoaded(this.movies);
}

class MoviesError extends NewestMoviesState {
  final String message;
  const MoviesError(this.message);
}
