import 'package:flutter/material.dart';
import 'package:zero/constants/app_info.dart';
import 'package:zero/constants/theme.dart';
import 'package:zero/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppInfo.name,
      theme: AppTheme.data(context),
      home: HomeScreen(),
    );
  }
}
