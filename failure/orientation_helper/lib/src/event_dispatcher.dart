enum EventDispatcher {
  orientation,
  sensor,
  accuracy,
}

extension EventDispatcherUtils on EventDispatcher {
  EventDispatcher fromString(String target) {
    final map = <String, EventDispatcher>{
      'ORIENTATION': EventDispatcher.orientation,
      'SENSOR': EventDispatcher.sensor,
      'ACCURACY': EventDispatcher.accuracy,
    };

    return map[target];
  }
}
