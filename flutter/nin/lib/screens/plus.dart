import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/colors/colors.dart';

class Plus extends StatelessWidget {
  final bool plus;

  const Plus({
    Key key,
    this.plus = false,
  }) : super(key: key);

  static const _x = 30.0;
  static const _y = 8.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _x,
      height: _x,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            child: Container(
              width: _x,
              height: _y,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: AppColors.bgScreenBottom,
              ),
            ),
          ),
          if (plus)
            Align(
              child: Container(
                width: _y,
                height: _x,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: AppColors.bgScreenBottom,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
