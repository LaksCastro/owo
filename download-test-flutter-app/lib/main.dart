import 'dart:io';
import 'dart:math' show Random;
import 'package:dio/dio.dart';
import 'package:file_utils/file_utils.dart';
// import 'package:file_utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:storage_path/storage_path.dart';
import 'package:ext_storage/ext_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Downloader(),
    );
  }
}

class Downloader extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "File Downloader",
        debugShowCheckedModeBanner: false,
        home: FileDownloader(),
        theme: ThemeData(primarySwatch: Colors.blue),
      );
}

class FileDownloader extends StatefulWidget {
  @override
  _FileDownloaderState createState() => _FileDownloaderState();
}

class _FileDownloaderState extends State<FileDownloader> {
  static const MethodChannel _channel = const MethodChannel("app");

  final imgUrl = "https://images6.alphacoders.com/683/thumb-1920-683023.jpg";
  bool downloading = false;
  var progress = "";
  var dirloc;
  var t;

  static final Random random = Random();
  Directory externalDir;

  @override
  void initState() {
    super.initState();
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();

    final status = await Permission.storage.status;

    if (status.isUndetermined) {
      await Permission.storage.request();

      if (!(await Permission.storage.status.isDenied)) {
        print("pq vc recusou po");
        return;
      }
    }

    if (status.isGranted) {
      // String dirloc = "";

      // var randid = random.nextInt(10000);

      // var path = await ExtStorage.getExternalStoragePublicDirectory(
      //     ExtStorage.DIRECTORY_DOWNLOADS);

      // dirloc = path + "/" + randid.toString() + ".jpg";

      try {
        // await dio.download(imgUrl, dirloc,
        //     onReceiveProgress: (receivedBytes, totalBytes) {
        //   setState(() {
        //     downloading = true;
        //     progress =
        //         ((receivedBytes / totalBytes) * 100).toStringAsFixed(0) + "%";
        //   });
        // });
        GallerySaver.saveImage(imgUrl, albumName: "Test App");
      } catch (e) {
        print(e);
      }

      setState(() {
        downloading = false;
        progress = "Download Completed.";
        t = dirloc;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('File Downloader'),
      ),
      body: Center(
          child: downloading
              ? Container(
                  height: 120.0,
                  width: 200.0,
                  child: Card(
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Downloading File: $progress',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(t ?? "bora"),
                    MaterialButton(
                      child: Text('Request Permission Again.'),
                      onPressed: downloadFile,
                      disabledColor: Colors.blueGrey,
                      color: Colors.pink,
                      textColor: Colors.white,
                      height: 40.0,
                      minWidth: 100.0,
                    ),
                  ],
                )));
}
