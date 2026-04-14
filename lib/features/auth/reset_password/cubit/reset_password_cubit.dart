import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/mixins/form_error_clearable.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import '../data/repos/reset_password_repo.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState>
    with FormErrorClearable {
  final ResetPasswordRepo _resetPasswordRepo;
  final String email;

  ResetPasswordCubit(this._resetPasswordRepo, this.email)
    : super(const ResetPasswordState.initial());

  final otpController = TextEditingController();
  @override
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  List<TextEditingController> get formControllers => [
    passwordController,
    confirmPasswordController,
  ];

  Future<void> emitVerifyOtpState() async {
    emit(const ResetPasswordState.verifyLoading());

    final result = await _resetPasswordRepo.verifyRecoveryOtp(
      email: email,
      token: otpController.text.trim(),
    );

    result.when(
      success: (_) => emit(
        const ResetPasswordState.verifySuccess("OTP verified successfully"),
      ),
      failure: (error) => emit(
        ResetPasswordState.verifyFailure(
          error.message ?? "Invalid or expired code",
        ),
      ),
    );
  }

  Future<void> emitResetPasswordState() async {
    if (!formKey.currentState!.validate()) return;

    emit(const ResetPasswordState.resetLoading());

    final result = await _resetPasswordRepo.updatePassword(
      passwordController.text.trim(),
    );

    result.when(
      success: (_) => emit(
        const ResetPasswordState.resetSuccess("Password reset successful"),
      ),
      failure: (error) => emit(
        ResetPasswordState.resetFailure(
          error.message ?? "Failed to reset password",
        ),
      ),
    );
  }

  Future<void> resendOtp() async {
    emit(const ResetPasswordState.resendLoading());

    final result = await _resetPasswordRepo.resendRecoveryOtp(email);

    result.when(
      success: (_) =>
          emit(const ResetPasswordState.resendSuccess("Recovery code resent")),
      failure: (error) => emit(
        ResetPasswordState.resendFailure(
          error.message ?? "Failed to resend code",
        ),
      ),
    );
  }
}
