import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.grey[100],
  colorScheme: ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.blueAccent,
    primaryFixed: Colors.grey[200],
  ),
  // textTheme: TextTheme(

  //   bodyText1: TextStyle(color: Colors.white),
  //   headline1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //   // ... other text styles
  // ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey[900],
  colorScheme: ColorScheme.dark(
    primary: Colors.grey[900]!,
    secondary: Colors.blueAccent,
    primaryFixed: Colors.grey[800],
  ),
);
