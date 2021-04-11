import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InterpolateColors extends StatelessWidget {
  final Color start;
  final Color end;
  final int count;

  const InterpolateColors({
    Key key,
    @required this.start,
    @required this.end,
    this.count = 100,
  }) : super(key: key);

  static const _tileSize = Size.fromHeight(75);

  Color tween(double t) => Color.lerp(start, end, t);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => Divider(),
      itemCount: count,
      itemBuilder: (_, i) {
        return Container(
          color: tween((i + 1) / count),
          height: _tileSize.height,
        );
      },
    );
  }
}
