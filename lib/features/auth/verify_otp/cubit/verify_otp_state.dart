import 'package:freezed_annotation/freezed_annotation.dart';
part 'verify_otp_state.freezed.dart';

@freezed
class VerifyOtpState with _$VerifyOtpState {
  const factory VerifyOtpState.initial() = _Initial;
  const factory VerifyOtpState.loading() = Loading;
  const factory VerifyOtpState.success(String message) = Success;
  const factory VerifyOtpState.failure(String message) = Failure;

  // Resend related states
  const factory VerifyOtpState.resendLoading() = ResendLoading;
  const factory VerifyOtpState.resendSuccess(String message) = ResendSuccess;
  const factory VerifyOtpState.resendFailure(String message) = ResendFailure;
}
