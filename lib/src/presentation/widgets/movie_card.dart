import 'package:flutter/material.dart';
import 'package:popular_movies/src/domain/entities/movie.dart';
import 'package:popular_movies/src/presentation/pages/movie_details_page.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(this.movie, {super.key});

  final Movie movie;

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
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.all(5),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Ink.image(
                image: NetworkImage(
                  movie.posterPath.isNotEmpty
                      ? 'https://image.tmdb.org/t/p/w500/${movie.posterPath}'
                      : 'https://st4.depositphotos.com/14953852/22772/v/450/depositphotos_227725020-stock-illustration-image-available-icon-flat-vector.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0.0, // Position at the bottom
              left: 0.0,
              right: 0.0,
              height: 40,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  movie.originalTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
