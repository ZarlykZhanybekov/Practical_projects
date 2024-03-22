import 'package:flutter/material.dart';

const primaryColor = Color(0xFFF82B10);

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(color: Colors.black),
  primaryColor: primaryColor,
  scaffoldBackgroundColor: const Color.fromARGB(255, 32, 30, 30),
  textTheme: textTheme,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
  ),
);

final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: Colors.white,
    ),
    primaryColor: primaryColor,
    textTheme: textTheme,
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFEFF1F3),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ));

const textTheme = TextTheme(
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  headlineLarge: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
);
