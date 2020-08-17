import 'package:anime_dart/app/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka show builder;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Anime Dart',
      theme: AppTheme.data(context),
      darkTheme: AppDarkTheme.data(context),
      initialRoute: '/',
      builder: asuka.builder,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
