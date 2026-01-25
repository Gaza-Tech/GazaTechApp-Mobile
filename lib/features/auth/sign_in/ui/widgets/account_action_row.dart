import 'package:flutter/material.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class AccountActionRow extends StatelessWidget {
  final String description;
  final String actionText;
  final VoidCallback onTap;

  const AccountActionRow({
    super.key,
    required this.description,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Description Text (e.g., "Don't have an account? ")
        Text(
          description,
          // We use the bodySmall style from the theme to ensure color adapts
          style: Theme.of(context).textTheme.bodySmall ?? MyTextStyle.body.s,
        ),

        // Action Text (e.g., "Sign up")
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: MyTextStyle.action.m.copyWith(
              // Uses the Primary Color defined in your MyTheme.lightTheme/darkTheme
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
