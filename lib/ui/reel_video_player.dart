import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grit_soft_feed_reel/core/state.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ReelVideoPlayer extends StatefulWidget {
  final String mediaUrl;

  const ReelVideoPlayer({super.key, required this.mediaUrl});

  @override
  State<ReelVideoPlayer> createState() => _ReelVideoPlayerState();
}

class _ReelVideoPlayerState extends State<ReelVideoPlayer> {
  late final VideoPlayerController _controller;
  late final ValueNotifier<VideoState> _videoStateNotifier;

  double _videoAspectRatio = 16 / 9;
  bool get isLandscapeVideo => _videoAspectRatio > 1;

  @override
  void initState() {
    super.initState();
    _videoStateNotifier = context.read<ValueNotifier<VideoState>>();
    _controller = context.read<VideoPlayerController>();
    _controller.addListener(videoPlayerControllerListener);
    _controller.initialize().onError((error, stackTrace) {
      _videoStateNotifier.value = _videoStateNotifier.value.copyWith(
        isInitialized: false,
        initFailed: true,
      );
    });
  }

  @override
  void dispose() {
    _controller.removeListener(videoPlayerControllerListener);
    _controller.dispose();
    super.dispose();
  }

  void autoPlay() {}

  void videoPlayerControllerListener() {
    final value = _controller.value;
    final currentState = _videoStateNotifier.value;

    if (value.hasError) {
      if (!currentState.initFailed) {
        _videoStateNotifier.value = currentState.copyWith(initFailed: true);
      }
      return;
    }

    if (value.isInitialized && !currentState.isInitialized) {
      _controller.play();
      _videoStateNotifier.value = currentState.copyWith(
        isInitialized: true,
        isPlaying: true,
        lastPositionUpdateTime: DateTime.now(),
      );
      setState(() {
        _videoAspectRatio = _controller.value.aspectRatio;
      });
      return;
    }
    bool nextIsPlaying = value.isPlaying;
    bool nextIsBuffering = value.isBuffering;
    bool nextIsStuck = currentState.isStuck;

    Duration nextLastPosition = currentState.lastPosition;
    DateTime nextLastPositionUpdateTime = currentState.lastPositionUpdateTime;
    if (value.isPlaying) {
      final currentPosition = value.position;
      final now = DateTime.now();

      if (currentPosition != currentState.lastPosition) {
        nextLastPosition = currentPosition;
        nextLastPositionUpdateTime = now;
        nextIsStuck = false;
      } else {
        final frozenDuration = now.difference(
          currentState.lastPositionUpdateTime,
        );

        if (frozenDuration > const Duration(milliseconds: 500)) {
          nextIsStuck = true;
        }
      }
    } else {
      nextIsStuck = false;
    }

    if (currentState.isPlaying != nextIsPlaying ||
        currentState.isBuffering != nextIsBuffering ||
        currentState.isStuck != nextIsStuck ||
        currentState.lastPosition != nextLastPosition ||
        currentState.lastPositionUpdateTime != nextLastPositionUpdateTime) {
      _videoStateNotifier.value = currentState.copyWith(
        isPlaying: nextIsPlaying,
        isBuffering: nextIsBuffering,
        isStuck: nextIsStuck,
        lastPosition: nextLastPosition,
        lastPositionUpdateTime: nextLastPositionUpdateTime,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ValueNotifier<OrientationState>>(
      builder: (context, notifier, child) {
        final isLandscapeOrientation =
            notifier.value.orientation == Orientation.landscape;

        return SafeArea(
          left: !isLandscapeOrientation,
          top: !isLandscapeOrientation,
          right: !isLandscapeOrientation,
          bottom: !isLandscapeOrientation,
          child: LayoutBuilder(
            builder: (context, constraints) => Column(
              children: [
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    width: constraints.maxWidth,
                    child: _buildVideoLayer(context),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildVideoLayer(BuildContext context) {
    return Consumer<ValueNotifier<VideoState>>(
      builder: (context, value, child) {
        if (!_videoStateNotifier.value.isInitialized) {
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        }
        if (_videoStateNotifier.value.initFailed) {
          return Center(
            child: Text(
              'Could not load video',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.white54),
            ),
          );
        }

        return Consumer<ValueNotifier<OrientationState>>(
          builder: (context, notifier, child) => Stack(
            children: [
              if (notifier.value.orientation == Orientation.landscape)
                Positioned.fill(
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: _videoAspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                )
              else if (isLandscapeVideo)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: AspectRatio(
                        aspectRatio: _videoAspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ],
                )
              else
                Positioned.fill(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
