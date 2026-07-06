import 'package:flutter/material.dart';
import 'package:grit_soft_feed_reel/ui/reel_actions.dart';
import 'package:grit_soft_feed_reel/ui/reel_info.dart';
import 'package:grit_soft_feed_reel/ui/reel_video_player.dart';

class Reel extends StatefulWidget {
  final String mediaUrl;

  const Reel({super.key, required this.mediaUrl});

  @override
  State<Reel> createState() => _ReelState();
}

class _ReelState extends State<Reel> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: ReelVideoPlayer(mediaUrl: widget.mediaUrl)),
        Positioned(left: 0, right: 0, bottom: 0, child: ReelInfo()),
        Positioned(right: 16.0, bottom: 24.0, child: ReelActions()),
      ],
    );
  }
}
