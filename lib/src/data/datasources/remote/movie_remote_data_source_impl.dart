import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:popular_movies/src/core/errors/exceptions.dart';
import 'package:popular_movies/src/core/utils/constants.dart';

import 'package:popular_movies/src/data/datasources/movie_remote_data_source.dart';
import 'package:popular_movies/src/data/models/movie_model.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  final String errorMsj = 'Server error occurred';

  MovieRemoteDataSourceImpl({required this.client});

  final BASE_URL = dotenv.env['BASE_URL'];
  final API_KEY = dotenv.env['API_KEY'];

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(
      Uri.parse(
          "$BASE_URL/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc"),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $API_KEY'},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException(message: errorMsj, statusCode: response.statusCode);
    }
  }

  @override
  Future<List<MovieModel>> getNewestMovies() async {
    String maxDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    const minDate = '2024-06-12';
    final response = await client.get(
      Uri.parse('$BASE_URL/discover/movie?'
          'include_adult=false&include_video=false&language=enUS&page=1&sort_by=popularity.desc&with_release_type=2|3&release_date.gte='
          '$minDate&release_date.lte=$maxDate'),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $API_KEY'},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException(message: errorMsj, statusCode: response.statusCode);
    }
  }

  @override
  Future<List<MovieModel>> searchMovie(String query) async {
    final response = await client.get(
      Uri.parse("$BASE_URL/search/movie?query=$query&api_key=$API_KEY"),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $API_KEY'},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException(message: errorMsj, statusCode: response.statusCode);
    }
  }

  @override
  Future<List<MovieModel>> getPopularMoviesPage(int page) async {
    final response = await client.get(
      Uri.parse(
          "$BASE_URL/discover/movie?include_adult=false&include_video=false&language=en-US&page=$page&sort_by=popularity.desc"),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $API_KEY'},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException(message: errorMsj, statusCode: response.statusCode);
    }
  }

  @override
  Future<List<MovieModel>> getNewestMoviesPage(int page) async {
    String maxDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final oneWeekAgo = DateTime.now().subtract(const Duration(days: 7));
    final minDate = DateFormat('dd-MM-yyyy').format(oneWeekAgo);
    ;
    final response = await client.get(
      Uri.parse('$BASE_URL/discover/movie?'
          'include_adult=false&include_video=false&language=enUS&page=$page&sort_by=popularity.desc&with_release_type=2|3&release_date.gte='
          '$minDate&release_date.lte=$maxDate'),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $API_KEY'},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException(message: errorMsj, statusCode: response.statusCode);
    }
  }
}
