import 'dart:async';

import 'package:flutter/services.dart';

class FlutterSampleCalc {
  static const MethodChannel _channel =
      const MethodChannel('flutter_sample_calc');

  static Future<double> sum(double n1, double n2) async {
    try {
      final total = await _channel.invokeMethod<double>('sum', <String, double>{
        'n1': n1,
        'n2': n2,
      });

      return total;
    } on PlatformException {
      throw 'Unable to sum $n1 + $n2';
    }
  }

  static Future<String> get platformVersion async {
    final version = await _channel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
