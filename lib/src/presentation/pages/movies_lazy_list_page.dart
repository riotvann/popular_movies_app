import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:popular_movies/src/core/utils/constants.dart';
import 'package:popular_movies/src/domain/entities/movie.dart';
import 'package:popular_movies/src/presentation/bloc/newest_movies/newest_movies_bloc.dart'
    as newest;
import 'package:popular_movies/src/presentation/bloc/popular_movies/popular_movies_bloc.dart'
    as popular;
import 'package:popular_movies/src/presentation/widgets/movie_list_tile.dart';

class MoviesLazyList<B extends Bloc<dynamic, S>, S> extends StatefulWidget {
  final FetchMovieType movieType;
  const MoviesLazyList({
    super.key,
    required this.movieType,
  });

  @override
  State<MoviesLazyList<B, S>> createState() => _MoviesLazyListState<B, S>();
}

class _MoviesLazyListState<B extends Bloc<dynamic, S>, S>
    extends State<MoviesLazyList<B, S>> {
  static const _pageSize = 20;
  int actualPage = 1;

  final PagingController<int, Movie> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      if (widget.movieType == FetchMovieType.popular) {
        context
            .read<popular.PopularMoviesBloc>()
            .add(popular.FetchPopularMoviesPage(actualPage));
      } else if (widget.movieType == FetchMovieType.newest) {
        context
            .read<newest.NewestMoviesBloc>()
            .add(newest.FetchNewestMoviesPage(actualPage));
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      listener: (context, state) {
        if (state is newest.MoviesLoaded) {
          final isLastPage = state.movies.length < _pageSize;

          if (isLastPage) {
            _pagingController.appendLastPage(state.movies);
          } else {
            final nextPageKey = actualPage + 1;
            _pagingController.appendPage(state.movies, nextPageKey);
            setState(() {
              actualPage = nextPageKey;
            });
          }
        } else if (state is popular.MoviesLoaded) {
          final isLastPage = state.movies.length < _pageSize;

          if (isLastPage) {
            _pagingController.appendLastPage(state.movies);
          } else {
            final nextPageKey = actualPage + 1;
            _pagingController.appendPage(state.movies, nextPageKey);
            setState(() {
              actualPage = nextPageKey;
            });
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Popular Movies App'),
        ),
        body: Container(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(8.0),
          child: PagedListView(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Movie>(
              itemBuilder: (context, movie, index) => Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.primaryFixed,
                ),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(bottom: 8),
                child: MovieListTile(movie: movie),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
