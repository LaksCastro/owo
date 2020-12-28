import 'package:flutter/services.dart';

import 'package:orientation_helper/src/sensor_event.dart';

class OrientationEvent {
  final int accuracy;
  final SensorEvent sensor;
  final DeviceOrientation deviceOrientation;

  const OrientationEvent({
    this.accuracy,
    this.sensor,
    this.deviceOrientation,
  });

  OrientationEvent copyWith({
    int accuracy,
    SensorEvent sensor,
    DeviceOrientation deviceOrientation,
  }) {
    return OrientationEvent(
      accuracy: accuracy ?? this.accuracy,
      sensor: sensor ?? this.sensor,
      deviceOrientation: deviceOrientation ?? this.deviceOrientation,
    );
  }
}
