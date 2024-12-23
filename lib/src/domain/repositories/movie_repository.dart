import 'package:dartz/dartz.dart';
import 'package:popular_movies/src/core/errors/failures.dart';
import 'package:popular_movies/src/core/utils/constants.dart';
import 'package:popular_movies/src/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getNewestMovies();
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getPopularMoviesPage(int page);
  Future<Either<Failure, List<Movie>>> getNewestMoviesPage(int page);
}
