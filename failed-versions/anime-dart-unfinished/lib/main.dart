import 'package:anime_dart/screens/search.dart';
import 'package:flutter/material.dart';

import "package:anime_dart/get_it.dart";

import 'package:anime_dart/constants/tabs.dart';

import 'package:anime_dart/store/barrel.dart';

import 'package:anime_dart/theme/main.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(AnimeDartApp());
  setup();
}

class AnimeDartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Dart',
      theme: AppTheme.data(context),
      darkTheme: AppDarkTheme.data(context),
      home: DefaultTabController(
          length: MainTabs.tabs.length, child: MyHomePage(title: 'Anime Dart')),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title,
              style: TextStyle(
                  color: Theme.of(context)
                      .primaryTextTheme
                      .bodyText1
                      .color
                      .withOpacity(.60))),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorColor: Colors.white,
            isScrollable: true,
            tabs: [
              for (final tab in MainTabs.tabs)
                Container(
                    alignment: Alignment.center,
                    width: 100,
                    child: Tab(text: tab.label))
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (final tab in MainTabs.tabs) tab.builder(context),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Search()));
            },
            child: Icon(Icons.search)));
  }
}
