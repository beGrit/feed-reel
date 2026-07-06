import 'package:flutter/material.dart';

class ReelInfo extends StatefulWidget {
  const ReelInfo({super.key});

  @override
  State<ReelInfo> createState() => _ReelInfoState();
}

class _ReelInfoState extends State<ReelInfo> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black.withValues(alpha: 0.75), Colors.transparent],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Title',
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'subtitle',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
