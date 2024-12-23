import 'package:dartz/dartz.dart';
import 'package:popular_movies/src/core/errors/failures.dart';
import 'package:popular_movies/src/domain/entities/movie.dart';
import 'package:popular_movies/src/domain/repositories/movie_repository.dart';

class GetPopularMoviesPage {
  final MovieRepository repository;

  GetPopularMoviesPage(this.repository);

  Future<Either<Failure, List<Movie>>> call(int page) async {
    return await repository.getPopularMoviesPage(page);
  }
}