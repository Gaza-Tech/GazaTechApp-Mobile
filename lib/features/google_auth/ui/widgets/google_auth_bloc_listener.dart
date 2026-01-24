import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/google_auth/cubit/google_auth_cubit.dart';
import 'package:gaza_tech/features/google_auth/cubit/google_auth_state.dart';

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
              const SnackBar(content: Text('Sign-in cancelled')),
            );
          },
          failure: (error) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(error),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
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
