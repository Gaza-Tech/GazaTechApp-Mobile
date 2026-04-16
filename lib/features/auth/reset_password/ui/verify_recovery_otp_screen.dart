import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/theme/my_themes.dart';
import 'package:gaza_tech/core/widgets/my_otp_form_field.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/core/widgets/status_bar_hider.dart';
import 'package:gaza_tech/features/auth/sign_in/ui/widgets/account_action_row.dart';
import 'package:gaza_tech/features/auth/reset_password/cubit/reset_password_cubit.dart';
import 'widgets/verify_recovery_otp_bloc_listener.dart';

class VerifyRecoveryOtpScreen extends StatefulWidget {
  final String email;
  const VerifyRecoveryOtpScreen({super.key, required this.email});

  @override
  State<VerifyRecoveryOtpScreen> createState() =>
      _VerifyRecoveryOtpScreenState();
}

class _VerifyRecoveryOtpScreenState extends State<VerifyRecoveryOtpScreen> {
  bool isOtpComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: MyThemes.darkTheme(const Locale('en')).colorScheme.onSurface,
        ),
      ),
      body: StatusBarHider(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.verifyYourEmail,
                  style: MyTextStyle.heading.h1.copyWith(
                    color: MyThemes.darkTheme(
                      const Locale('en'),
                    ).colorScheme.onSurface,
                  ),
                ),
                const VerticalSpace(8),
                Text(context.l10n.recoverySentTo, style: MyTextStyle.body.s),
                const VerticalSpace(4),
                Text(
                  widget.email,
                  style: MyTextStyle.body.s.copyWith(
                    color: MyThemes.darkTheme(
                      const Locale('en'),
                    ).colorScheme.primary,
                  ),
                ),
                const VerticalSpace(40),
                Text(
                  context.l10n.enterRecoveryCode,
                  style: MyTextStyle.body.s.copyWith(
                    color: MyThemes.darkTheme(
                      const Locale('en'),
                    ).colorScheme.onSurface,
                  ),
                ),
                const VerticalSpace(8),
                MyOtpFormField(
                  length: 6,
                  onChanged: (value) {
                    context.read<ResetPasswordCubit>().otpController.text =
                        value;
                    setState(() => isOtpComplete = value.length == 6);
                  },
                  onCompleted: (value) {
                    context.read<ResetPasswordCubit>().otpController.text =
                        value;
                    setState(() => isOtpComplete = true);
                  },
                ),
                const VerticalSpace(100),
                AccountActionRow(
                  description: context.l10n.didntReceiveCode,
                  actionText: context.l10n.resendCode,
                  onTap: () => context.read<ResetPasswordCubit>().resendOtp(),
                ),
                const VerticalSpace(40),
                MyButton(
                  text: context.l10n.verify,
                  onPressed: isOtpComplete
                      ? () => context
                            .read<ResetPasswordCubit>()
                            .emitVerifyOtpState()
                      : null,
                  height: 48.h,
                  backgroundColor: MyThemes.darkTheme(
                    const Locale('en'),
                  ).colorScheme.primary,
                ),
                const VerifyRecoveryOtpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
