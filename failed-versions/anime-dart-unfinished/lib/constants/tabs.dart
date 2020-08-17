import 'package:flutter/material.dart';

import 'package:anime_dart/screens/latest.dart';

class MainTabs {
  static final tabs = [
    TabData(builder: (_) => Latest(), label: "LANÇAMENTOS"),
    TabData(
        builder: (_) => Center(child: Text("FAVRITOS")), label: "FAVORITOS"),
    TabData(
        builder: (_) => Center(child: Text("FAVORITOS")), label: "ASSISTIDOS"),
    TabData(
        builder: (_) => Center(child: Text("FAVORITOS")), label: "ENCONTRAR"),
  ];
}

class TabData {
  final Widget Function(BuildContext) builder;
  final String label;

  TabData({@required this.label, @required this.builder});
}
