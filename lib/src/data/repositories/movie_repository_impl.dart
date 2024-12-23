import 'package:dartz/dartz.dart';
import 'package:popular_movies/src/core/errors/exceptions.dart';
import 'package:popular_movies/src/core/errors/failures.dart';
import 'package:popular_movies/src/core/utils/constants.dart';
import 'package:popular_movies/src/data/datasources/movie_remote_data_source.dart';
import 'package:popular_movies/src/data/models/movie_model.dart';
import 'package:popular_movies/src/domain/entities/movie.dart';
import 'package:popular_movies/src/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ServerFailure, List<Movie>>> getNewestMovies() async {
    try {
      final List<MovieModel> movieModels =
          await remoteDataSource.getNewestMovies();
      final List<Movie> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getPopularMovies() async {
    try {
      final List<MovieModel> movieModels =
          await remoteDataSource.getPopularMovies();
      final List<Movie> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> searchMovies(String query) async {
    try {
      final List<MovieModel> movieModels =
          await remoteDataSource.searchMovie(query);
      final List<Movie> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMoviesPage(int page) async {
    try {
      final List<MovieModel> movieModels =
          await remoteDataSource.getPopularMoviesPage(page);
      final List<Movie> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getNewestMoviesPage(int page) async {
    try {
      final List<MovieModel> movieModels =
          await remoteDataSource.getNewestMoviesPage(page);
      final List<Movie> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
