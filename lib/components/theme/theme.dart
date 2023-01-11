import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff2b5579);
const ksecondryColor = Color(0xff3c709d);
const kAccentColor = Color(0xfff2f9fe);
const kBackground = Color(0xffe9eff2);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: kBackground,
  appBarTheme: const AppBarTheme(
    backgroundColor: kBackground,
    titleTextStyle: TextStyle(
      color: Colors.white,
    ),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    background: kBackground,
    onBackground: kBackground,
    primary: kPrimaryColor,
    onPrimary: kPrimaryColor,
    secondary: ksecondryColor,
    onSecondary: ksecondryColor,
    surface: kAccentColor,
    onSurface: kAccentColor,
    error: Colors.redAccent,
    onError: Colors.redAccent,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      color: Colors.black,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[600],
    border: InputBorder.none,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.grey,
    titleTextStyle: TextStyle(
      color: Colors.black,
    ),
  ),
  colorScheme: const ColorScheme(
    background: Colors.black,
    brightness: Brightness.dark,
    error: Colors.redAccent,
    onBackground: Colors.grey,
    onError: Colors.redAccent,
    onPrimary: Colors.grey,
    onSecondary: Colors.grey,
    onSurface: Colors.grey,
    primary: Colors.grey,
    secondary: Colors.grey,
    surface: Colors.grey,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey,
    border: InputBorder.none,
  ),
);
