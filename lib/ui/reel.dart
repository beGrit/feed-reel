import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grit_soft_feed_reel/core/background_audio_service.dart';
import 'package:grit_soft_feed_reel/core/builders.dart';
import 'package:grit_soft_feed_reel/core/models.dart';
import 'package:grit_soft_feed_reel/core/state.dart';
import 'package:grit_soft_feed_reel/ui/reel_controls.dart';
import 'package:grit_soft_feed_reel/ui/reel_modal.dart';
import 'package:grit_soft_feed_reel/ui/reel_video_player.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class Reel extends StatefulWidget {
  final ReelInfo reelInfo;
  final Builders? builders;

  const Reel({super.key, this.builders, required this.reelInfo});

  @override
  State<Reel> createState() => _ReelState();
}

class _ReelState extends State<Reel> {
  final GlobalKey _keyReelVideoPlayer = GlobalKey();
  final GlobalKey _keyReelControls = GlobalKey();
  late final ValueNotifier<VideoState> _videoStateNotifier;
  late final ValueNotifier<OrientationState> _orientationStateNotifier;
  late final ValueNotifier<ModalState> _modalStateNotifier;
  late final VideoPlayerController _controller;

  late Builders _builders;

  @override
  void initState() {
    super.initState();
    _updateBuilders();
    _videoStateNotifier = ValueNotifier<VideoState>(
      VideoState(lastPositionUpdateTime: DateTime.now()),
    );
    _orientationStateNotifier = ValueNotifier<OrientationState>(
      OrientationState(),
    );
    _modalStateNotifier = ValueNotifier<ModalState>(
      ModalState(isShowing: false),
    );
    _modalStateNotifier.addListener(_handleModalStateChange);
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.reelInfo.videoUrl),
      videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true),
    );
    BackgroundAudioService.instance.setupHandlerData(
      MediaItem(
        id: widget.reelInfo.id,
        title: widget.reelInfo.title ?? 'Unknown Title',
        // artUri: Uri.parse(
        //   'asset:///packages/grit_soft_feed_reel/assets/images/default_cover.png',
        // ),
      ),
      _controller.play,
      _controller.pause,
      _controller.seekTo,
      _controller,
    );
  }

  @override
  void didUpdateWidget(covariant Reel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.builders != widget.builders) {
      _updateBuilders();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentOrientation = MediaQuery.of(context).orientation;
    _orientationStateNotifier.value = _orientationStateNotifier.value.copyWith(
      orientation: currentOrientation,
    );
    if (_orientationStateNotifier.value.prevOrientation == null) {
      _orientationStateNotifier.value = _orientationStateNotifier.value
          .copyWith(prevOrientation: currentOrientation);
    } else if (_orientationStateNotifier.value.prevOrientation != null &&
        currentOrientation != _orientationStateNotifier.value.prevOrientation) {
      _orientationStateNotifier.value = _orientationStateNotifier.value
          .copyWith(prevOrientation: currentOrientation);
    }
    _handleOrientationChange(currentOrientation);
  }

  void _handleModalStateChange() {
    if (_modalStateNotifier.value.isShowing) {
      final currentOrientation = _orientationStateNotifier.value.orientation;

      if (currentOrientation == Orientation.landscape) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
  }

  @override
  void dispose() {
    _modalStateNotifier.removeListener(_handleModalStateChange);
    unawaited(BackgroundAudioService.instance.stop());
    _controller.dispose();
    _videoStateNotifier.dispose();
    _orientationStateNotifier.dispose();
    _modalStateNotifier.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: MultiProvider(
        providers: [
          Provider.value(value: _builders),
          ChangeNotifierProvider.value(value: _controller),
          ChangeNotifierProvider.value(value: _videoStateNotifier),
          ChangeNotifierProvider.value(value: _orientationStateNotifier),
          ChangeNotifierProvider.value(value: _modalStateNotifier),
        ],
        child: Stack(
          children: [
            Positioned.fill(child: ReelVideoPlayer(key: _keyReelVideoPlayer)),
            ReelControls(key: _keyReelControls),
            ReelModal(),
          ],
        ),
      ),
    );
  }

  void _handleOrientationChange(Orientation orientation) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );

    if (orientation == Orientation.landscape) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      );
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
  }

  void _updateBuilders() {
    _builders = widget.builders ?? const Builders();
  }
}
