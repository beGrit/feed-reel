import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelVideoPlayer extends StatefulWidget {
  final String mediaUrl;

  const ReelVideoPlayer({super.key, required this.mediaUrl});

  @override
  State<ReelVideoPlayer> createState() => _ReelVideoPlayerState();
}

class _ReelVideoPlayerState extends State<ReelVideoPlayer> {
  late final VideoPlayerController _controller;

  late bool _isInitialized = false;
  late bool _initFailed = false;
  late bool _isPlaying = false;
  late bool _isBuffering = false;
  Duration _lastPosition = Duration.zero;
  DateTime _lastPositionUpdateTime = DateTime.now();
  bool _isStuck = false;
  double _videoAspectRatio = 16 / 9;
  bool get isLandscape => _videoAspectRatio > 1;

  void playOrPause() {
    if (!_isInitialized) return;
    if (_isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  void play() {
    if (!_isInitialized) return;
    _controller.play();
  }

  void pause() {
    if (!_isInitialized) return;
    _controller.pause();
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.mediaUrl));
    _controller.addListener(videoPlayerControllerListener);
    _controller.initialize().onError((error, stackTrace) {
      debugPrint(error.toString());
      setState(() => _initFailed = true);
    });
  }

  @override
  void didUpdateWidget(covariant ReelVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.removeListener(videoPlayerControllerListener);
    _controller.dispose();
    super.dispose();
  }

  void videoPlayerControllerListener() {
    final value = _controller.value;

    // Handle Error State
    if (value.hasError) {
      if (!_initFailed) {
        setState(() => _initFailed = true);
      }
      return;
    }

    // Handle Auto-Play on Initialization
    if (value.isInitialized && !_isInitialized) {
      setState(() => _isInitialized = true);
      _controller.play();
      _lastPositionUpdateTime = DateTime.now(); // Reset timer right as it plays
      _videoAspectRatio = _controller.value.aspectRatio;
      return;
    }

    // Sync Playing State safely
    if (value.isPlaying != _isPlaying) {
      setState(() => _isPlaying = value.isPlaying);
    }

    // Sync Buffering State safely
    if (value.isBuffering != _isBuffering) {
      setState(() => _isBuffering = value.isBuffering);
    }

    if (value.isPlaying) {
      final currentPosition = value.position;
      final now = DateTime.now();

      if (currentPosition != _lastPosition) {
        _lastPosition = currentPosition;
        _lastPositionUpdateTime = now;

        if (_isStuck) {
          setState(() => _isStuck = false);
        }
      } else {
        final frozenDuration = now.difference(_lastPositionUpdateTime);
        if (frozenDuration > const Duration(milliseconds: 500) && !_isStuck) {
          setState(() => _isStuck = true);
        }
      }
    } else {
      if (_isStuck) {
        setState(() => _isStuck = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  playOrPause();
                },
                child: _buildVideoLayer(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoLayer(BuildContext context) {
    if (_initFailed) {
      return Center(
        child: Text(
          'Could not load video',
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.white54),
        ),
      );
    }
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }

    return Stack(
      children: [
        if (isLandscape)
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
          ),

        if (!isLandscape)
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
        if (_isInitialized && !_isPlaying)
          const IgnorePointer(
            child: Center(
              child: Icon(
                Icons.play_circle_fill,
                size: 72,
                color: Colors.white54,
              ),
            ),
          ),
        if (_isInitialized && _isStuck && !_isPlaying)
          const Center(
            child: CircularProgressIndicator(
              color: Colors.white54,
              strokeWidth: 2,
            ),
          ),
      ],
    );
  }
}
