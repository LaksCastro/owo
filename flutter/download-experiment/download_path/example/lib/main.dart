import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:download_path/download_path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _path = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _getDownloadPath() async {
    String path;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      path = await DownloadPath.path;
    } on PlatformException {
      path = 'Failed to get download path.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _path = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Get Download Path Example App'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text('Download Path: $_path\n'),
                ),
                RaisedButton(
                  onPressed: () => _getDownloadPath(),
                  child: Text(
                    'Check the download path',
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
