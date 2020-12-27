import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:download_path/download_path.dart';

void main() {
  const MethodChannel channel = MethodChannel('download_path');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getDownloadPath') {
        return '/data/user';
      }

      throw Exception('Invalid call');
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('directory', () async {
    expect((await DownloadPath.directory) is Directory, isTrue);
  });

  test('path', () async {
    expect((await DownloadPath.path) is String, isTrue);
  });
}
