// ignore_for_file: close_sinks

import 'dart:async';

typedef DurationCallback = void Function(Duration duration);

class CustomTimer {
  Duration totalDuration;
  int periotDuration;

  /// 'periodDuration' is type milliseconds
  CustomTimer({
    this.totalDuration = const Duration(seconds: 10),
    this.periotDuration = 10,
  });

  Timer? _timer;
  var _duration = Duration.zero;
  var _pauseDuration = Duration.zero;
  final _streamController = StreamController<Duration>.broadcast();

  Stream<Duration> get stream => _streamController.stream;
  Duration get currentDuration => _duration;

  Future<void> start({
    Duration startDuration = Duration.zero,
    Duration? totalDuration,
  }) async {
    this.totalDuration = totalDuration ?? this.totalDuration;
    stop();
    _pauseDuration = Duration.zero;
    _duration = startDuration;
    _timer = Timer.periodic(Duration(milliseconds: periotDuration), (_) {
      _duration += Duration(milliseconds: periotDuration);
      if (_duration.inMilliseconds >= this.totalDuration.inMilliseconds) {
        stop();
        _streamController.sink.add(this.totalDuration);
        return;
      }
      _streamController.sink.add(_duration);
    });
  }

  void stop() {
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
        start(startDuration: _pauseDuration);
      }
    }
  }

  void sinkPosition(bool isComplate) {
    stop();
    _streamController.sink.add(isComplate ? totalDuration : Duration.zero);
  }

  StreamSubscription<Duration> listen(DurationCallback onData) =>
      _streamController.stream.listen(onData);
}
