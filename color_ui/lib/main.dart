import 'package:color_ui/app_bar.dart';
import 'package:color_ui/bottom_navigation.dart';
import 'package:color_ui/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  ThemeData get _appTheme {
    final layoutBackground = Color(0xFF1F2835);
    final unselectedIconColor = Color(0xFF67778E);
    final selectedIconColor = Color(0xFF45D1E9);

    final defaultTheme = ThemeData.dark();

    final fontFamily = 'Josefin Sans';

    return ThemeData(
      fontFamily: fontFamily,
      brightness: Brightness.dark,
    ).copyWith(
      cardColor: Color(0xFF171D25),
      scaffoldBackgroundColor: Color(0xFF0D1014), // Scaffold background color.
      appBarTheme: AppBarTheme(
        backgroundColor: layoutBackground, // AppBar background color
        centerTitle: true,
        iconTheme: IconThemeData(color: unselectedIconColor),
      ),
      textTheme: defaultTheme.textTheme.apply(fontFamily: fontFamily),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: layoutBackground,
        selectedItemColor: selectedIconColor,
        unselectedItemColor: unselectedIconColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _appTheme,
      debugShowCheckedModeBanner: false,
      builder: (_, child) {
        return ColorFiltered(
          colorFilter: ColorFilter.mode(
            // Color(0xFFff0000),
            Colors.yellow,
            BlendMode.hue,
          ),
          child: child,
        );
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar(),
      body: Center(child: HomePage()),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
