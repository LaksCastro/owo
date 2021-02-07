import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nintendo_swt/screens/bar.dart';
import 'package:nintendo_swt/screens/button.dart';
import 'package:nintendo_swt/screens/dot.dart';
import 'package:nintendo_swt/screens/full_logo.dart';
import 'package:nintendo_swt/screens/logo.dart';
import 'package:nintendo_swt/screens/plus.dart';

import '../core/colors/colors.dart';
import '../core/colors/colors.dart';
import '../core/colors/colors.dart';

class NintendoScreen extends StatefulWidget {
  @override
  _NintendoScreenState createState() => _NintendoScreenState();
}

class _NintendoScreenState extends State<NintendoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              flex: 15,
              child: Container(
                color: AppColors.bgScreenBottom,
                padding: EdgeInsets.all(20),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.screen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FullLogo(
                    width: 120.0,
                    backgroundColor: AppColors.screen,
                    mainColor: AppColors.bigLogo,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                color: AppColors.bgScreenBottom,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                          ),
                          color: AppColors.leftSide,
                        ),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.all(15),
                              child: Plus(),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.all(15),
                              child: NinButton(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: AppColors.bgScreenBottom,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: (30 * 2).toDouble(),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 5,
                                margin: EdgeInsets.only(right: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (var i = 0; i < 4; i++)
                                      Dot(
                                        color: i == 0
                                            ? AppColors.lampOn
                                            : AppColors.lampOff,
                                      ),
                                  ],
                                ),
                              ),
                              FullLogo(
                                width: 60.0,
                                backgroundColor: AppColors.bgScreenBottom,
                                mainColor: AppColors.smallLogo,
                              ),
                              Container(
                                width: 5,
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (var i = 0; i < 4; i++)
                                      Dot(color: AppColors.lampOff),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                          ),
                          color: AppColors.rightSide,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
