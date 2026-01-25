import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import '../../cubit/reset_password_cubit.dart';
import '../../cubit/reset_password_state.dart';

class ResetPasswordBlocListener extends StatelessWidget {
  const ResetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          resetLoading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          },
          resetSuccess: (message) {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) => AlertDialog(
                title: Text(context.l10n.success),
                content: Text(context.l10n.passwordResetSuccess),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      context.pushNamedAndRemoveUntil(
                        MyRoutes.signIn,
                        predicate: (route) => false,
                      );
                    },
                    child: Text(context.l10n.signIn),
                  ),
                ],
              ),
            );
          },
          resetFailure: (error) {
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
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
