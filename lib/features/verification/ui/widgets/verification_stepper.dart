import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';

class VerificationStepper extends StatelessWidget {
  final int currentStep;

  const VerificationStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final labels = [
      context.l10n.stepPersonalInfo,
      context.l10n.stepDocuments,
      context.l10n.stepPhoneVerification,
      context.l10n.stepReview,
    ];
    return Row(
      children: List.generate(labels.length, (i) {
        final isCompleted = i < currentStep;
        final isActive = i == currentStep;
        return Expanded(
          child: _StepItem(
            index: i,
            label: labels[i],
            isActive: isActive,
            isCompleted: isCompleted,
            isLast: i == labels.length - 1,
          ),
        );
      }),
    );
  }
}

class _StepItem extends StatelessWidget {
  final int index;
  final String label;
  final bool isActive;
  final bool isCompleted;
  final bool isLast;

  const _StepItem({
    required this.index,
    required this.label,
    required this.isActive,
    required this.isCompleted,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final outline = theme.colorScheme.outline;

    Color dotColor;
    if (isCompleted || isActive) {
      dotColor = primary;
    } else {
      dotColor = outline;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: dotColor,
                ),
                child: Center(
                  child: isCompleted
                      ? Icon(Icons.check, size: 14.sp, color: Colors.white)
                      : Text(
                          '${index + 1}',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: isActive
                                ? Colors.white
                                : theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: isActive
                      ? primary
                      : theme.colorScheme.onSurfaceVariant,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        if (!isLast)
          Expanded(
            child: Container(
              height: 2.h,
              margin: EdgeInsets.only(bottom: 20.h),
              color: isCompleted ? primary : outline,
            ),
          ),
      ],
    );
  }
}
