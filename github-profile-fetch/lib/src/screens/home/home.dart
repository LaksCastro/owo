import 'package:flutter/material.dart';

import 'package:flutter_starter_kit/src/blocs/form/form_bloc.dart';
import 'package:flutter_starter_kit/src/screens/profile/profile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Profile Search'),
        centerTitle: false,
      ),
      body: Center(child: TextField(
        onChanged: (value) {
          bloc.setUsername(value);
        },
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.search),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return ProfileScreen(username: bloc.getUsername());
              },
            ));
          }),
    );
  }
}
