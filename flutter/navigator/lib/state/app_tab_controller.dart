import 'package:flutter/cupertino.dart';
import '../ui/tabs/app_tab.dart';

class AppTabController extends ChangeNotifier {
  AppTabController();

  var _currentTab = AppTab.home;

  AppTab get currentTab => _currentTab;
  set currentTab(AppTab newAppTab) {
    if (_currentTab == newAppTab) return;

    _currentTab = newAppTab;

    notifyListeners();
  }
}
