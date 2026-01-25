import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/auth/google_auth/cubit/google_auth_cubit.dart';
import 'package:gaza_tech/features/auth/google_auth/cubit/google_auth_state.dart';

class GoogleAuthBlocListener extends StatelessWidget {
  const GoogleAuthBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GoogleAuthCubit, GoogleAuthState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.pushNamedAndRemoveUntil(
              MyRoutes.home,
              predicate: (route) => false,
            );
          },
          cancelled: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.l10n.signInCancelled)),
            );
          },
          failure: (error) {
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
