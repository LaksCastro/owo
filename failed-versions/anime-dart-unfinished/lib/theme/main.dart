import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData data(BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(235, 235, 245, 1),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: "Raleway",
        accentColor: Color.fromRGBO(150, 150, 230, 1),
        primaryColor: Color.fromRGBO(100, 100, 180, 1),
        colorScheme: ThemeData.light().colorScheme.copyWith(
            secondary: Color.fromRGBO(150, 150, 230, 1),
            secondaryVariant: Color.fromRGBO(170, 170, 250, 1),
            onSecondary: Colors.white),
        textTheme: Theme.of(context).textTheme.apply(
            fontFamily: "Raleway",
            bodyColor: Color.fromRGBO(100, 100, 150, 1)));
  }
}

class AppDarkTheme {
  static ThemeData data(BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(10, 10, 20, 1),
        backgroundColor: Color.fromRGBO(20, 20, 30, 1),
        primaryColor: Color.fromRGBO(40, 40, 60, 1),
        fontFamily: "Raleway",
        accentColor: Color.fromRGBO(150, 150, 230, 1),
        colorScheme: ThemeData.dark().colorScheme.copyWith(
            secondary: Color.fromRGBO(40, 40, 60, 1),
            secondaryVariant: Color.fromRGBO(60, 60, 80, 1),
            onSecondary: Colors.white),
        textTheme: Theme.of(context).textTheme.apply(
            fontFamily: "Raleway",
            bodyColor: Color.fromRGBO(200, 200, 250, 1)));
  }
}
