import 'package:flutter/material.dart';
import 'package:grit_soft_feed_reel/core/state.dart';
import 'package:provider/provider.dart';

class ReelModal extends StatefulWidget {
  const ReelModal({super.key});

  @override
  State<ReelModal> createState() => _ReelModalState();
}

class _ReelModalState extends State<ReelModal> {
  final TextEditingController _commentController = TextEditingController();
  final List<Map<String, String>> _comments = [
    {
      'username': 'alex_flutter',
      'comment': 'This video quality is absolutely insane! 🚀',
      'time': '2h',
      'likes': '42',
    },
    {
      'username': 'design_guru',
      'comment': 'Loving the split-screen layout here, fits so nicely.',
      'time': '5h',
      'likes': '18',
    },
    {
      'username': 'code_explorer',
      'comment': 'Is this built with the official video_player package?',
      'time': '1d',
      'likes': '3',
    },
    {
      'username': 'antigravity_fan',
      'comment': 'This UI is super clean and premium. Kudos!',
      'time': '2d',
      'likes': '89',
    },
  ];

  bool _isAnimationFinished = false;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _addComment() {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _comments.insert(0, {
        'username': 'you',
        'comment': text,
        'time': 'Just now',
        'likes': '0',
      });
      _commentController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) =>
          Consumer2<ValueNotifier<OrientationState>, ValueNotifier<ModalState>>(
            builder: (context, orientationNotifier, modalNotifier, child) {
              final orientation = orientationNotifier.value.orientation;
              final isLandscape = orientation == Orientation.landscape;
              final showModal = modalNotifier.value.isShowing;
              if (isLandscape) {
                return Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    height: showModal ? constraints.maxWidth : 0.0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      color: Colors.white,
                      width: (showModal ? 300.0 : 0.0),
                      height: constraints.maxHeight,
                      onEnd: () {
                        setState(() {
                          _isAnimationFinished = showModal;
                        });
                      },
                      child: showModal
                          ? _buildContents(theme)
                          : const SizedBox.shrink(),
                    ),
                  ),
                );
              } else {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: showModal ? constraints.maxWidth : 0.0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      color: Colors.white,
                      width: constraints.maxWidth,
                      height: showModal ? 500.0 : 0.0,
                      onEnd: () {
                        setState(() {
                          _isAnimationFinished = showModal;
                        });
                      },
                      child: showModal
                          ? _buildContents(theme)
                          : const SizedBox.shrink(),
                    ),
                  ),
                );
              }
            },
          ),
    );
  }

  Widget _buildContents(ThemeData theme) {
    if (!_isAnimationFinished) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Comments',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.black),
                onPressed: () {
                  context.read<ValueNotifier<ModalState>>().value = context
                      .read<ValueNotifier<ModalState>>()
                      .value
                      .copyWith(isShowing: false);
                },
              ),
            ],
          ),
        ),
        const Divider(color: Colors.white12, height: 1),
        // Comments List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: _comments.length,
            itemBuilder: (context, index) {
              final item = _comments[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blueGrey.shade800,
                      radius: 18,
                      child: Text(
                        item['username']![0].toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                item['username']!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                item['time']!,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['comment']!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          size: 14,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item['likes']!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const Divider(color: Colors.black, height: 1),
        // Input field
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _commentController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: 'Add a comment...',
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                  onSubmitted: (_) => _addComment(),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send, color: Colors.blueAccent),
                onPressed: _addComment,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
