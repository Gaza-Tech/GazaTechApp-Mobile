import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/di/injection.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/report/cubit/report_cubit.dart';
import 'package:gaza_tech/features/report/cubit/report_state.dart';
import 'package:gaza_tech/features/report/data/models/report_reason.dart';

void showReportBottomSheet(
  BuildContext context, {
  required ReportEntityType entityType,
  required String entityId,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (_) {
      return BlocProvider(
        create: (_) => getIt<ReportCubit>(),
        child: _ReportSheetContent(
          entityType: entityType,
          entityId: entityId,
        ),
      );
    },
  );
}

class _ReportSheetContent extends StatefulWidget {
  final ReportEntityType entityType;
  final String entityId;

  const _ReportSheetContent({
    required this.entityType,
    required this.entityId,
  });

  @override
  State<_ReportSheetContent> createState() => _ReportSheetContentState();
}

class _ReportSheetContentState extends State<_ReportSheetContent> {
  ReportReason? _selectedReason;

  String _getTitle(BuildContext context) {
    final l10n = context.l10n;
    switch (widget.entityType) {
      case ReportEntityType.listing:
        return l10n.reportListing;
      case ReportEntityType.post:
        return l10n.reportPost;
      case ReportEntityType.user:
        return l10n.reportUser;
      case ReportEntityType.comment:
        return l10n.reportComment;
    }
  }

  String _getReasonLabel(BuildContext context, ReportReason reason) {
    final l10n = context.l10n;
    switch (reason) {
      case ReportReason.spam:
        return l10n.reportReasonSpam;
      case ReportReason.inappropriateContent:
        return l10n.reportReasonInappropriateContent;
      case ReportReason.harassment:
        return l10n.reportReasonHarassment;
      case ReportReason.misleading:
        return l10n.reportReasonMisleading;
      case ReportReason.fraudScam:
        return l10n.reportReasonFraudScam;
      case ReportReason.hateSpeech:
        return l10n.reportReasonHateSpeech;
      case ReportReason.other:
        return l10n.reportReasonOther;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocListener<ReportCubit, ReportState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.reportSuccess)),
            );
          },
          duplicate: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.reportAlreadySubmitted)),
            );
          },
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.reportFailure)),
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 16.h,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDragHandle(theme),
            const VerticalSpace(16),
            Text(_getTitle(context), style: theme.textTheme.titleLarge),
            const VerticalSpace(4),
            Text(
              l10n.reportSubtitle,
              style: theme.textTheme.bodyMedium,
            ),
            const VerticalSpace(16),
            ...ReportReason.values.map(
              (reason) => RadioListTile<ReportReason>(
                title: Text(
                  _getReasonLabel(context, reason),
                  style: theme.textTheme.bodyMedium,
                ),
                value: reason,
                groupValue: _selectedReason,
                contentPadding: EdgeInsets.zero,
                dense: true,
                onChanged: (value) {
                  setState(() => _selectedReason = value);
                  context.read<ReportCubit>().selectReason(value!);
                },
              ),
            ),
            const VerticalSpace(8),
            TextField(
              controller: context.read<ReportCubit>().descriptionController,
              decoration: InputDecoration(
                hintText: l10n.reportDescriptionHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              maxLines: 3,
              minLines: 2,
            ),
            const VerticalSpace(16),
            _buildSubmitButton(context, theme, l10n),
          ],
        ),
      ),
    );
  }

  Widget _buildDragHandle(ThemeData theme) {
    return Container(
      width: 40.w,
      height: 4.h,
      decoration: BoxDecoration(
        color: theme.dividerColor,
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }

  Widget _buildSubmitButton(
    BuildContext context,
    ThemeData theme,
    dynamic l10n,
  ) {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return FilledButton(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(
              Size(double.infinity, 48.h),
            ),
          ),
          onPressed: _selectedReason == null || isLoading
              ? null
              : () => context.read<ReportCubit>().submitReport(
                    entityType: widget.entityType,
                    entityId: widget.entityId,
                  ),
          child: isLoading
              ? SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(l10n.reportSubmit),
        );
      },
    );
  }
}
