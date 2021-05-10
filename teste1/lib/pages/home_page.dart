import 'package:flutter/material.dart';

import 'data_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira página'),
        centerTitle: true,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DataPage(),
          ),
        );
      }),
    );
  }
}
