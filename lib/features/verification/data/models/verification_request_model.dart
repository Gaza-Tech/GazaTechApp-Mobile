// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_request_model.freezed.dart';
part 'verification_request_model.g.dart';

@freezed
abstract class VerificationRequestModel with _$VerificationRequestModel {
  const factory VerificationRequestModel({
    @JsonKey(name: 'verification_request_id') String? verificationRequestId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'verification_status')
    @Default('pending')
    String verificationStatus,
    @JsonKey(name: 'id_full_name') required String idFullName,
    @JsonKey(name: 'id_date_of_birth') required DateTime idDateOfBirth,
    @JsonKey(name: 'id_gender') @Default('male') String idGender,
    required String address,
    @JsonKey(name: 'national_id_number') required String nationalIdNumber,
    @JsonKey(name: 'document_type') required String documentType,
    @JsonKey(name: 'document_front_url') String? documentFrontUrl,
    @JsonKey(name: 'document_back_url') String? documentBackUrl,
    @JsonKey(name: 'selfie_with_id_url') String? selfieWithIdUrl,
    @JsonKey(name: 'phone_verified') @Default(false) bool phoneVerified,
    @JsonKey(name: 'email_verified') @Default(false) bool emailVerified,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'submitted_at') DateTime? submittedAt,
    @JsonKey(name: 'reviewed_at') DateTime? reviewedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _VerificationRequestModel;

  factory VerificationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationRequestModelFromJson(json);
}
