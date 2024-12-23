import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_movies/src/core/services/injection_container.dart';
import 'package:popular_movies/src/core/utils/constants.dart';
import 'package:popular_movies/src/presentation/bloc/newest_movies/newest_movies_bloc.dart'
    as newest;
import 'package:popular_movies/src/presentation/bloc/popular_movies/popular_movies_bloc.dart'
    as popular;
import 'package:popular_movies/src/presentation/pages/movies_lazy_list_page.dart';
import 'package:popular_movies/src/presentation/widgets/movies_list.dart';
import 'package:popular_movies/src/presentation/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Popular Movies App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              ThemeNotifier themeNotifier =
                  Provider.of<ThemeNotifier>(context, listen: false);
              if (themeNotifier.themeMode == ThemeMode.light) {
                themeNotifier.setTheme(ThemeMode.dark);
              } else {
                themeNotifier.setTheme(ThemeMode.light);
              }
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Newest Movies',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                              value: getIt<newest.NewestMoviesBloc>(),
                              child: const MoviesLazyList<
                                  newest.NewestMoviesBloc,
                                  newest.NewestMoviesState>(
                                movieType: FetchMovieType.newest,
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'See more',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                BlocBuilder<newest.NewestMoviesBloc, newest.NewestMoviesState>(
                  builder: (context, state) {
                    if (state is newest.MoviesLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is newest.MoviesLoaded) {
                      return MoviesList(movies: state.movies);
                    } else if (state is newest.MoviesError) {
                      return Text(state.message);
                    }
                    return Container();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Movies',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                              value: getIt<popular.PopularMoviesBloc>(),
                              child: const MoviesLazyList<
                                  popular.PopularMoviesBloc,
                                  popular.PopularMoviesState>(
                                movieType: FetchMovieType.popular,
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'See more',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                BlocBuilder<popular.PopularMoviesBloc,
                    popular.PopularMoviesState>(
                  builder: (context, state) {
                    if (state is popular.MoviesLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is popular.MoviesLoaded) {
                      return MoviesList(movies: state.movies);
                    } else if (state is popular.MoviesError) {
                      return Text(state.message);
                    }
                    return Container();
                  },
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
