import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_palette_example/ui/tabs/app_tab.dart';

import '../../state/app_global_state.dart';
import '../tabs/home.dart';
import '../tabs/search.dart';

class Root extends StatelessWidget with AppGlobalStatelessMixin {
  const Root({Key key}) : super(key: key);

  static final _tabs = {
    AppTab.home: HomeScreen(),
    AppTab.search: SearchScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: appTabController(context),
        builder: (context, _) {
          return Stack(
            children: [
              _buildTabScreen(context, AppTab.home),
              _buildTabScreen(context, AppTab.search),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTabScreen(BuildContext context, AppTab tab) {
    return Offstage(
      offstage: appTabController(context).currentTab != tab,
      child: _tabs[tab],
    );
  }
}
