import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/chip_selector.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/verification/cubit/verification_cubit.dart';
import 'package:gaza_tech/features/verification/cubit/verification_state.dart';
import 'document_photo_picker.dart';

class DocumentUploadStep extends StatelessWidget {
  const DocumentUploadStep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCubit, VerificationState>(
      builder: (context, state) {
        final cubit = context.read<VerificationCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDocTypeSection(context, state, cubit),
            const VerticalSpace(24),
            DocumentPhotoPicker(
              label: context.l10n.documentFront,
              imagePath: state.documentFrontPath,
              onPickFromGallery: cubit.pickDocumentFront,
              onPickFromCamera: cubit.pickDocumentFront,
            ),
            const VerticalSpace(16),
            DocumentPhotoPicker(
              label: context.l10n.documentBack,
              imagePath: state.documentBackPath,
              onPickFromGallery: cubit.pickDocumentBack,
              onPickFromCamera: cubit.pickDocumentBack,
            ),
            const VerticalSpace(16),
            DocumentPhotoPicker(
              label: context.l10n.selfieWithId,
              imagePath: state.selfieWithIdPath,
              onPickFromGallery: cubit.pickSelfie,
              onPickFromCamera: cubit.pickSelfie,
            ),
          ],
        );
      },
    );
  }

  Widget _buildDocTypeSection(
    BuildContext context,
    VerificationState state,
    VerificationCubit cubit,
  ) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.documentType,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        ChipSelector(
          items: [
            context.l10n.palestinianId,
            context.l10n.passport,
            context.l10n.palestinianDrivingLicence,
          ],
          selectedIndex: state.selectedDocumentTypeIndex == -1
              ? null
              : state.selectedDocumentTypeIndex,
          onChanged: (i) => cubit.selectDocumentType(i ?? 0),
        ),
      ],
    );
  }
}
