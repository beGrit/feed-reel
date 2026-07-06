import 'package:flutter/material.dart';
import 'package:grit_soft_feed_reel/core/builders.dart';
import 'package:grit_soft_feed_reel/ui/reel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Reel(
          mediaUrl:
              'https://embti-storage-dev.grit-soft.com/feed/reels/image_picker_46369398-5824-499F-866F-2490A5C44676-1840-000000936AF19BC3outputVideo.mov',
          builders: Builders(
            infoBuilderlandscape: (context) => Text(
              'Title',
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
            actionBuilderlandscape: (context) => Row(
              spacing: 8,
              children: [
                _buildReelActionText('Like'),
                _buildReelActionText('Comment'),
                _buildReelActionText('Share'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReelActionText(String label) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.white.withValues(alpha: 0.9),
        fontSize: 14,
        shadows: const [Shadow(blurRadius: 2.0, color: Colors.black54)],
      ),
    );
  }
}
