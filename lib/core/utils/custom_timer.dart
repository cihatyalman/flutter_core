// ignore_for_file: close_sinks

import 'dart:async';

typedef DurationCallback = void Function(Duration duration);

class CustomTimer {
  CustomTimer({Duration? totalDuration}) {
    _totalDuration = totalDuration ?? const Duration(seconds: 10);
  }

  Timer? _timer;
  var _duration = Duration.zero;
  var _pauseDuration = Duration.zero;
  var _totalDuration = const Duration(seconds: 10);
  final _streamController = StreamController<Duration>.broadcast();

  Stream<Duration> get stream => _streamController.stream;
  Duration get duration => _duration;
  Duration get totalDuration => _totalDuration;

  Future<void> start({
    Duration startDuration = Duration.zero,
    Duration? totalDuration,
  }) async {
    _totalDuration = totalDuration ?? _totalDuration;
    await stop();
    _pauseDuration = Duration.zero;
    _duration = startDuration;
    _timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      _duration += const Duration(milliseconds: 10);
      if (_duration.inMilliseconds >= _totalDuration.inMilliseconds) {
        stop();
        _streamController.sink.add(_totalDuration);
        return;
      }
      _streamController.sink.add(_duration);
    });
  }

  Future<void> stop() async {
    _timer?.cancel();
    // _timer = null;
    _duration = Duration.zero;
    _streamController.sink.add(_pauseDuration);
  }

  void playOrPause({bool? isPlay, Duration? startDuration}) {
    if (startDuration != null && isPlay == true) {
      _pauseDuration = startDuration;
    }
    if (isPlay != null) {
      if (isPlay) {
        start(startDuration: _pauseDuration);
      } else {
        _pauseDuration = _duration;
        stop();
      }
    } else {
      if (_timer?.isActive == true) {
        _pauseDuration = _duration;
        stop();
      } else {
        final _tempDuration = _pauseDuration;
        _pauseDuration = Duration.zero;
        start(startDuration: _tempDuration);
      }
    }
  }

  void sinkPosition(bool isComplate) {
    stop();
    _streamController.sink.add(isComplate ? _totalDuration : Duration.zero);
  }

  StreamSubscription<Duration> listen(DurationCallback onData) =>
      _streamController.stream.listen(onData);
}
