import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:gaza_tech/features/sign_up/cubit/sign_up_state.dart'
    hide Success, Failure;

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
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
            Navigator.of(context).pop(); // Close loading dialog

            // Get the email from the Cubit to pass it to the next screen
            final email = context
                .read<SignUpCubit>()
                .emailController
                .text
                .trim();

            // Navigate to Verify OTP Screen
            context.pushNamed(MyRoutes.verifyOtp, arguments: email);
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
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
