import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:popular_movies/src/domain/entities/movie.dart';

import 'package:popular_movies/src/domain/usecases/get_popular_movies.dart';
import 'package:popular_movies/src/domain/usecases/get_popular_movies_page.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;
  final GetPopularMoviesPage getPopularMoviesPage;
  PopularMoviesBloc(
      {required this.getPopularMovies, required this.getPopularMoviesPage})
      : super(MoviesInitial()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(MoviesLoading());
      final result = await getPopularMovies();

      result.fold(
        (failure) => emit(MoviesError(failure.toString())),
        (movies) => emit(MoviesLoaded(movies)),
      );
    });
    on<FetchPopularMoviesPage>((event, emit) async {
      emit(MoviesLoading());
      final result = await getPopularMoviesPage(event.page);

      result.fold(
        (failure) => emit(MoviesError(failure.toString())),
        (movies) => emit(MoviesLoaded(movies)),
      );
    });
  }
}
