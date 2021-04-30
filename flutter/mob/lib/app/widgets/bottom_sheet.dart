import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mob/app/modules/home/home_controller.dart';

class AppTextEditingBottomSheet extends StatefulWidget {
  AppTextEditingBottomSheet({Key key}) : super(key: key);

  @override
  _AppTextEditingBottomSheetState createState() =>
      _AppTextEditingBottomSheetState();
}

class _AppTextEditingBottomSheetState extends State<AppTextEditingBottomSheet> {
  final controller = Modular.get<HomeController>();
  final _textEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop<String>(context, _textEditController.text);

        return false;
      },
      child: BottomSheet(
        onClosing: () {
          print('Fechando');
        },
        builder: (context) {
          return Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Digite o novo nome',
                ),
                onChanged: change,
                onSubmitted: (newName) {
                  controller.changeText(newName);
                },
                controller: _textEditController,
              ),
            ),
          );
        },
      ),
    );
  }

  void change(newName) {
    print(newName);
    controller.changeText(newName);
  }
}
