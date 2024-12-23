import 'package:flutter/material.dart';
import 'package:popular_movies/src/core/utils/constants.dart';

class GenreChips extends StatelessWidget {
  final List<int> genreIds;

  const GenreChips({super.key, required this.genreIds});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: genreIds.map((genre) {
        return Chip(
          label: Text(
            genresList.where((element) => element.id == genre).first.name,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        );
      }).toList(),
    );
  }
}
