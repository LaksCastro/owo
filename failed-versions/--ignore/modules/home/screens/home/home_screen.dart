import 'package:anime_dart/app/constants/tabs.dart';
import 'package:anime_dart/app/modules/home/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ModularState<HomeScreen, HomeStore> {
  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: MainTabs.tabs.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Anime Dart",
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
              children: [for (final tab in MainTabs.tabs) tab.builder(context)],
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {}, child: Icon(Icons.search))));
  }
}
