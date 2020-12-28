import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:orientation_helper/src/event_dispatcher.dart';
import 'package:orientation_helper/src/orientation_event.dart';
import 'package:orientation_helper/src/sensor_event.dart';

typedef OrientationListener = void Function(OrientationEvent);

class OrientationHelper extends ValueNotifier<OrientationEvent> {
  static const EventChannel _sensorEventChannel =
      const EventChannel('orientation_helper/sensor_events');

  final List<EventDispatcher> dispatchers;

  OrientationHelper({@required this.dispatchers}) : super(null);

  StreamController<Object> _sensorStreamController;
  var _instanceWasInitialized = false;

  DeviceOrientation get deviceOrientation => value.deviceOrientation;

  SensorEvent get sensor => value.sensor;

  int get accuracy => value.accuracy;

  void initialize() {
    _sensorStreamController = StreamController<Object>()
      ..addStream(_sensorEventChannel.receiveBroadcastStream())
      ..stream.listen(_onEventReceived);

    _instanceWasInitialized = true;
  }

  void _onEventReceived(Object event) {}

  @override
  void addListener(void Function() listener) {
    assert(_instanceWasInitialized,
        "You must call .initialize() method before add a listener!");

    super.addListener(listener);
  }

  @override
  void dispose() {
    _sensorStreamController.close();

    super.dispose();
  }
}
