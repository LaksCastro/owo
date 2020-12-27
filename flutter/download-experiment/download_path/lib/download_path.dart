import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class DownloadPath {
  static const MethodChannel _channel = const MethodChannel('download_path');

  static Future<Directory> get directory async {
    return Directory(await path);
  }

  static Future<String> get path async {
    final String downloadPath = await _channel.invokeMethod('getDownloadPath');

    return downloadPath;
  }
}
