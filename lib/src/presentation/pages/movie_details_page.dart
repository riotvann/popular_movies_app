import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:popular_movies/src/domain/entities/movie.dart';
import 'package:popular_movies/src/presentation/widgets/chip_list.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;
  const MovieDetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Popular Movies App'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      movie.originalTitle,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${movie.voteAverage.toStringAsFixed(2)} / 10',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Overview",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  movie.overview,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Release Date",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  DateFormat('MMMM d of yyyy').format(
                    DateFormat('yyyy-MM-dd').parse(movie.releaseDate),
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Genres",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GenreChips(genreIds: movie.genreIds),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
