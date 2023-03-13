// Documents and Integration
// https://pub.dev/packages/video_player
// https://pub.dev/packages/chewie

// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoService {
  final bool autoPlay;
  final bool startMute;

  VideoService({
    this.autoPlay = false,
    this.startMute = true,
  });

  VideoPlayerController? _videoController;
  ChewieController? chewieController;

  bool _videoActive = false;

  Future<Widget?> showVideoNetwork(String url) async =>
      await _getChewie(VideoPlayerController.network(url));

  Future<Widget?> showVideoAsset(String asset) async =>
      _getChewie(VideoPlayerController.asset(asset));

  Future<Widget?> showVideoFile(File file) async =>
      _getChewie(VideoPlayerController.file(file));

  Future<Widget?> _getChewie(VideoPlayerController controller) async {
    _videoController = controller;
    try {
      _videoActive = true;
      await controller.initialize();
      chewieController = ChewieController(
        aspectRatio: controller.value.aspectRatio,
        videoPlayerController: controller,
        autoPlay: autoPlay,
        looping: true,
        allowPlaybackSpeedChanging: false,
        allowFullScreen: false,
        // allowMuting: false,
        allowedScreenSleep: false,
        showOptions: false,
        showControls: false,
      );
      if (_videoActive) {
        if (startMute) {
          chewieController?.setVolume(0);
        }
        return Chewie(controller: chewieController!);
      }
      await controller.pause();
      await controller.dispose();
      return null;
    } catch (e) {
      print("[C_ERROR]: $e");
      return null;
    }
  }

  void dispose() async {
    _videoActive = false;
    await _videoController?.pause();
    await _videoController?.dispose();
    chewieController?.dispose();
    _videoController = null;
    chewieController = null;
  }
}
