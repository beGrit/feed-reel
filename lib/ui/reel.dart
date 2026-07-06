import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grit_soft_feed_reel/core/builders.dart';
import 'package:grit_soft_feed_reel/core/state.dart';
import 'package:grit_soft_feed_reel/ui/reel_controls.dart';
import 'package:grit_soft_feed_reel/ui/reel_video_player.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class Reel extends StatefulWidget {
  final String mediaUrl;
  final Builders? builders;

  const Reel({super.key, this.builders, required this.mediaUrl});

  @override
  State<Reel> createState() => _ReelState();
}

class _ReelState extends State<Reel> {
  late final ValueNotifier<VideoState> _videoStateNotifier;
  late final ValueNotifier<OrientationState> _orientationStateNotifier;
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
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.mediaUrl));
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

  void _handleOrientationChange(Orientation orientation) {
    if (orientation == Orientation.landscape) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      // Reset preferred orientations to allow standard auto-rotation again
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
    return MultiProvider(
      providers: [
        Provider.value(value: _builders),
        ChangeNotifierProvider.value(value: _controller),
        ChangeNotifierProvider.value(value: _videoStateNotifier),
        ChangeNotifierProvider.value(value: _orientationStateNotifier),
      ],
      child: Stack(
        children: [
          Positioned.fill(child: ReelVideoPlayer(mediaUrl: widget.mediaUrl)),
          ReelControls(),
        ],
      ),
    );
  }

  void _updateBuilders() {
    _builders = widget.builders ?? const Builders();
  }
}
