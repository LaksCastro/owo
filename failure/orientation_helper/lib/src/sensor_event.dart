class SensorEvent {
  final int accuracy;
  final int timestamp;
  final List<double> values;

  const SensorEvent({
    this.accuracy,
    this.timestamp,
    this.values,
  });

  SensorEvent copyWith({
    int accuracy,
    int timestamp,
    List<double> values,
  }) {
    return SensorEvent(
      accuracy: accuracy ?? this.accuracy,
      timestamp: timestamp ?? this.timestamp,
      values: values ?? this.values,
    );
  }
}
