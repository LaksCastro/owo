import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigation/app_navigator.dart' as navigator;
import 'state/app_global_state.dart';
import 'state/app_tab_controller.dart';
import 'ui/layout/app_bottom_bar.dart';
import 'ui/layout/app_drawer.dart';
import 'ui/layout/root.dart';

void main() {
  runApp(App(appTabController: AppTabController()));
}

class App extends StatelessWidget {
  final AppTabController appTabController;

  const App({
    Key key,
    this.appTabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigator.rootNavigator,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AppGlobalState(
        appTabController: appTabController,
        child: Builder(
          builder: (_) => Scaffold(
            bottomNavigationBar: AppBottomBar(),
            drawer: AppDrawer(),
            body: Root(),
          ),
        ),
      ),
    );
  }
}
