import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_movies/src/core/services/injection_container.dart';
import 'package:popular_movies/src/core/styles/theme.dart';
import 'package:popular_movies/src/presentation/bloc/newest_movies/newest_movies_bloc.dart';
import 'package:popular_movies/src/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:popular_movies/src/presentation/pages/home_page.dart';
import 'package:popular_movies/src/presentation/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load();
  init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder:
          (BuildContext context, ThemeNotifier themeNotifier, Widget? child) {
        return MaterialApp(
          title: 'Popular Movies',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeNotifier.themeMode,
          debugShowCheckedModeBanner: false,
          home: MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) =>
                  getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
            ),
            BlocProvider(
              create: (context) =>
                  getIt<NewestMoviesBloc>()..add(FetchNewestMovies()),
            ),
          ], child: const HomePage()),
        );
      },
    );
  }
}
