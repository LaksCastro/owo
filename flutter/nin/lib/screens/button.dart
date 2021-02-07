import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show LinearGradient, Colors;
import 'package:nintendo_swt/core/colors/colors.dart';

class NinButton extends StatelessWidget {
  const NinButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Stack(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.bigButtonLayer0Top,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.bigButtonLayer2Top,
                  borderRadius: BorderRadius.circular(40),
                ),
                width: 20,
                height: 20,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.9),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
