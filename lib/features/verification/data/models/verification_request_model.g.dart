// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerificationRequestModel _$VerificationRequestModelFromJson(
  Map<String, dynamic> json,
) => _VerificationRequestModel(
  verificationRequestId: json['verification_request_id'] as String?,
  userId: json['user_id'] as String,
  verificationStatus: json['verification_status'] as String? ?? 'pending',
  idFullName: json['id_full_name'] as String,
  idDateOfBirth: DateTime.parse(json['id_date_of_birth'] as String),
  idGender: json['id_gender'] as String? ?? 'male',
  address: json['address'] as String,
  nationalIdNumber: json['national_id_number'] as String,
  documentType: json['document_type'] as String,
  documentFrontUrl: json['document_front_url'] as String?,
  documentBackUrl: json['document_back_url'] as String?,
  selfieWithIdUrl: json['selfie_with_id_url'] as String?,
  phoneVerified: json['phone_verified'] as bool? ?? false,
  emailVerified: json['email_verified'] as bool? ?? false,
  rejectionReason: json['rejection_reason'] as String?,
  submittedAt: json['submitted_at'] == null
      ? null
      : DateTime.parse(json['submitted_at'] as String),
  reviewedAt: json['reviewed_at'] == null
      ? null
      : DateTime.parse(json['reviewed_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$VerificationRequestModelToJson(
  _VerificationRequestModel instance,
) => <String, dynamic>{
  'verification_request_id': instance.verificationRequestId,
  'user_id': instance.userId,
  'verification_status': instance.verificationStatus,
  'id_full_name': instance.idFullName,
  'id_date_of_birth': instance.idDateOfBirth.toIso8601String(),
  'id_gender': instance.idGender,
  'address': instance.address,
  'national_id_number': instance.nationalIdNumber,
  'document_type': instance.documentType,
  'document_front_url': instance.documentFrontUrl,
  'document_back_url': instance.documentBackUrl,
  'selfie_with_id_url': instance.selfieWithIdUrl,
  'phone_verified': instance.phoneVerified,
  'email_verified': instance.emailVerified,
  'rejection_reason': instance.rejectionReason,
  'submitted_at': instance.submittedAt?.toIso8601String(),
  'reviewed_at': instance.reviewedAt?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
};
