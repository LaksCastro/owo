import 'dart:core';

import 'package:flutter/material.dart';

import 'cards/primeiro_card.dart';
import 'cards/segundo_card.dart';
import 'cards/terceiro_card.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estatística'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.help,
              color: Colors.orange,
              size: 35,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Text('Meu perfil'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
