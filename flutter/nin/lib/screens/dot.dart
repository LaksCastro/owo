import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:nintendo_swt/core/colors/colors.dart';

class Dot extends StatelessWidget {
  final Color color;

  const Dot({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 5,
      height: 5,
    );
  }
}
