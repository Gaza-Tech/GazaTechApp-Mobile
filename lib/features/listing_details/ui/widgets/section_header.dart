import 'package:flutter/material.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: MyTextStyle.action.m.copyWith(
        color: theme.textTheme.bodySmall?.color,
        letterSpacing: 1.2,
      ),
    );
  }
}
