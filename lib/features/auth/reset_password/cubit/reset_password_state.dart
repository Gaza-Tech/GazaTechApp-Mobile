import 'package:freezed_annotation/freezed_annotation.dart';
part 'reset_password_state.freezed.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = _Initial;

  // OTP Verification states
  const factory ResetPasswordState.verifyLoading() = VerifyLoading;
  const factory ResetPasswordState.verifySuccess(String message) =
      VerifySuccess;
  const factory ResetPasswordState.verifyFailure(String message) =
      VerifyFailure;

  // Password Reset states
  const factory ResetPasswordState.resetLoading() = ResetLoading;
  const factory ResetPasswordState.resetSuccess(String message) = ResetSuccess;
  const factory ResetPasswordState.resetFailure(String message) = ResetFailure;

  // Resend OTP states
  const factory ResetPasswordState.resendLoading() = ResendLoading;
  const factory ResetPasswordState.resendSuccess(String message) =
      ResendSuccess;
  const factory ResetPasswordState.resendFailure(String message) =
      ResendFailure;
}
