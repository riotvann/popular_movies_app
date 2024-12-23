import 'package:dartz/dartz.dart';
import 'package:popular_movies/src/core/errors/failures.dart';
import 'package:popular_movies/src/domain/entities/movie.dart';
import 'package:popular_movies/src/domain/repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getPopularMovies();
  }
}
