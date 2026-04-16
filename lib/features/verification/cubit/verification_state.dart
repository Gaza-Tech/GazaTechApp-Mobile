import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaza_tech/features/verification/data/models/verification_request_model.dart';

part 'verification_state.freezed.dart';

@freezed
abstract class VerificationState with _$VerificationState {
  const factory VerificationState({
    // Wizard navigation
    @Default(0) int currentStep,

    // Existing request (for status screen / guard)
    VerificationRequestModel? existingRequest,
    @Default(false) bool isLoadingRequest,

    // Step 1: Personal Info — gender selection
    @Default(-1) int selectedGenderIndex,

    // Step 2: Documents
    @Default(-1) int selectedDocumentTypeIndex,
    String? documentFrontPath,
    String? documentBackPath,
    String? selfieWithIdPath,

    // Step 3: Phone OTP
    @Default(false) bool isOtpSent,
    @Default(false) bool isOtpSending,
    @Default(false) bool isOtpVerifying,
    @Default(false) bool isPhoneVerified,
    String? otpError,

    // Submission
    @Default(false) bool isSubmitting,
    @Default(false) bool submitSuccess,

    // General
    String? errorMessage,
  }) = _VerificationState;
}
