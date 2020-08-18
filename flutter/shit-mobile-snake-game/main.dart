import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zero/constants/utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController _controller;
  final state = GameState();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat();

    _controller.addListener(() {
      setState(() {
        state.moveSnake(Size(411, 911));
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
    // return Material(child: Center(child: Text("Ok")));
    return Scaffold(
        body: Column(children: [
      Expanded(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, snapshot) {
            return SwipeDetector(
                sensitivity: 0,
                onSwipeDown: () {
                  setState(() {
                    state.setDirection(SnakeDirection.down);
                  });
                },
                onSwipeUp: () {
                  setState(() {
                    state.setDirection(SnakeDirection.up);
                  });
                },
                onSwipeLeft: () {
                  setState(() {
                    state.setDirection(SnakeDirection.left);
                  });
                },
                onSwipeRight: () {
                  setState(() {
                    state.setDirection(SnakeDirection.right);
                  });
                },
                child: CustomPaint(
                  painter: SnakeGame(state: state),
                  child: Container(),
                ));
          },
        ),
      ),
    ]));
  }
}

class SwipeDetector extends StatelessWidget {
  final double sensitivity;
  final Function() onSwipeLeft;
  final Function() onSwipeRight;
  final Function() onSwipeUp;
  final Function() onSwipeDown;
  final Widget child;

  const SwipeDetector({
    Key key,
    this.sensitivity,
    this.onSwipeLeft,
    this.onSwipeRight,
    this.onSwipeUp,
    this.onSwipeDown,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > sensitivity) {
            return onSwipeRight();
          }

          if (details.delta.dx < -sensitivity) {
            return onSwipeLeft();
          }
        },
        onVerticalDragUpdate: (details) {
          if (details.delta.dy > sensitivity) {
            return onSwipeDown();
          }

          if (details.delta.dy < -sensitivity) {
            return onSwipeUp();
          }
        },
        child: child);
  }
}

enum SnakeDirection { up, down, left, right }

class GameState {
  final snake = <Point>[Point(size: 25, x: 100, y: 100)];
  final generateFood = (Size size) => Point(
        size: 25,
        x: Utils.randomDouble(0, size.width - 25),
        y: Utils.randomDouble(0, size.height - 25),
      );
  Point food;

  SnakeDirection direction = SnakeDirection.down;

  final GameConstants constants = GameConstants(velocity: 10);

  void moveSnake(Size size) {
    final roundDirection = direction;

    for (int i = 0; i < snake.length; i++) {
      if (i == 0) {
        final aux = snake[i];

        final useX = roundDirection == SnakeDirection.left ||
            roundDirection == SnakeDirection.right;

        final useMinus = roundDirection == SnakeDirection.up ||
            roundDirection == SnakeDirection.left;

        final newN = useX
            ? useMinus
                ? (aux.x - constants.velocity / 10 < 0
                    ? size.width + aux.size
                    : aux.x - constants.velocity / 2)
                : (aux.x + constants.velocity / 10 > size.width
                    ? 0.0 - aux.size
                    : aux.x + constants.velocity / 2)
            : useMinus
                ? (aux.y - constants.velocity / 10 < 0
                    ? size.height + aux.size
                    : aux.y - constants.velocity / 2)
                : (aux.y + constants.velocity / 10 > size.height
                    ? 0.0 - aux.size
                    : aux.y + constants.velocity / 2);

        snake[i] = useX ? aux.copyWith(x: newN) : aux.copyWith(y: newN);
      } else {
        if (direction == SnakeDirection.down) {
          snake[i] =
              snake[i - 1].copyWith(y: snake[i - 1].y - snake[i - 1].size);
        }
        if (direction == SnakeDirection.right) {
          snake[i] =
              snake[i - 1].copyWith(x: snake[i - 1].x - snake[i - 1].size);
        }
      }

      if (food == null) {
        changeFood(size);
      }

      if (detectedFoodCollision()) {
        changeFood(size);
        eat();
      }
    }
  }

  void eat() {
    if (direction == SnakeDirection.down) {
      snake.add(snake.last.copyWith(y: snake.last.y - snake.last.size));
    }
  }

  bool detectedFoodCollision() {
    final heap = snake.first;

    final sameX = (heap.x >= food.x && heap.x <= food.x + food.size) ||
        (heap.x + heap.size >= food.x &&
            heap.x + heap.size <= food.x + food.size);
    final sameY = (heap.y >= food.y && heap.y <= food.y + food.size) ||
        (heap.y + heap.size >= food.y &&
            heap.y + heap.size <= food.y + food.size);

    return sameX && sameY;
  }

  void changeFood(Size size) {
    food = generateFood(size);
  }

  void setDirection(SnakeDirection newDirection) {
    if (newDirection == direction) {
      return;
    }

    direction = newDirection;
  }
}

class GameConstants {
  final velocity;

  GameConstants({@required this.velocity});
}

class Point {
  final double x;
  final double y;
  final double size;

  Point({
    this.x,
    this.y,
    this.size,
  });

  Point copyWith({
    double x,
    double y,
    double size,
  }) {
    return Point(
      x: x ?? this.x,
      y: y ?? this.y,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'x': x,
      'y': y,
      'size': size,
    };
  }

  factory Point.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Point(
      x: map['x'],
      y: map['y'],
      size: map['size'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Point.fromJson(String source) => Point.fromMap(json.decode(source));

  @override
  String toString() => 'Point(x: $x, y: $y, size: $size)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Point && o.x == x && o.y == y && o.size == size;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode ^ size.hashCode;
}

class SnakeGame extends CustomPainter {
  final GameState state;

  SnakeGame({
    this.state,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint;

    Path path;

    for (final snakePart in state.snake) {
      path = Path();
      paint = Paint()
        ..color = Colors.green[300]
        ..strokeWidth = 0
        ..style = PaintingStyle.fill;

      path.addRect(Rect.fromPoints(Offset(snakePart.x, snakePart.y),
          Offset(snakePart.x + snakePart.size, snakePart.y + snakePart.size)));

      canvas.drawPath(path, paint);
    }

    if (state.food != null) {
      path = Path();
      paint = Paint()
        ..color = Colors.blue[300]
        ..strokeWidth = 0
        ..style = PaintingStyle.fill;

      final food = state.food;

      path.addRect(Rect.fromPoints(Offset(food.x, food.y),
          Offset(food.x + food.size, food.y + food.size)));

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
