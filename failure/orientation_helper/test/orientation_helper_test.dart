import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart' hide EventDispatcher;
import 'package:orientation_helper/orientation_helper.dart';
import 'package:orientation_helper/src/event_dispatcher.dart';

void main() {
  const MethodChannel channel = MethodChannel('orientation_helper');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    final orientationHelper = OrientationHelper(
      dispatchers: [
        EventDispatcher.accuracy,
      ],
    );

    orientationHelper.initialize();

    expect(orientationHelper.accuracy is int, isTrue);
  });
}
