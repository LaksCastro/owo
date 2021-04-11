import 'package:flutter/cupertino.dart';

class SearchTextInput extends StatefulWidget {
  SearchTextInput({Key key}) : super(key: key);

  @override
  _SearchTextInputState createState() => _SearchTextInputState();
}

class _SearchTextInputState extends State<SearchTextInput> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Text Input'),
    );
  }
}
