import 'package:flutter/material.dart';
import 'package:grit_soft_feed_reel/core/state.dart';
import 'package:provider/provider.dart';

class ReelActionsPortrait extends StatelessWidget {
  const ReelActionsPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: null,
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24),
            ),
            child: Icon(Icons.favorite, color: Colors.white),
          ),
        ),
        GestureDetector(
          onTap: () {
            final oldValue = context.read<ValueNotifier<ModalState>>().value;
            context.read<ValueNotifier<ModalState>>().value = oldValue.copyWith(
              isShowing: true,
            );
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24),
            ),
            child: Icon(Icons.comment, color: Colors.white),
          ),
        ),
        GestureDetector(
          onTap: null,
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24),
            ),
            child: Icon(Icons.share, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class ReelActionsLandscape extends StatelessWidget {
  const ReelActionsLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        GestureDetector(
          onTap: null,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24),
            ),
            child: Icon(Icons.favorite, color: Colors.white),
          ),
        ),
        GestureDetector(
          onTap: () {
            final oldValue = context.read<ValueNotifier<ModalState>>().value;
            context.read<ValueNotifier<ModalState>>().value = oldValue.copyWith(
              isShowing: true,
            );
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24),
            ),
            child: Icon(Icons.comment, color: Colors.white),
          ),
        ),
        GestureDetector(
          onTap: null,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24),
            ),
            child: Icon(Icons.share, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
