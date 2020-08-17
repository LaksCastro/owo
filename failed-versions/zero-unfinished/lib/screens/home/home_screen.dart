import 'dart:io';

import 'package:diacritic/diacritic.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zero/constants/utils.dart';
import 'package:zero/models/img.dart';
import 'package:zero/services/imgs/data_source_wrapper.dart';
import 'package:zero/services/imgs/providers/neko_bot.dart';
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final d = DataSource(dataSource: NekoBotDataSource(dio: Dio()));
  final imgs = <Img>[];

  bool downloading = false;
  String progress = '0';
  bool isDownloaded = false;

  Future<void> _loadImgs() async {
    final results = await d.getRandomImgs();

    setState(() {
      imgs.addAll(results);
    });
  }

  Future<String> _getFilePath(String url) async {
    Directory dir = await getExternalStorageDirectory();

    String fileName = removeDiacritics(url
        .replaceAll("http", "")
        .replaceAll("/", "")
        .replaceAll("\\", "")
        .replaceAll(":", ""));

    final path = '${dir.path}/$fileName';

    return path;
  }

  Future<void> _downloadFile(String url) async {
    String filePath = await _getFilePath(url);

    if (!(await Utils.downloadFile(url, filePath))) {
      print("ops deu ruim");
    }
  }

  @override
  void initState() {
    super.initState();

    _loadImgs();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView.builder(
                itemCount: imgs.length,
                itemBuilder: (_, i) {
                  return GestureDetector(
                      onTap: () {
                        _downloadFile(imgs[i].url);
                      },
                      child: Center(
                          child: Image.network(imgs[i].url, width: 300)));
                })));
  }
}
