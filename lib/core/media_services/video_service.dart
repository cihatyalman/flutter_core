// Documents and Integration
// https://pub.dev/packages/video_player
// https://pub.dev/packages/chewie

import 'dart:io';
import 'dart:math';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

final cacheVideoController = <String, VideoPlayerController>{};

enum VideoServiceType { network, file, asset }

class VideoService {
  static Future<VideoPlayerController> videoInitialize({
    required dynamic sourceData,
    VideoServiceType videoType = VideoServiceType.network,
  }) async {
    final cacheKey = sourceData is File ? sourceData.path : sourceData;
    if (cacheVideoController[cacheKey]?.value.isInitialized == true) {
      return cacheVideoController[cacheKey]!;
    } else if (cacheVideoController[cacheKey] == null) {
      cacheVideoController[cacheKey] =
          _getVideoController(videoType, sourceData);
    }
    await cacheVideoController[cacheKey]!.initialize();
    return cacheVideoController[cacheKey]!;
  }

  static Widget videoPreview({
    required dynamic sourceData,
    VideoServiceType videoType = VideoServiceType.network,
  }) {
    final cacheKey = _getCacheKey(sourceData);
    if (cacheVideoController[cacheKey]?.value.isInitialized == true) {
      return _videoWidget(cacheVideoController[cacheKey]!);
    }
    return FutureBuilder<VideoPlayerController>(
      future: videoInitialize(sourceData: sourceData, videoType: videoType),
      builder: (context, snapshot) {
        if (snapshot.data == null) return placeholder();
        return _videoWidget(snapshot.data!);
      },
    );
  }

  static Widget videoBuild({
    required dynamic sourceData,
    VideoServiceType videoType = VideoServiceType.network,
    ChewieController? customController,
    void Function(ChewieController controller)? callback,
  }) {
    final cacheKey = _getCacheKey(sourceData);
    if (cacheVideoController[cacheKey]?.value.isInitialized == true) {
      final cController1 = customController ??
          _chewieController(cacheVideoController[cacheKey]!);
      callback?.call(cController1);
      return _chewieWidget(cController1);
    }
    return FutureBuilder(
      future: videoInitialize(sourceData: sourceData, videoType: videoType),
      builder: (context, snapshot) {
        if (snapshot.data == null) return placeholder();
        final cController2 =
            customController ?? _chewieController(snapshot.data!);
        callback?.call(cController2);
        return _chewieWidget(cController2);
      },
    );
  }

  static VideoPlayerController _getVideoController(
      VideoServiceType videoType, dynamic sourceData) {
    switch (videoType) {
      case VideoServiceType.network:
        return VideoPlayerController.networkUrl(Uri.parse(sourceData));
      case VideoServiceType.file:
        return VideoPlayerController.file(sourceData);
      case VideoServiceType.asset:
        return VideoPlayerController.asset(sourceData);
      default:
        return VideoPlayerController.networkUrl(sourceData);
    }
  }

  static String _getCacheKey(dynamic sourceData) =>
      sourceData is File ? sourceData.path : sourceData;

  static Widget placeholder() {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.all(56),
      child: const Icon(Icons.downloading_rounded, color: Colors.grey),
    );
  }

  static ChewieController _chewieController(VideoPlayerController controller) =>
      ChewieController(
        videoPlayerController: controller,
        aspectRatio: controller.value.aspectRatio,
        allowPlaybackSpeedChanging: false,
        allowedScreenSleep: false,
        showOptions: false,
        showControls: false,
        autoPlay: false,
        looping: false,
      );

  static Widget _videoWidget(VideoPlayerController controller) {
    return SizedBox(
      width: controller.value.aspectRatio,
      height: 1,
      child: VideoPlayer(
        key: ValueKey(
            "${Random().nextInt(999).toString()}_${controller.dataSource}"),
        controller,
      ),
    );
  }

  static Widget _chewieWidget(ChewieController cController) {
    return SizedBox(
      width: cController.videoPlayerController.value.aspectRatio,
      height: 1,
      child: Chewie(
        key: ValueKey(
            "${Random().nextInt(999).toString()}_${cController.videoPlayerController.dataSource}"),
        controller: cController,
      ),
    );
  }

  static void stopAllVideo({bool isBegin = true}) {
    for (var element in cacheVideoController.values) {
      element.pause();
      if (isBegin) element.seekTo(Duration.zero);
    }
  }
}
