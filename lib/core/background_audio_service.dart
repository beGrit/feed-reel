import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:grit_soft_feed_reel/core/typedefs.dart';
import 'package:video_player/video_player.dart';

class BackgroundAudioService {
  BackgroundAudioService._();

  static final BackgroundAudioService instance = BackgroundAudioService._();

  AudioHandler? _handler;

  Future<void> ensureInitialized() async {
    if (_handler != null) return;
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    _handler = await AudioService.init(
      builder: () => AudioServiceReelHandler(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.gritsoft.app.feedreel',
        androidNotificationChannelName: 'Playback',
        androidNotificationOngoing: true,
      ),
    );
  }

  void setupHandlerData(
    MediaItem item,
    VideoPlayFunction play,
    VideoPauseFunction pause,
    VideoSeekFunction seek,
    VideoPlayerController controller,
  ) {
    final handler = _handler;
    if (handler is! AudioServiceReelHandler) return;
    handler.setupSingleHandlerData(item, play, pause, seek);
    handler.initializeStreamController(controller);
    handler.playbackState.addStream(handler._streamController.stream);
  }

  Future<void> stop() async {
    final handler = _handler;
    if (handler == null) return;
    await handler.stop();
  }
}

class AudioServiceReelHandler extends BaseAudioHandler with SeekHandler {
  VideoPlayFunction? _videoPlay;
  VideoPauseFunction? _videoPause;
  VideoSeekFunction? _videoSeek;
  late StreamController<PlaybackState> _streamController;

  Future<void> playFromUrl({
    required String url,
    required String id,
    required String title,
    Duration position = Duration.zero,
  }) async {
    mediaItem.add(MediaItem(id: id, title: title));
  }

  void setupSingleHandlerData(
    MediaItem item,
    VideoPlayFunction play,
    VideoPauseFunction pause,
    VideoSeekFunction seek,
  ) {
    mediaItem.add(item);
    _videoPlay = play;
    _videoPause = pause;
    _videoSeek = seek;
  }

  void initializeStreamController(
    VideoPlayerController? videoPlayerController,
  ) {
    bool isPlaying() => videoPlayerController?.value.isPlaying ?? false;

    AudioProcessingState processingState() {
      if (videoPlayerController == null) return AudioProcessingState.idle;
      if (videoPlayerController.value.isInitialized)
        return AudioProcessingState.ready;
      return AudioProcessingState.idle;
    }

    Duration bufferedPosition() {
      DurationRange? currentBufferedRange = videoPlayerController
          ?.value
          .buffered
          .firstWhere((durationRange) {
            Duration position = videoPlayerController.value.position;
            bool isCurrentBufferedRange =
                durationRange.start < position && durationRange.end > position;
            return isCurrentBufferedRange;
          });
      if (currentBufferedRange == null) return Duration.zero;
      return currentBufferedRange.end;
    }

    void addVideoEvent() {
      _streamController.add(
        PlaybackState(
          controls: [
            MediaControl.rewind,
            if (isPlaying()) MediaControl.pause else MediaControl.play,
            MediaControl.stop,
            MediaControl.fastForward,
          ],
          systemActions: const {
            MediaAction.seek,
            MediaAction.seekForward,
            MediaAction.seekBackward,
          },
          androidCompactActionIndices: const [0, 1, 3],
          processingState: processingState(),
          playing: isPlaying(),
          updatePosition:
              videoPlayerController?.value.position ?? Duration.zero,
          // bufferedPosition: bufferedPosition(),
          speed: videoPlayerController?.value.playbackSpeed ?? 1.0,
        ),
      );
    }

    void startStream() {
      videoPlayerController?.addListener(addVideoEvent);
    }

    void stopStream() {
      videoPlayerController?.removeListener(addVideoEvent);
      _streamController.close();
    }

    _streamController = StreamController<PlaybackState>(
      onListen: startStream,
      onPause: stopStream,
      onResume: startStream,
      onCancel: stopStream,
    );
  }

  @override
  Future<void> play() => _videoPlay!();

  @override
  Future<void> pause() => _videoPause!();

  @override
  Future<void> seek(Duration position) => _videoSeek!(position);

  @override
  Future<void> stop() async {
    _streamController.close();
    await super.stop();
  }
}
