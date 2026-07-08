import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grit_soft_feed_reel/core/builders.dart';
import 'package:grit_soft_feed_reel/core/state.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ReelControls extends StatefulWidget {
  const ReelControls({super.key});

  @override
  State<ReelControls> createState() => _ReelControlsState();
}

class _ReelControlsState extends State<ReelControls> {
  late final VideoPlayerController _controller;
  late final ValueNotifier<VideoState> _videoStateNotifier;
  late final ValueNotifier<OrientationState> _orientationStateNotifier;
  late final ValueNotifier<ModalState> _modalStateNotifier;

  late bool _showControls;
  Timer? _hideControlsTimer;

  @override
  void initState() {
    super.initState();
    _showControls = true;
    _videoStateNotifier = context.read<ValueNotifier<VideoState>>();
    _orientationStateNotifier = context.read<ValueNotifier<OrientationState>>();
    _orientationStateNotifier.addListener(_handleOrientationStateChange);
    _modalStateNotifier = context.read<ValueNotifier<ModalState>>();
    _modalStateNotifier.addListener(_handleModalStateChange);
    _controller = context.read<VideoPlayerController>();
  }

  @override
  void dispose() {
    _hideControlsTimer?.cancel();
    _orientationStateNotifier.removeListener(_handleOrientationStateChange);
    _modalStateNotifier.removeListener(_handleModalStateChange);
    super.dispose();
  }

  void _handleOrientationStateChange() {
    final orientation = _orientationStateNotifier.value.orientation;
    final isModalShowing = _modalStateNotifier.value.isShowing;
    if (!isModalShowing) {
      if (orientation == Orientation.landscape) {
        _startHideControlsTimer();
      } else {
        _cancelHideControlsTimer();
      }
    }
  }

