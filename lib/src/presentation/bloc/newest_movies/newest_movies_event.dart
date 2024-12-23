part of 'newest_movies_bloc.dart';

abstract class NewestMoviesEvent extends Equatable {
  const NewestMoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchNewestMovies extends NewestMoviesEvent {}

class FetchNewestMoviesPage extends NewestMoviesEvent {
  final int page;

  const FetchNewestMoviesPage(this.page);
}
