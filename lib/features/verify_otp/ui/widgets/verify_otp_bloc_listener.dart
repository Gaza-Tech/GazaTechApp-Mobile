import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import '../../cubit/verify_otp_cubit.dart';
import '../../cubit/verify_otp_state.dart';

class VerifyOtpBlocListener extends StatelessWidget {
  const VerifyOtpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyOtpCubit, VerifyOtpState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          },
          success: (message) {
            Navigator.of(context).pop(); // Close dialog
            // Navigate to home after verification
            context.pushNamedAndRemoveUntil(
              MyRoutes.signIn,
              predicate: (route) => false,
            );
          },
          failure: (error) {
            Navigator.of(context).pop(); // Close dialog
            showDialog(
              context: context,
              builder: (dialogContext) => AlertDialog(
                title: Text(context.l10n.error),
                content: Text(error),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    child: Text(context.l10n.ok),
                  ),
                ],
              ),
            );
          },
          // Resend states
          resendLoading: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(minutes: 1),
                content: Row(
                  children: [
                    const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    const SizedBox(width: 12),
                    Text(context.l10n.resendingCode),
                  ],
                ),
              ),
            );
          },
          resendSuccess: (message) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
          resendFailure: (error) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(error)));
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
