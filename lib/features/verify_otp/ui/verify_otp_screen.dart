import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/theme/my_theme.dart';
import 'package:gaza_tech/core/widgets/my_otp_form_field.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/sign_in/ui/widgets/account_action_row.dart';
import 'package:gaza_tech/features/verify_otp/cubit/verify_otp_cubit.dart';
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
        backgroundColor: MyTheme.darkTheme.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: MyTheme.darkTheme.colorScheme.onSurface,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Verify Your Email
                Text(
                  "Verify Your Email",
                  style: MyTextStyle.heading.h1.copyWith(
                    color: MyTheme.darkTheme.colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                const VerticalSpace(8),
                Text(
                  "A 6-digit code was sent to",
                  style: MyTextStyle.body.s,
                  textAlign: TextAlign.center,
                ),
                const VerticalSpace(4),
                Text(
                  widget.email,
                  style: MyTextStyle.body.s.copyWith(
                    color: MyTheme.darkTheme.colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const VerticalSpace(40),
                Text(
                  "Enter confirmation code",
                  style: MyTextStyle.body.s.copyWith(
                    color: MyTheme.darkTheme.colorScheme.onSurface,
                  ),
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
                  description: 'Didn\'t receive the code? ',
                  actionText: 'Resend Code',
                  onTap: () => context.read<VerifyOtpCubit>().resendOtp(),
                ),
                const VerticalSpace(40),
                MyButton(
                  text: "Verify",
                  onPressed: isOtpComplete
                      ? () =>
                            context.read<VerifyOtpCubit>().emitVerifyOtpState()
                      : null,
                  backgroundColor: MyTheme.darkTheme.colorScheme.primary,
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
