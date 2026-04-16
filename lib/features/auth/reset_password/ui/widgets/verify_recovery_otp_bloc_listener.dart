import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import '../../cubit/reset_password_cubit.dart';
import '../../cubit/reset_password_state.dart';

class VerifyRecoveryOtpBlocListener extends StatelessWidget {
  const VerifyRecoveryOtpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          verifyLoading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          },
          verifySuccess: (message) {
            Navigator.of(context).pop();
            context.pushNamed(
              MyRoutes.resetPassword,
              arguments: context.read<ResetPasswordCubit>().email,
            );
          },
          verifyFailure: (error) {
            Navigator.of(context).pop();
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
