import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';

class VerificationStepper extends StatelessWidget {
  final int currentStep;

  const VerificationStepper({super.key, required this.currentStep});

  static const _totalSteps = 4;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final stepTitles = [
      context.l10n.stepPersonalInfo,
      context.l10n.stepDocuments,
      context.l10n.stepPhoneVerification,
      context.l10n.stepReview,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stepTitles[currentStep],
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        LinearProgressIndicator(
          value: (currentStep + 1) / _totalSteps,
          borderRadius: BorderRadius.circular(4.r),
          minHeight: 6.h,
        ),
      ],
    );
  }
}
