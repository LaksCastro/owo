import 'package:flutter/cupertino.dart';
import 'app_tab_controller.dart';

class AppGlobalState extends InheritedWidget {
  final Widget child;
  final AppTabController appTabController;

  const AppGlobalState({
    Key key,
    this.child,
    this.appTabController,
  }) : super(key: key, child: child);

  static AppGlobalState of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<AppGlobalState>();

  @override
  bool updateShouldNotify(AppGlobalState oldWidget) => false;
}

mixin AppGlobalStatefulMixin<T extends StatefulWidget> on State<T> {
  AppTabController _iAppTabController;
  AppTabController get appTabController =>
      _iAppTabController ??= AppGlobalState.of(context).appTabController;
}

mixin AppGlobalStatelessMixin on StatelessWidget {
  AppTabController appTabController(BuildContext context) =>
      AppGlobalState.of(context).appTabController;
}
