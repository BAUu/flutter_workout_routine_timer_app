// stopwatch_service.dart
import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchService extends ChangeNotifier {
  late Stopwatch _stopwatch;
  final Duration _duration = const Duration(milliseconds: 1);
  late Timer _timer;

  StopwatchService() {
    _stopwatch = Stopwatch();
  }

  void start() {
    _stopwatch.start();
    _timer = Timer.periodic(_duration, _onTick);
  }

  void stop() {
    _stopwatch.stop();
    _timer.cancel();
  }

  void reset() {
    _stopwatch.reset();
    notifyListeners();
  }

  bool get isRunning => _stopwatch.isRunning;

  String get formattedTime {
    final milliseconds = _stopwatch.elapsedMilliseconds;
    final seconds = (milliseconds / 1000).truncate();
    final minutes = (seconds / 60).truncate();

    final formattedMilliseconds =
    (milliseconds % 1000).toString().padLeft(3, '0');
    final formattedSeconds = (seconds % 60).toString().padLeft(2, '0');
    final formattedMinutes = (minutes % 60).toString().padLeft(2, '0');

    return '$formattedMinutes:$formattedSeconds.$formattedMilliseconds';
  }

  void _onTick(Timer timer) {
    if (_stopwatch.isRunning) {
      notifyListeners();
    }
  }
}
