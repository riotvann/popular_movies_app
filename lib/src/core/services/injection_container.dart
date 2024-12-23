import 'package:get_it/get_it.dart';
import 'package:popular_movies/src/data/datasources/movie_remote_data_source.dart';
import 'package:popular_movies/src/data/datasources/remote/movie_remote_data_source_impl.dart';
import 'package:popular_movies/src/data/repositories/movie_repository_impl.dart';
import 'package:popular_movies/src/domain/repositories/movie_repository.dart';
import 'package:popular_movies/src/domain/usecases/get_newest_movies.dart';
import 'package:popular_movies/src/domain/usecases/get_newest_movies_page.dart';
import 'package:popular_movies/src/domain/usecases/get_popular_movies.dart';
import 'package:popular_movies/src/domain/usecases/get_popular_movies_page.dart';
import 'package:popular_movies/src/domain/usecases/search_movies.dart';
import 'package:http/http.dart' as http;
import 'package:popular_movies/src/presentation/bloc/newest_movies/newest_movies_bloc.dart';
import 'package:popular_movies/src/presentation/bloc/popular_movies/popular_movies_bloc.dart';

final getIt = GetIt.instance;

void init() {
  //Bloc
  getIt.registerFactory(() => PopularMoviesBloc(
      getPopularMovies: getIt(), getPopularMoviesPage: getIt()));
  getIt.registerFactory(() =>
      NewestMoviesBloc(getNewestMovies: getIt(), getNewestMoviesPage: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => GetPopularMoviesPage(getIt()));
  getIt.registerLazySingleton(() => GetNewestMovies(getIt()));
  getIt.registerLazySingleton(() => GetNewestMoviesPage(getIt()));
  getIt.registerLazySingleton(() => SearchMovies(getIt()));

  // Repositories
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(remoteDataSource: getIt()));

  // Data sources
  getIt.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: getIt()));

  getIt.registerLazySingleton(() => http.Client());
}
