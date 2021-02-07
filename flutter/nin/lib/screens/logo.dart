import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NinLogo extends StatelessWidget {
  final Color borderColor;
  final Color backgroundColor;
  final Color dotColor;
  final bool reverse;
  final double width;

  const NinLogo({
    this.borderColor,
    this.backgroundColor,
    this.dotColor,
    this.width,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    final height = width * 2;

    final radius = width / 2;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: width / 6,
        ),
        borderRadius: reverse
            ? BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(radius),
                bottomLeft: Radius.circular(2),
                bottomRight: Radius.circular(radius),
              )
            : BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(2),
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(2),
              ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: reverse ? width / 2 : width / 4,
        horizontal: 5,
      ),
      child: Align(
        alignment: reverse ? Alignment.bottomCenter : Alignment.topCenter,
        child: Container(
          width: width / 3,
          height: width / 3,
          decoration: BoxDecoration(
            color: dotColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
