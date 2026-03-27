import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/verification/cubit/verification_cubit.dart';
import 'package:gaza_tech/features/verification/cubit/verification_state.dart';

class ReviewStep extends StatelessWidget {
  const ReviewStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerificationCubit>();
    final state = context.watch<VerificationCubit>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ReviewSection(
          title: context.l10n.reviewPersonalInfo,
          child: _PersonalInfoReview(cubit: cubit, state: state),
        ),
        const VerticalSpace(16),
        _ReviewSection(
          title: context.l10n.reviewDocuments,
          child: _DocumentsReview(state: state),
        ),
        const VerticalSpace(16),
        _ReviewSection(
          title: context.l10n.reviewPhone,
          child: _PhoneReview(cubit: cubit),
        ),
      ],
    );
  }
}

class _ReviewSection extends StatelessWidget {
  final String title;
  final Widget child;

  const _ReviewSection({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          child,
        ],
      ),
    );
  }
}

class _ReviewRow extends StatelessWidget {
  final String label;
  final String value;

  const _ReviewRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value, style: theme.textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}

class _PersonalInfoReview extends StatelessWidget {
  final VerificationCubit cubit;
  final VerificationState state;

  const _PersonalInfoReview({required this.cubit, required this.state});

  @override
  Widget build(BuildContext context) {
    final genderLabels = [context.l10n.genderMale, context.l10n.genderFemale];
    return Column(
      children: [
        _ReviewRow(
          label: context.l10n.idFullName,
          value: cubit.fullNameController.text,
        ),
        _ReviewRow(
          label: context.l10n.dateOfBirth,
          value: cubit.dateOfBirthController.text,
        ),
        _ReviewRow(
          label: context.l10n.gender,
          value: state.selectedGenderIndex >= 0
              ? genderLabels[state.selectedGenderIndex]
              : '-',
        ),
        _ReviewRow(
          label: context.l10n.address,
          value: cubit.addressController.text,
        ),
        _ReviewRow(
          label: context.l10n.nationalIdNumber,
          value: cubit.nationalIdController.text,
        ),
      ],
    );
  }
}

class _DocumentsReview extends StatelessWidget {
  final VerificationState state;

  const _DocumentsReview({required this.state});

  @override
  Widget build(BuildContext context) {
    final docTypes = [
      context.l10n.palestinianId,
      context.l10n.passport,
      context.l10n.palestinianDrivingLicence,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ReviewRow(
          label: context.l10n.documentType,
          value: state.selectedDocumentTypeIndex >= 0
              ? docTypes[state.selectedDocumentTypeIndex]
              : '-',
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            _DocumentThumb(
              path: state.documentFrontPath,
              label: context.l10n.documentFront,
            ),
            SizedBox(width: 8.w),
            _DocumentThumb(
              path: state.documentBackPath,
              label: context.l10n.documentBack,
            ),
            SizedBox(width: 8.w),
            _DocumentThumb(
              path: state.selfieWithIdPath,
              label: context.l10n.selfieWithId,
            ),
          ],
        ),
      ],
    );
  }
}

class _DocumentThumb extends StatelessWidget {
  final String? path;
  final String label;

  const _DocumentThumb({required this.path, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: path != null
                ? Image.file(
                    File(path!),
                    height: 60.h,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                : Container(
                    height: 60.h,
                    color: Theme.of(context).colorScheme.outline,
                  ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _PhoneReview extends StatelessWidget {
  final VerificationCubit cubit;

  const _PhoneReview({required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: Colors.green, size: 18.sp),
        SizedBox(width: 8.w),
        Text(
          cubit.phoneController.text,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
