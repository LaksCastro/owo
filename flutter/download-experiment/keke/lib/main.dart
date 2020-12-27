import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:download_path/download_path.dart';
import 'package:flutter/material.dart';
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
  final _imageStreamController = StreamController<List<String>>.broadcast();

  static final _dio = Dio(BaseOptions(baseUrl: 'https://nekobot.xyz/api'));

  final c = ScrollController();

  static const _cats = [
    "hass",
    "hmidriff",
    "pgif",
    "4k",
    "hentai",
    "holo",
    "hneko",
    "neko",
    "hkitsune",
    "kemonomimi",
    "anal",
    "hanal",
    "gonewild",
    "kanna",
    "ass",
    "pussy",
    "thigh",
    "hthigh",
    "gah",
    "coffee",
    "food",
    "paizuri",
    "tentacle",
    "boobs",
    "hboobs"
  ];

  var _selectedCat = _cats.last;

  var _fetching = false;
  final List<String> _images = [];

  void _fetchMore() async {
    if (_fetching) {
      return;
    }

    _fetching = true;

    final images = <String>[];

    try {
      for (var i = 0; i < 5; i++) {
        final res = await _dio.get('/image?type=' + _selectedCat);

        images.add(res.data['message']);
      }

      _imageStreamController.add(images);
    } catch (e) {} finally {
      _fetching = false;
    }
  }

  // DOWNLOADASSSSSSSSSS

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

      _imageStreamController.stream.listen((newImages) {
        _images.addAll(newImages);
      });

      c.addListener(() {
        if (c.offset >=
            c.position.maxScrollExtent - MediaQuery.of(context).size.width) {
          _fetchMore();
        }
      });

      _fetchMore();
    } catch (e) {
      print('relaxa, n existe erro se o ele nao aparecer - stonks - ' + e);
    }
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();

    _imageStreamController.close();

    super.dispose();
  }

  void _bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );

    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          height: 60,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              for (final cat in _cats)
                FlatButton(
                  onPressed: () => _selectedCat = cat,
                  child: Text(cat),
                )
            ],
          ),
        ),
      ),
      body: Builder(
        builder: (context) => _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _permissionReady
                ? StreamBuilder(
                    initialData: [],
                    stream: _imageStreamController.stream,
                    builder: (_, __) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: c,
                        itemBuilder: (_, i) {
                          return Keke(
                            imageUrl: _images[i],
                            requestDownload: _requestDownload,
                          );
                        },
                        itemCount: _images.length,
                      );
                    },
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

class Keke extends StatelessWidget {
  final Function requestDownload;
  final String imageUrl;

  const Keke({@required this.imageUrl, @required this.requestDownload});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        requestDownload(
          _TaskInfo(
            link: imageUrl,
            name: imageUrl
                .replaceAll('.', '')
                .replaceAll('/', '')
                .replaceAll('_', '')
                .replaceAll('-', ''),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          alignment: Alignment.center,
          fit: BoxFit.contain,
          placeholder: (_, __) => CircularProgressIndicator(),
          errorWidget: (_, __, ___) => Icon(Icons.error),
        ),
      ),
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
