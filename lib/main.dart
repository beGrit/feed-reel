import 'package:flutter/material.dart';
import 'package:grit_soft_feed_reel/core/background_audio_service.dart';
import 'package:grit_soft_feed_reel/core/builders.dart';
import 'package:grit_soft_feed_reel/core/models.dart';
import 'package:grit_soft_feed_reel/ui/reel.dart';
import 'package:grit_soft_feed_reel/ui/reel_actions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BackgroundAudioService.instance.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final reelInfo = ReelInfo(
      id: '100',
      title: 'Knowledge share',
      titleSub: 'this is testing',
      videoUrl:
          'https://embti-storage-dev.grit-soft.com/feed/reels/image_picker_46369398-5824-499F-866F-2490A5C44676-1840-000000936AF19BC3outputVideo.mov',
    );
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Reel(
          reelInfo: reelInfo,
          builders: Builders(
            infoBuilderlandscape: (context) => Text(
              reelInfo.title ?? 'Title',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black.withValues(alpha: 0.5),
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
            ),
            actionBuilderlandscape: (context) => ReelActionsLandscape(),
            infoBuilderPortrait: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      reelInfo.title ?? 'Title',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 4.0,
                            color: Colors.black.withValues(alpha: 0.5),
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (reelInfo.titleSub != null)
                  Row(
                    children: [
                      Text(
                        reelInfo.titleSub ?? '',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            actionBuilderPortrait: (context) => ReelActionsPortrait(),
          ),
        ),
      ),
    );
  }
}
