import 'package:flutter/material.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class LabeledField extends StatelessWidget {
  final String label;
  final bool isRequired;

  const LabeledField({super.key, required this.label, this.isRequired = true});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).textTheme.bodyMedium?.color;
    return RichText(
      text: TextSpan(
        text: '$label ',
        style: MyTextStyle.heading.h4.copyWith(color: color),
        children: [
          if (isRequired)
            TextSpan(
              text: '*',
              style: MyTextStyle.heading.h4.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
        ],
      ),
    );
  }
}
