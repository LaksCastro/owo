import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_sample_calc/flutter_sample_calc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _platformVersion = 'Unknown';
  double _total;

  final _n1Controller = TextEditingController();
  final _n2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterSampleCalc.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> _sum() async {
    double total;

    final n1 = (() {
      try {
        return double.parse(_n1Controller.text);
      } catch (e) {
        return null;
      }
    })();
    final n2 = (() {
      try {
        return double.parse(_n2Controller.text);
      } catch (e) {
        return null;
      }
    })();

    if (n1 == null || n2 == null) {
      return;
    }

    try {
      total = await FlutterSampleCalc.sum(n1, n2);
    } on PlatformException catch (e) {
      print(e);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _total = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Running on: $_platformVersion\n'),
                Container(
                  padding: EdgeInsets.only(bottom: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Primeiro número',
                    ),
                    onChanged: (_) => _sum(),
                    controller: _n1Controller,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Segundo número',
                    ),
                    onChanged: (_) => _sum(),
                    controller: _n2Controller,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                    _total == null ? 'Sem resultado' : _total.toString(),
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
