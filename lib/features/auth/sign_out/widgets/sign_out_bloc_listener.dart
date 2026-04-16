import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/auth/sign_out/cubit/sign_out_cubit.dart';
import 'package:gaza_tech/features/auth/sign_out/cubit/sign_out_state.dart';

class SignOutBlocListener extends StatelessWidget {
  const SignOutBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutCubit, SignOutState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          ),
          success: (message) {
            if (Navigator.canPop(context)) Navigator.pop(context);
            context.pushNamedAndRemoveUntil(
              MyRoutes.signIn,
              predicate: (route) => false,
            );
          },
          failure: (message) {
            if (Navigator.canPop(context)) Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.red),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
