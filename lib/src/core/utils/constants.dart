import 'package:popular_movies/src/data/models/genre_model.dart';

List<GenreModel> genresList = [
  GenreModel(id: 28, name: 'Action'),
  GenreModel(id: 12, name: 'Adventure'),
  GenreModel(id: 16, name: 'Animation'),
  GenreModel(id: 35, name: 'Comedy'),
  GenreModel(id: 80, name: 'Crime'),
  GenreModel(id: 90, name: 'Documentary'),
  GenreModel(id: 18, name: 'Drama'),
  GenreModel(id: 10751, name: 'Family'),
  GenreModel(id: 14, name: 'Fantasy'),
  GenreModel(id: 36, name: 'History'),
  GenreModel(id: 27, name: 'Horror'),
  GenreModel(id: 10402, name: 'Music'),
  GenreModel(id: 9648, name: 'Mystery'),
  GenreModel(id: 10749, name: 'Romance'),
  GenreModel(id: 10770, name: 'Tv Movie'),
  GenreModel(id: 878, name: 'Sciene Fiction'),
  GenreModel(id: 53, name: 'Thriller'),
  GenreModel(id: 10752, name: 'War'),
  GenreModel(id: 37, name: 'Western'),
];

enum FetchMovieType { popular, newest }
