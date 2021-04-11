import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_navigator.dart' as navigator;
import 'module_navigator.dart';

class TabNavigator extends StatelessWidget {
  final Widget child;
  final ModuleNavigator moduleNavigator;

  const TabNavigator({
    Key key,
    @required this.child,
    @required this.moduleNavigator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Navigator(
        key: navigator.navigators[moduleNavigator],
        onGenerateInitialRoutes: (_, __) => [
          MaterialPageRoute(builder: (_) => child),
        ],
      ),
      onWillPop: () async {
        final canPop = navigator.canPop(moduleNavigator);

        if (canPop) {
          navigator.pop(moduleNavigator);
        } else {
          return true;
        }

        return false;
      },
    );
  }
}
