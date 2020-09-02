import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/src/constants/colors.dart' as prefix0;

/// this is the theme color used to manipulate the app body
ThemeData buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: prefix0.primaryColor,
    accentColor: prefix0.secondary,
    textTheme: buildAppTextTheme(base.textTheme),
    primaryTextTheme: buildAppTextTheme(base.primaryTextTheme),
    accentTextTheme: buildAppTextTheme(base.accentTextTheme),
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: prefix0.primaryColor,
      textTheme: ButtonTextTheme.normal,
    ),
    scaffoldBackgroundColor: prefix0.white100,
    cardColor: prefix0.white100,
    textSelectionColor: prefix0.secondaryDark,
    errorColor: prefix0.warningColor,
  );
}

TextTheme buildAppTextTheme(TextTheme base) {
  return base.apply(
    displayColor: prefix0.black100,
    bodyColor: prefix0.black100,
  );
}
