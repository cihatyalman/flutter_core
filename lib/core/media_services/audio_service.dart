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
  Directory? dir;
  final record = FlutterSoundRecord();
  final recordTimer = CustomTimer();
  String? path;
  var player = AudioPlayer();

  clear() async {
    path = null;
    await stopAudio();
  }

  Future<void> init() async {
    dir = await getTemporaryDirectory();
    clear();
  }

// #region Record
  Future<bool> startRecord({
    void Function(AudioPlayer? player)? callback,
    Duration recordMaxDuration = const Duration(seconds: 10),
  }) async {
    clear();
    bool isPermission = false;
    try {
      isPermission = await record.hasPermission();
    } catch (e) {
      isPermission = false;
    }
    if (isPermission) {
      record.start(path: dir!.path + "/audio.mp3", encoder: AudioEncoder.AAC);
      recordTimer
        ..start()
        ..listen((duration) async {
          if (duration.inMilliseconds >=
              recordTimer.totalDuration.inMilliseconds) {
            final _player = await stopRecord();
            callback?.call(_player);
          }
        });
      return true;
    }
    return false;
  }

  Future<AudioPlayer?> stopRecord() async {
    recordTimer.stop();
    path = await record.stop();
    if (path != null) {
      await player.setFilePath(path!);
      await player.seek(Duration.zero);
      return player;
    }
    return null;
  }
// #endregion

// #region Play

  // type: 0:path / 1:url
  Future<Duration?> playAudio({
    int type = 0,
    required String path,
    Function()? finishCallback,
    Function()? playCallback,
    // double? pitch,
  }) async {
    this.path = path;

    switch (type) {
      case 0:
        await player.setFilePath(path);
        break;
      case 1:
        await player.setUrl(path);
        break;
    }
    final _duration = await player.load();
    // await player.setPitch(pitch ?? 1);
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
    player.seek(Duration.zero);
    player.dispose();
    player = AudioPlayer();
    // await player.setPitch(1);
  }

  Future<void> pauseAudio() async {
    await player.pause();
    // await player.setPitch(1);
  }

  Future<void> resumeAudio({Function()? callback, double? pitch}) async {
    // await player.setPitch(pitch ?? 1);
    player.play();
  }

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
    } catch (e) {
      return null;
    }

    return _duration;
  }
// #endregion
}
