import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:gaza_tech/features/auth/sign_in/cubit/sign_in_state.dart';

class SignInBlocListener extends StatelessWidget {
  const SignInBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
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
          success: (accessToken) {
            Navigator.of(context).pop(); // Close dialog
            context.pushNamedAndRemoveUntil(
              MyRoutes.home,
              predicate: (route) => false,
            );
          },
          accountBanned: () {
            Navigator.of(context).pop(); // Close dialog
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.l10n.signInAccountBanned),
                backgroundColor: Colors.red,
              ),
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
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
