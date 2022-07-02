// Documents and Integration
// https://pub.dev/packages/video_player
// https://pub.dev/packages/chewie

// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoService {
  final double? aspectRatio;

  VideoService({
    this.aspectRatio,
  });

  Future<Widget> showVideoNetwork(String url) async =>
      await _getChewie(VideoPlayerController.network(url));

  Future<Widget> showVideoAsset(String asset) async =>
      _getChewie(VideoPlayerController.asset(asset));

  Future<Widget> showVideoFile(File file) async =>
      _getChewie(VideoPlayerController.file(file));

  Future<Widget> _getChewie(VideoPlayerController controller) async {
    try {
      await controller.initialize();
      return Chewie(
        controller: ChewieController(
          videoPlayerController: controller,
          aspectRatio: aspectRatio,
          autoInitialize: true,
        ),
      );
    } catch (e) {
      print("[C_ERROR]: $e");
      return const Center(child: Text("ERROR"));
    }
  }
}
