import 'package:flutter/cupertino.dart';

import '../core/colors/colors.dart';

class Bar extends StatelessWidget {
  const Bar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: AppColors.bgScreenBottom,
      ),
    );
  }
}
