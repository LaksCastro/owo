import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../navigation/module_navigator.dart';
import '../../navigation/tab_navigator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return TabNavigator(
      moduleNavigator: ModuleNavigator.home,
      child: Center(child: Text('Home Screen')),
    );
  }
}
