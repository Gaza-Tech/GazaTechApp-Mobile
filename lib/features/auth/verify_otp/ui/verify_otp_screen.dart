import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/theme/my_themes.dart';
import 'package:gaza_tech/core/widgets/my_otp_form_field.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/core/widgets/status_bar_hider.dart';
import 'package:gaza_tech/features/auth/sign_in/ui/widgets/account_action_row.dart';
import 'package:gaza_tech/features/auth/verify_otp/cubit/verify_otp_cubit.dart';
import 'widgets/verify_otp_bloc_listener.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email;
  const VerifyOtpScreen({super.key, required this.email});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  bool isOtpComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // background Color matches the scaffold background theme color
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? MyThemes.darkTheme.scaffoldBackgroundColor
            : MyThemes.lightTheme.scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: StatusBarHider(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Verify Your Email
                Text(
                  context.l10n.verifyYourEmail,
                  style: MyTextStyle.heading.h1,
                  textAlign: TextAlign.center,
                ),
                const VerticalSpace(8),
                Text(
                  context.l10n.otpSentTo,
                  style: MyTextStyle.body.s,
                  textAlign: TextAlign.center,
                ),
                const VerticalSpace(4),
                Text(
                  widget.email,
                  style: MyTextStyle.body.s,
                  textAlign: TextAlign.center,
                ),
                const VerticalSpace(40),
                Text(
                  context.l10n.enterConfirmationCode,
                  style: MyTextStyle.body.s,
                  textAlign: TextAlign.start,
                ),
                const VerticalSpace(8),
                MyOtpFormField(
                  length: 6,
                  onChanged: (value) {
                    context.read<VerifyOtpCubit>().otpController.text = value;
                    setState(() => isOtpComplete = value.length == 6);
                  },
                  onCompleted: (value) {
                    context.read<VerifyOtpCubit>().otpController.text = value;
                    setState(() {
                      isOtpComplete = true;
                    });
                  },
                ),
                const VerticalSpace(100),
                // resend code row
                AccountActionRow(
                  description: context.l10n.didntReceiveCode,
                  actionText: context.l10n.resendCode,
                  onTap: () => context.read<VerifyOtpCubit>().resendOtp(),
                ),
                const VerticalSpace(40),
                MyButton(
                  text: context.l10n.verify,
                  onPressed: isOtpComplete
                      ? () =>
                            context.read<VerifyOtpCubit>().emitVerifyOtpState()
                      : null,
                  backgroundColor: MyThemes.darkTheme.colorScheme.primary,
                ),
                const VerifyOtpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
