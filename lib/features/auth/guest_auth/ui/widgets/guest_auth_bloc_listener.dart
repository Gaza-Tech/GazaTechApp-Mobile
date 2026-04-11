import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/features/auth/guest_auth/cubit/guest_auth_cubit.dart';
import 'package:gaza_tech/features/auth/guest_auth/cubit/guest_auth_state.dart';

/// Handles only the failure branch for guest sign-in.
///
/// Navigation on success is handled by the global `onAuthStateChange`
/// listener in `main.dart`, which fires on `AuthChangeEvent.signedIn`
/// for anonymous sessions as well — so doing it here would cause two
/// back-to-back `pushNamedAndRemoveUntil` calls.
class GuestAuthBlocListener extends StatelessWidget {
  const GuestAuthBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GuestAuthCubit, GuestAuthState>(
      listener: (context, state) {
        state.whenOrNull(
          failure: (error) {
            final message = error.isEmpty ? context.l10n.unknownError : error;
            showDialog(
              context: context,
              builder: (dialogContext) => AlertDialog(
                title: Text(context.l10n.error),
                content: Text(message),
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
