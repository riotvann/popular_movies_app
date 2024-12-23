import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:popular_movies/src/domain/entities/movie.dart';
import 'package:popular_movies/src/presentation/pages/movie_details_page.dart';

class MovieListTile extends StatelessWidget {
  final Movie movie;
  const MovieListTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailsPage(
              movie: movie,
            ),
          ),
        );
      },
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            movie.posterPath.isNotEmpty
                ? 'https://image.tmdb.org/t/p/w300/${movie.posterPath}'
                : 'https://st4.depositphotos.com/14953852/22772/v/450/depositphotos_227725020-stock-illustration-image-available-icon-flat-vector.jpg',
            height: 200,
            fit: BoxFit.fill,
          ),
        ),
        title: Text(
          movie.originalTitle,
        ),
        subtitle: Text(
          DateFormat('yyyy').parse(movie.releaseDate).year.toString(),
        ),
      ),
    );
  }
}
