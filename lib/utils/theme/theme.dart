import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  hintColor: Colors.orange,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    bodyLarge: const TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.grey[600]),
    headlineLarge: const TextStyle(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
    headlineMedium: const TextStyle(color: Colors.black, fontSize: 20),
  ),
  appBarTheme: AppBarTheme(
    color: Colors.blue,
    toolbarTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 20),
    ).bodyMedium,
    titleTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 20),
    ).titleLarge,
  ),
  indicatorColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  )),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.teal,
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextTheme(
    bodyLarge: const TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.grey[300]),
    displayLarge: const TextStyle(
        color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
    titleLarge: const TextStyle(color: Colors.white, fontSize: 20),
  ),
  appBarTheme: AppBarTheme(
    color: Colors.teal,
    toolbarTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 20),
    ).bodyMedium,
    titleTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 20),
    ).titleLarge,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.teal,
    textTheme: ButtonTextTheme.accent,
  ),
  indicatorColor: Colors.black,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  )),
);
