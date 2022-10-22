// Documents and Integration
// https://pub.dev/packages/flutter_sound_record
// https://pub.dev/packages/just_audio
// https://pub.dev/packages/path_provider

// ignore_for_file: empty_catches, unused_catch_clause

import 'dart:async';
import 'dart:io';

import 'package:flutter_sound_record/flutter_sound_record.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

import '../utils/custom_timer.dart';

final audioService = AudioService();

class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;
  AudioService._internal();

  Directory? dir;
  final record = FlutterSoundRecord();
  final recordTimer = CustomTimer();
  String? recordPath;
  var player = AudioPlayer();

  clear() async {
    await stopAudio();
    recordPath = null;
  }

// #region Record
  Future<bool> startRecord({
    void Function(String? path)? callback,
    Duration maxDuration = const Duration(seconds: 30),
    String fileName = "audio.mp3",
  }) async {
    dir ??= await getTemporaryDirectory();
    clear();
    bool isPermission = false;
    try {
      isPermission = await record.hasPermission();
    } catch (e) {
      isPermission = false;
    }
    if (isPermission) {
      record.start(path: dir!.path + "/$fileName");
      recordTimer
        ..start()
        ..listen((duration) async {
          if (duration.inMilliseconds >=
              recordTimer.totalDuration.inMilliseconds) {
            recordPath = await stopRecord();
            callback?.call(recordPath);
          }
        });
      return true;
    }
    return false;
  }

  Future<String?> stopRecord() async {
    recordTimer.stop();
    recordPath = await record.stop();
    if (recordPath != null) {
      await player.setFilePath(recordPath!);
      await player.seek(Duration.zero);
    }
    return recordPath;
  }
// #endregion

// #region Play

  // type: 0:path / 1:url
  Future<Duration?> playAudio({
    int type = 0,
    required String path,
    Function()? playCallback,
    Function()? finishCallback,
    double pitch = 1,
  }) async {
    await stopAudio();
    switch (type) {
      case 0:
        await player.setFilePath(path);
        break;
      case 1:
        await player.setUrl(path);
        break;
    }
    final _duration = await player.load();
    await player.setPitch(pitch);
    player.play();
    playCallback?.call();
    player.positionStream.listen((event) {
      if (event.inMilliseconds >= (player.duration?.inMilliseconds ?? 0)) {
        stopAudio();
        finishCallback?.call();
      }
    });
    return _duration;
  }

  Future<void> stopAudio() async {
    await player.stop();
    await player.seek(Duration.zero);
    await player.dispose();
    player = AudioPlayer();
  }

  Future<void> pauseAudio() async => await player.pause();

  Future<void> resumeAudio({double pitch = 1}) async => player.play();

// #endregion

// #region Utils

  // type: 0:path / 1:url
  Future<Duration?> getDuration({int type = 0, required String value}) async {
    Duration? _duration;
    final tempPlayer = AudioPlayer();
    try {
      switch (type) {
        case 0:
          _duration = await tempPlayer.setFilePath(value,
              initialPosition: const Duration(days: 1000));
          break;
        case 1:
          _duration = await tempPlayer.setUrl(value,
              initialPosition: const Duration(days: 1000));
          break;
      }
      _duration = await tempPlayer.load();
      tempPlayer.dispose();
    } catch (e) {
      return null;
    }

    return _duration;
  }
// #endregion
}
