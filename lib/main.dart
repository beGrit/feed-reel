import 'package:flutter/material.dart';
import 'package:grit_soft_feed_reel/ui/reel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Reel(
          mediaUrl:
              'https://embti-storage-dev.grit-soft.com/feed/reels/image_picker_46369398-5824-499F-866F-2490A5C44676-1840-000000936AF19BC3outputVideo.mov',
        ),
      ),
    );
  }
}
