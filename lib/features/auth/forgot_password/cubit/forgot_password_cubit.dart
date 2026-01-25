import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import '../data/repos/forgot_password_repo.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepo _forgotPasswordRepo;

  ForgotPasswordCubit(this._forgotPasswordRepo)
      : super(const ForgotPasswordState.initial());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  Future<void> emitSendResetEmailState() async {
    if (!formKey.currentState!.validate()) return;

    emit(const ForgotPasswordState.loading());

    final result = await _forgotPasswordRepo.sendPasswordResetEmail(
      emailController.text.trim(),
    );

    result.when(
      success: (_) => emit(const ForgotPasswordState.success(
        "Recovery code sent to your email",
      )),
      failure: (error) => emit(ForgotPasswordState.failure(
        error.message ?? "Failed to send recovery email",
      )),
    );
  }

  String get email => emailController.text.trim();
}
