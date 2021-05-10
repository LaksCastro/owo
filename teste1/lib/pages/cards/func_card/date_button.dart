import 'package:flutter/material.dart';

class DateButton extends StatefulWidget {
  const DateButton({
    Key key,
  }) : super(key: key);
  @override
  _DateButtonState createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  Color textColor2;
  Color containerColor2;
  bool selected = true;
  Color textColor;
  Color containerColor;

  @override
  void initState() {
    textColor = Colors.white;
    containerColor = Colors.orange;
    textColor2 = Colors.orange;
    containerColor2 = Colors.white;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 30,
            width: 160,
            child: Center(
              child: TextButton(
                onPressed: () {
                  if (selected == false) {
                    setState(() {
                      textColor = Colors.white;
                      containerColor = Colors.orange;
                      selected = !selected;
                      textColor2 = Colors.orange;
                      containerColor2 = Colors.white;
                    });
                  }
                },
                child: Text(
                  'Últimos 7 dias',
                  style: TextStyle(color: textColor),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: containerColor2,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 30,
            width: 160,
            child: Center(
              child: TextButton(
                onPressed: () {
                  if (selected == true) {
                    setState(() {
                      textColor = Colors.orange;
                      containerColor = Colors.white;
                      selected = !selected;
                      textColor2 = Colors.white;
                      containerColor2 = Colors.orange;
                    });
                  }
                },
                child: Text(
                  'Últimos 30 dias',
                  style: TextStyle(color: textColor2),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
