import 'package:dartz/dartz.dart';
import 'package:popular_movies/src/core/errors/failures.dart';
import 'package:popular_movies/src/domain/entities/movie.dart';
import 'package:popular_movies/src/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
