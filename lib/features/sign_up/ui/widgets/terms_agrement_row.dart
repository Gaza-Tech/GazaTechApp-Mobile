import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class TermsAgreementRow extends StatelessWidget {
  final bool isAgreed;
  final ValueChanged<bool> onChanged;
  final VoidCallback? onTermsTap;
  final VoidCallback? onPrivacyTap;

  const TermsAgreementRow({
    super.key,
    required this.isAgreed,
    required this.onChanged,
    this.onTermsTap,
    this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Checkbox
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: isAgreed,
            activeColor: Theme.of(context).colorScheme.primary,
            side: BorderSide(color: MyColors.neutral.light.medium, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            // The logic is passed up to the parent via this callback
            onChanged: (val) => onChanged(val ?? false),
          ),
        ),

        const SizedBox(width: 12),

        // 2. Rich Text
        Expanded(
          child: Text.rich(
            TextSpan(
              text: "I agree to the ",
              style: MyTextStyle.body.s.copyWith(
                color: MyColors.neutral.dark.light,
              ),
              children: [
                TextSpan(
                  text: "Terms and Conditions",
                  style: MyTextStyle.action.m.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = onTermsTap ?? () {},
                ),
                const TextSpan(text: " and "),
                TextSpan(
                  text: "Privacy Policy",
                  style: MyTextStyle.action.m.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = onPrivacyTap ?? () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
