import 'package:popular_movies/src/core/utils/constants.dart';
import 'package:popular_movies/src/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNewestMovies();
  Future<List<MovieModel>> searchMovie(String query);
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getPopularMoviesPage(int page);
  Future<List<MovieModel>> getNewestMoviesPage(int page);
}