  void _handleModalStateChange() {
    final isModalShowing = _modalStateNotifier.value.isShowing;
    setState(() {
      _showControls = !isModalShowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    final builders = context.read<Builders>();
    return Positioned.fill(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _showControls ? 1.0 : 0.0,
        child: Consumer<ValueNotifier<OrientationState>>(
          builder: (context, notifier, child) {
            final orientation = notifier.value.orientation;
            if (orientation == Orientation.landscape) {
              return _buildLandscapeControls(context, builders);
            } else {
              return _buildPortraitControls(context, builders);
            }
          },
        ),
      ),
    );
  }

  void playOrPause() {
    final currentState = _videoStateNotifier.value;
    if (!currentState.isInitialized) return;
    if (currentState.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  void _toggleHideOrShow() {
    if (_showControls == true) {
      setState(() {
        _showControls = false;
      });
    } else {
      setState(() {
        _showControls = true;
      });
    }
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showControls = false;
        });
      }
    });
  }

  void _cancelHideControlsTimer() {
    _hideControlsTimer?.cancel();
    setState(() {
      _showControls = true;
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${twoDigits(minutes)}:${twoDigits(seconds)}';
  }

  Widget _buildLandscapeControls(BuildContext context, Builders builders) {
    return Stack(
      children: [
        // Background dim/gradients
        Positioned.fill(
          child: Consumer<ValueNotifier<ModalState>>(
            builder: (context, notifier, child) => IgnorePointer(
              ignoring: notifier.value.isShowing && !_showControls,
              child: child,
            ),
            child: GestureDetector(
              onTap: _toggleHideOrShow,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.5),
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.5),
                    ],
                    stops: const [0.0, 0.25, 0.75, 1.0],
                  ),
                ),
              ),
            ),
          ),
        ),

        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: IgnorePointer(
            ignoring: !_showControls,
            child: GestureDetector(
              onTap: () {}, // Prevent tap through to hide controls
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 80.0,
                  vertical: 20.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.portraitUp,
                        ]);
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),

                    const SizedBox(width: 8),

                    if (builders.infoBuilderlandscape != null)
                      Expanded(
                        child: builders.infoBuilderlandscape!.call(context),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Center play/pause HUD
        Center(
          child: IgnorePointer(
            ignoring: !_showControls,
            child: GestureDetector(
              onTap: () {
                playOrPause();
                _startHideControlsTimer();
              },
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withValues(alpha: 0.5),
                  border: Border.all(color: Colors.white30, width: 1.5),
                ),
                child: Consumer<ValueNotifier<VideoState>>(
                  builder: (context, notifier, child) => Icon(
                    notifier.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Bottom control bar (progress, time, exit button)
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: IgnorePointer(
            ignoring: !_showControls,
            child: GestureDetector(
              onTap: () {}, // Prevent tap through to hide controls
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 80.0,
                  vertical: 20.0,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Consumer<ValueNotifier<VideoState>>(
                          builder: (context, notifier, child) =>
                              GestureDetector(
                                onTap: () {
                                  playOrPause();
                                  _startHideControlsTimer();
                                },
                                child: Icon(
                                  notifier.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: VideoProgressIndicator(
                            _controller,
                            allowScrubbing: _showControls ? true : false,
                            colors: VideoProgressColors(
                              playedColor: Colors.white,
                              bufferedColor: Colors.white.withValues(
                                alpha: 0.4,
                              ),
                              backgroundColor: Colors.white.withValues(
                                alpha: 0.15,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        ValueListenableBuilder(
                          valueListenable: _controller,
                          builder: (context, VideoPlayerValue value, child) {
                            final position = value.position;
                            final duration = value.duration;
                            return Text(
                              '${_formatDuration(position)} / ${_formatDuration(duration)}',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 16.0),
                        GestureDetector(
                          onTap: () {
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.portraitUp,
                            ]);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white10,
                              border: Border.all(
                                color: Colors.white24,
                                width: 1.0,
                              ),
                            ),
                            child: const Icon(
                              Icons.fullscreen_exit,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        if (builders.actionBuilderlandscape != null)
                          builders.actionBuilderlandscape!.call(context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPortraitControls(BuildContext context, Builders builders) {
    return Stack(
      children: [
        Positioned.fill(
          child: IgnorePointer(
            ignoring: !_showControls,
            child: Consumer<ValueNotifier<VideoState>>(
              builder: (context, notifier, child) {
                final isPlaying = notifier.value.isPlaying;
                return AnimatedOpacity(
                  opacity: isPlaying ? 0 : 1,
                  duration: Duration(milliseconds: 300),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: playOrPause,
                    child: Center(
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withValues(alpha: 0.5),
                          border: Border.all(color: Colors.white30, width: 1.5),
                        ),
                        child: Consumer<ValueNotifier<VideoState>>(
                          builder: (context, notifier, child) => Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // Side/Right action controls (comment button etc)
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 80.0),
            child: builders.actionBuilderPortrait != null
                ? builders.actionBuilderPortrait!.call(context)
                : Column(),
          ),
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    if (builders.infoBuilderPortrait != null)
                      builders.infoBuilderPortrait!.call(context),
                  ],
                ),
              ),
              IgnorePointer(
                ignoring: !_showControls,
                child: GestureDetector(
                  onTap: () {}, // Prevent tap through to hide controls
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.8),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 20.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: VideoProgressIndicator(
                            _controller,
                            allowScrubbing: _showControls ? true : false,
                            colors: VideoProgressColors(
                              playedColor: Colors.white,
                              bufferedColor: Colors.white.withValues(
                                alpha: 0.4,
                              ),
                              backgroundColor: Colors.white.withValues(
                                alpha: 0.15,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        ValueListenableBuilder(
                          valueListenable: _controller,
                          builder: (context, VideoPlayerValue value, child) {
                            final position = value.position;
                            final duration = value.duration;
                            return Text(
                              '${_formatDuration(position)} / ${_formatDuration(duration)}',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
