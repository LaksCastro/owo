import 'package:anime_dart/app/app_widget.dart';
import 'package:anime_dart/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router("/", module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
