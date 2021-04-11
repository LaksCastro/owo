import 'package:flutter/cupertino.dart';
import 'module_navigator.dart';

final homeNavigator = GlobalKey<NavigatorState>(debugLabel: 'Home Navigator');
final libraryNavigator =
    GlobalKey<NavigatorState>(debugLabel: 'Library Navigator');
final streamNavigator =
    GlobalKey<NavigatorState>(debugLabel: 'Stream Navigator');
final searchNavigator =
    GlobalKey<NavigatorState>(debugLabel: 'Search Navigator');
final rootNavigator = GlobalKey<NavigatorState>(debugLabel: 'Root Navigator');

final Map<ModuleNavigator, GlobalKey<NavigatorState>> navigators = {
  ModuleNavigator.home: homeNavigator,
  ModuleNavigator.library: libraryNavigator,
  ModuleNavigator.root: rootNavigator,
  ModuleNavigator.search: searchNavigator,
  ModuleNavigator.stream: streamNavigator,
};

NavigatorState navigatorOf(ModuleNavigator moduleNavigator) {
  final target = navigators[moduleNavigator];

  return target.currentState;
}

Future<T> push<T extends Object>(
    ModuleNavigator moduleNavigator, Route<T> route) {
  final navigator = navigatorOf(moduleNavigator);

  return navigator.push(route);
}

void pop<T extends Object>(ModuleNavigator moduleNavigator, [T result]) {
  final navigator = navigatorOf(moduleNavigator);

  return navigator.pop(result);
}

bool canPop(ModuleNavigator moduleNavigator) {
  final navigator = navigatorOf(moduleNavigator);

  return navigator.canPop();
}

Future<T> pushReplacement<T extends Object>(
    ModuleNavigator moduleNavigator, Route<T> route) {
  final navigator = navigatorOf(moduleNavigator);

  return navigator.pushReplacement(route);
}
