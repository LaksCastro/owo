import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:download_path/download_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

const debug = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: debug);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Downloader',
        platform: platform,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget with WidgetsBindingObserver {
  final TargetPlatform platform;

  MyHomePage({Key key, this.title, this.platform}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _imageStreamController = StreamController<String>.broadcast();

  static final _dio = Dio(BaseOptions(baseUrl: 'https://nekobot.xyz/api'));
  static final _random = Random();

  static const _cats = ['hboobs'];
  static final _randomInt = (int min, int max) =>
      ((_random.nextDouble() * (max - min)) + min).toInt();

  final _scrollController = ScrollController();

  var _fetching = false;
  final List<String> _images = [];

  void _scrollListener() {
    final fetchMore = _scrollController.offset >=
        _scrollController.position.maxScrollExtent /
            MediaQuery.of(context).size.height;

    if (fetchMore) {
      _fetchMore();
    }
  }

  String _randomType() {
    return _cats[_randomInt(0, _cats.length - 1)];
  }

  void _fetchMore() async {
    if (_fetching) {
      return;
    }

    _fetching = true;

    for (var i = 0; i < 5; i++) {
      final res =
          await _dio.get('/image?type=' + _randomType(), options: Options());

      _imageStreamController.add(res.data['message']);
    }

    _fetching = false;
  }

  // DOWNLOADASSSSSSSSSS

  List<_TaskInfo> _tasks;
  List<_ItemHolder> _items;
  bool _isLoading;
  bool _permissionReady;
  String _localPath;
  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    try {
      _bindBackgroundIsolate();

      FlutterDownloader.registerCallback(downloadCallback);

      _isLoading = true;
      _permissionReady = false;

      _prepare();

      _imageStreamController.stream.listen((newImage) {
        _images.add(newImage);
      });

      _fetchMore();

      _scrollController.addListener(_scrollListener);
    } catch (e) {
      print('relaxa, n existe erro se o ele nao aparecer - stonks - ' + e);
    }
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();

    _scrollController.dispose();
    _imageStreamController.close();

    super.dispose();
  }

  void _bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) {
      if (debug) {
        print('UI Isolate Callback: $data');
      }
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];

      if (_tasks != null && _tasks.isNotEmpty) {
        final task = _tasks.firstWhere((task) => task.taskId == id);
        if (task != null) {
          setState(() {
            task.status = status;
            task.progress = progress;
          });
        }
      }
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  static void downloadCallback(
    String id,
    DownloadTaskStatus status,
    int progress,
  ) {
    if (debug) {
      print(
          'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    }
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _permissionReady
                ? CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      ListWidget(
                        requestDownload: _requestDownload,
                        stream: _imageStreamController.stream,
                        items: _images,
                      ),
                    ],
                  )
                : _buildNoPermissionWarning(),
      ),
    );
  }

  Widget _buildNoPermissionWarning() => Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Please grant accessing storage permission to continue -_-',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 18.0),
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              FlatButton(
                  onPressed: () {
                    _checkPermission().then((hasGranted) {
                      setState(() {
                        _permissionReady = hasGranted;
                      });
                    });
                  },
                  child: Text(
                    'Retry',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ))
            ],
          ),
        ),
      );

  void _requestDownload(_TaskInfo task) async {
    task.taskId = await FlutterDownloader.enqueue(
      url: task.link,
      headers: {"auth": "test_for_sql_encoding"},
      savedDir: _localPath,
      showNotification: true,
      openFileFromNotification: true,
    );
  }

  void _retryDownload(_TaskInfo task) async {
    String newTaskId = await FlutterDownloader.retry(taskId: task.taskId);
    task.taskId = newTaskId;
  }

  Future<bool> _openDownloadedFile(_TaskInfo task) {
    return FlutterDownloader.open(taskId: task.taskId);
  }

  Future<bool> _checkPermission() async {
    if (widget.platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<Null> _prepare() async {
    final tasks = await FlutterDownloader.loadTasks();

    int count = 0;
    _tasks = [];
    _items = [];

    _items.add(_ItemHolder(name: 'Videos'));
    for (int i = count; i < _tasks.length; i++) {
      _items.add(_ItemHolder(name: _tasks[i].name, task: _tasks[i]));
      count++;
    }

    tasks?.forEach((task) {
      for (_TaskInfo info in _tasks) {
        if (info.link == task.url) {
          info.taskId = task.taskId;
          info.status = task.status;
          info.progress = task.progress;
        }
      }
    });

    _permissionReady = await _checkPermission();

    _localPath = await _getDownloadPath();

    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<String> _getDownloadPath() async {
    return await DownloadPath.path;
  }
}

class ListWidget extends StatelessWidget {
  final List<String> items;
  final Stream<String> stream;
  final Function requestDownload;

  const ListWidget({
    Key key,
    this.items,
    this.stream,
    @required this.requestDownload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: stream,
      builder: (_, __) {
        return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.5,
            crossAxisCount: 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              return GestureDetector(
                onTap: () {
                  requestDownload(
                    _TaskInfo(
                      link: items[i],
                      name: items[i]
                          .replaceAll('.', '')
                          .replaceAll('/', '')
                          .replaceAll('_', '')
                          .replaceAll('-', ''),
                    ),
                  );
                },
                child: Image.network(items[i]),
              );
            },
            childCount: items.length,
          ),
        );
      },
    );
  }
}

class _TaskInfo {
  final String name;
  final String link;

  String taskId;
  int progress = 0;
  DownloadTaskStatus status = DownloadTaskStatus.undefined;

  _TaskInfo({this.name, this.link});
}

class _ItemHolder {
  final String name;
  final _TaskInfo task;

  _ItemHolder({this.name, this.task});
}
