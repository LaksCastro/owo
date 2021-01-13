import 'package:bloc_example/blocs/bloc/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Bloc Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _colorBloc = ColorBloc();

  @override
  void initState() {
    super.initState();

    _colorBloc.add(LoadColor());

    _colorBloc.listen((state) {
      if (state is ColorLoaded) {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return BottomSheet(
              onClosing: () {
                print('Fechou o modal');
              },
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(30),
                  child: Text('Eae Bro'),
                );
              },
            );
          },
        );
      }
    });
  }

  @override
  void dispose() {
    _colorBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<ColorBloc, ColorState>(
              cubit: _colorBloc,
              builder: (context, state) {
                Color color;
                String text;

                if (state is ColorLoading || state is ColorInitial) {
                  color = Colors.grey;
                  text = 'Carregando cor';
                }

                if (state is ColorLoaded) {
                  color = state.color;
                  text = 'Cor carregada com sucesso';
                }

                return Container(
                  color: color,
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text(text),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_colorBloc.state is ColorLoaded) _colorBloc.add(LoadColor());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
