import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:popular_movies/src/domain/entities/movie.dart';
import 'package:popular_movies/src/domain/usecases/get_newest_movies.dart';
import 'package:popular_movies/src/domain/usecases/get_newest_movies_page.dart';

part 'newest_movies_event.dart';
part 'newest_movies_state.dart';

class NewestMoviesBloc extends Bloc<NewestMoviesEvent, NewestMoviesState> {
  final GetNewestMovies getNewestMovies;
  final GetNewestMoviesPage getNewestMoviesPage;
  NewestMoviesBloc(
      {required this.getNewestMovies, required this.getNewestMoviesPage})
      : super(MoviesInitial()) {
    on<FetchNewestMovies>((event, emit) async {
      emit(MoviesLoading());
      final result = await getNewestMovies();
      result.fold(
        (failure) => emit(MoviesError(failure.toString())),
        (movies) => emit(MoviesLoaded(movies)),
      );
    });
    on<FetchNewestMoviesPage>((event, emit) async {
      emit(MoviesLoading());
      final result = await getNewestMoviesPage(event.page);

      result.fold(
        (failure) => emit(MoviesError(failure.toString())),
        (movies) => emit(MoviesLoaded(movies)),
      );
    });
  }
}
