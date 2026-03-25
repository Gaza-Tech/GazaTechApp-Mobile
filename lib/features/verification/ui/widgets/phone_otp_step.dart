import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/my_otp_form_field.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/verification/cubit/verification_cubit.dart';
import 'package:gaza_tech/features/verification/cubit/verification_state.dart';

class PhoneOtpStep extends StatelessWidget {
  const PhoneOtpStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerificationCubit>();
    return BlocBuilder<VerificationCubit, VerificationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextFormField(
              controller: cubit.phoneController,
              hintText: context.l10n.phoneNumberHint,
              labelText: context.l10n.enterPhoneNumber,
              visibleLable: true,
              textInputType: TextInputType.phone,
            ),
            const VerticalSpace(16),
            if (!state.isPhoneVerified)
              MyButton(
                text: state.isOtpSending
                    ? context.l10n.submittingVerification
                    : context.l10n.sendOtp,
                onPressed: state.isOtpSending ? null : cubit.sendPhoneOtp,
              ),
            if (state.isOtpSent && !state.isPhoneVerified) ...[
              const VerticalSpace(20),
              Text(
                context.l10n.otpSentToPhone,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const VerticalSpace(16),
              MyOtpFormField(
                onCompleted: (otp) => cubit.otpController.text = otp,
                onChanged: (otp) => cubit.otpController.text = otp,
              ),
              const VerticalSpace(16),
              MyButton(
                text: state.isOtpVerifying
                    ? context.l10n.submittingVerification
                    : context.l10n.verifyPhone,
                onPressed: state.isOtpVerifying ? null : cubit.verifyPhoneOtp,
              ),
            ],
            if (state.otpError != null) ...[
              const VerticalSpace(12),
              Text(
                state.otpError!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ],
            if (state.isPhoneVerified) ...[
              const VerticalSpace(24),
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 24.sp),
                  SizedBox(width: 8.w),
                  Text(
                    context.l10n.phoneVerifiedSuccess,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ],
        );
      },
    );
  }
}
