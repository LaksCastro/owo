import "dart:math" as math;

import 'package:flutter/material.dart';

import 'package:zero/constants/utils.dart';

class Spinner extends StatefulWidget {
  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<Point> _points = [];

  Point createPoint(List<double> xInterval, List<double> yInterval) {
    final useRight = Utils.randomDouble(0, 1) == 1;
    final size = Utils.randomDouble(0.004, 0.008);

    return Point(
        x: useRight
            ? xInterval[1]
            : Utils.randomDouble(xInterval[0], xInterval[1]),
        y: useRight
            ? Utils.randomDouble(yInterval[0], yInterval[1])
            : yInterval[1],
        width: size,
        height: size,
        velocity: Utils.randomDouble(0.001, 0.003));
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    )..repeat();

    while (_points.length < 10) {
      _points.add(createPoint([0, 1], [0, 1]));
    }

    _controller.addListener(() {
      setState(() {
        for (int i = 0; i < _points.length; i++) {
          final point = _points[i];

          if ((point.x + point.width < 0) || (point.y + point.height < 0)) {
            _points[i] = createPoint([0, 1], [0, 1]);
          } else {
            _points[i] = point.copyWith(
              x: point.x - point.velocity / 2,
              y: point.y - point.velocity,
            );
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(12, 15, 25, 1),
        body: Column(children: [
          Expanded(
              child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              return CustomPaint(
                  painter: ShapePainter(points: _points), child: Container());
            },
          ))
        ]));
  }
}

class Point {
  final double x;
  final double y;
  final double width;
  final double height;
  final double velocity;

  Point({
    @required this.x,
    @required this.y,
    @required this.width,
    @required this.height,
    @required this.velocity,
  });

  Point copyWith({
    double x,
    double y,
    double width,
    double height,
    double velocity,
  }) {
    return Point(
      x: x ?? this.x,
      y: y ?? this.y,
      width: width ?? this.width,
      height: height ?? this.height,
      velocity: velocity ?? this.velocity,
    );
  }
}

// FOR PAINTING LINES
class ShapePainter extends CustomPainter {
  final List<Point> points;

  ShapePainter({
    @required this.points,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    for (final point in points) {
      path.addRect(Rect.fromPoints(
          Offset(point.x * size.width, point.y * size.height),
          Offset(point.x * size.width + point.width * size.width,
              point.y * size.height + point.height * size.height)));
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
