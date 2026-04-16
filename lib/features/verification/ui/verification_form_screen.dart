import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/verification/cubit/verification_cubit.dart';
import 'package:gaza_tech/features/verification/cubit/verification_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'widgets/document_upload_step.dart';
import 'widgets/personal_info_step.dart';
import 'widgets/phone_otp_step.dart';
import 'widgets/review_step.dart';
import 'widgets/verification_stepper.dart';

class VerificationFormScreen extends StatelessWidget {
  const VerificationFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCubit, VerificationState>(
      listenWhen: (p, c) =>
          c.submitSuccess != p.submitSuccess ||
          c.errorMessage != p.errorMessage,
      listener: (context, state) {
        if (state.submitSuccess) {
          context.pushReplacementNamed(MyRoutes.verificationStatus);
        }
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(context.l10n.verificationRequest)),
        body: Column(
          children: [
            _StepperHeader(),
            Expanded(child: _StepBody()),
            _BottomBar(),
          ],
        ),
      ),
    );
  }
}

class _StepperHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCubit, VerificationState>(
      buildWhen: (p, c) => p.currentStep != c.currentStep,
      builder: (context, state) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: VerificationStepper(currentStep: state.currentStep),
      ),
    );
  }
}

class _StepBody extends StatelessWidget {
  static const _steps = [
    PersonalInfoStep(),
    DocumentUploadStep(),
    PhoneOtpStep(),
    ReviewStep(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCubit, VerificationState>(
      buildWhen: (p, c) => p.currentStep != c.currentStep,
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: _steps[state.currentStep],
        );
      },
    );
  }
}

class _BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerificationCubit>();
    return BlocBuilder<VerificationCubit, VerificationState>(
      buildWhen: (p, c) =>
          p.currentStep != c.currentStep || p.isSubmitting != c.isSubmitting,
      builder: (context, state) {
        final isLastStep = state.currentStep == 3;
        final userId = Supabase.instance.client.auth.currentUser!.id;

        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
            child: Row(
              children: [
                if (state.currentStep > 0) ...[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: cubit.previousStep,
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(0, 48.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(context.l10n.back),
                    ),
                  ),
                  const HorizontalSpace(12),
                ],
                Expanded(
                  flex: 2,
                  child: MyButton(
                    text: isLastStep
                        ? (state.isSubmitting
                              ? context.l10n.submittingVerification
                              : context.l10n.submitVerification)
                        : context.l10n.next,
                    onPressed: state.isSubmitting
                        ? null
                        : () {
                            if (isLastStep) {
                              cubit.submitVerificationRequest(userId);
                            } else {
                              final advanced = cubit.nextStep();
                              if (!advanced) {
                                _showStepError(context, state.currentStep);
                              }
                            }
                          },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showStepError(BuildContext context, int step) {
    final l10n = context.l10n;
    String msg;
    switch (step) {
      case 0:
        msg = l10n.pleaseSelectGender;
        break;
      case 1:
        msg = l10n.pleaseUploadAllDocuments;
        break;
      case 2:
        msg = l10n.pleaseVerifyPhone;
        break;
      default:
        return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
