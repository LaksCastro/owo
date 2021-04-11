import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../state/app_global_state.dart';

import '../tabs/app_tab.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({Key key}) : super(key: key);

  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar>
    with AppGlobalStatefulMixin {
  final _tabs = [
    AppTab.home,
    AppTab.search,
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appTabController,
      builder: (context, _) {
        return BottomNavigationBar(
          currentIndex: _tabs.indexOf(appTabController.currentTab),
          onTap: (index) => appTabController.currentTab = _tabs[index],
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
        );
      },
    );
  }
}
