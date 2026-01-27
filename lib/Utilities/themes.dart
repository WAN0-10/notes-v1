import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(surface: Colors.deepPurple),
  appBarTheme: AppBarTheme(backgroundColor: Colors.yellow),
  scaffoldBackgroundColor: Colors.blueGrey,
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(surface: Colors.black),
  appBarTheme: AppBarTheme(backgroundColor: Colors.orangeAccent),
  scaffoldBackgroundColor: Colors.grey,
);
