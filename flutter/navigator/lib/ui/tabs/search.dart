import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../navigation/app_navigator.dart' as navigator;
import '../../navigation/module_navigator.dart';
import '../../navigation/tab_navigator.dart';
import '../../navigation/transparent_route.dart';
import '../screens/interpolate_colors.dart';

class ColorSelectionController extends ChangeNotifier {
  Color _startColor;
  Color get startColor => _startColor;
  set startColor(Color start) {
    if (start == startColor) return;

    _startColor = start;

    notifyListeners();
  }

  Color _endColor;
  Color get endColor => _endColor;
  set endColor(Color end) {
    if (end == endColor) return;

    _endColor = end;

    notifyListeners();
  }
}

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = ColorSelectionController();

  void _openInterpolateColorsScreen(Color a, Color b) {
    navigator.push(
      ModuleNavigator.search,
      FadeInRoute(
        builder: (_) => InterpolateColors(
          start: a,
          end: b,
          count: 10,
        ),
      ),
    );
  }

  void _onAppBarTapped() {
    final a = _controller.startColor;
    final b = _controller.endColor;

    if (a == null || b == null) return;

    _openInterpolateColorsScreen(a, b);
  }

  static const colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.yellow,
    Colors.purple,
    Colors.black,
    Colors.white,
    Colors.pink,
    Colors.indigo,
    Colors.cyan,
    Colors.brown,
    Colors.amber
  ];

  @override
  Widget build(BuildContext context) {
    return TabNavigator(
      moduleNavigator: ModuleNavigator.search,
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            child: Text('Open interpolation color screen'),
            onTap: _onAppBarTapped,
          ),
          actions: [],
        ),
        body: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  return ListView.builder(
                    itemCount: colors.length,
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () => _controller.startColor = colors[i],
                        child: Container(
                          height: 250,
                          color: colors[i],
                          child: colors[i] == _controller.startColor
                              ? Center(child: Icon(Icons.star_outlined))
                              : null,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  return ListView.builder(
                    itemCount: colors.length,
                    itemBuilder: (_, i) {
                      final current = colors.reversed.toList()[i];

                      return GestureDetector(
                        onTap: () => _controller.endColor = current,
                        child: Container(
                          height: 250,
                          color: current,
                          child: current == _controller.endColor
                              ? Center(child: Icon(Icons.star_outlined))
                              : null,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
