import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mob/app/widgets/bottom_sheet.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Observer(builder: (_) {
                return Text(
                  controller.currentText?.isEmpty ?? true
                      ? 'Texto vazio'
                      : controller.currentText,
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingButton(),
    );
  }
}

class FloatingButton extends StatelessWidget {
  FloatingButton({Key key}) : super(key: key);

  HomeController get controller => Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Icon(Icons.edit),
      label: Text('Editar nome'),
      onPressed: () {
        _showBottomSheet(context);
      },
    );
  }

  Future<void> _showBottomSheet(BuildContext context) async {
    final newName = await showModalBottomSheet<String>(
      context: context,
      builder: (context) {
        return AppTextEditingBottomSheet();
      },
    );

    print(newName);

    controller.changeText(newName);
  }
}
