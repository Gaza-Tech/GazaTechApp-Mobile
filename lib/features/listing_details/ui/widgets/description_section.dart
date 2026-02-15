import 'package:flutter/material.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class DescriptionSection extends StatelessWidget {
  final String description;

  const DescriptionSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      description,
      style: MyTextStyle.body.m.copyWith(
        color: theme.textTheme.bodyMedium?.color,
        height: 1.6,
      ),
    );
  }
}
