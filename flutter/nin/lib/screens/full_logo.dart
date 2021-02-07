import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:nintendo_swt/screens/logo.dart';

class FullLogo extends StatelessWidget {
  final Color mainColor;
  final Color backgroundColor;
  final double width;

  const FullLogo({
    Key key,
    this.mainColor,
    this.backgroundColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        NinLogo(
          backgroundColor: backgroundColor,
          borderColor: mainColor,
          dotColor: mainColor,
          width: width / 2,
        ),
        Container(width: width / 2 / 6),
        NinLogo(
          reverse: true,
          backgroundColor: mainColor,
          borderColor: mainColor,
          dotColor: backgroundColor,
          width: width / 2,
        ),
      ],
    );
  }
}
