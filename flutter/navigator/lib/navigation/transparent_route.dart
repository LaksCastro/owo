import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FadeInRoute<T extends Object> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  FadeInRoute({
    @required this.builder,
    RouteSettings settings,
  })  : assert(builder != null),
        super(
          settings: settings,
          fullscreenDialog: false,
          pageBuilder: (context, animation1, animation2) => builder(context),
          transitionsBuilder: (context, animation1, animation2, child) {
            return FadeTransition(
              opacity: animation1,
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 150),
        );
}
