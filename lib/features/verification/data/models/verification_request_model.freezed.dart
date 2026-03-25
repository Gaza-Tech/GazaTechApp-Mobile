// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerificationRequestModel {

@JsonKey(name: 'verification_request_id') String? get verificationRequestId;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'verification_status') String get verificationStatus;@JsonKey(name: 'id_full_name') String get idFullName;@JsonKey(name: 'id_date_of_birth') DateTime get idDateOfBirth;@JsonKey(name: 'id_gender') String get idGender; String get address;@JsonKey(name: 'national_id_number') String get nationalIdNumber;@JsonKey(name: 'document_type') String get documentType;@JsonKey(name: 'document_front_url') String? get documentFrontUrl;@JsonKey(name: 'document_back_url') String? get documentBackUrl;@JsonKey(name: 'selfie_with_id_url') String? get selfieWithIdUrl;@JsonKey(name: 'phone_verified') bool get phoneVerified;@JsonKey(name: 'email_verified') bool get emailVerified;@JsonKey(name: 'rejection_reason') String? get rejectionReason;@JsonKey(name: 'submitted_at') DateTime? get submittedAt;@JsonKey(name: 'reviewed_at') DateTime? get reviewedAt;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of VerificationRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationRequestModelCopyWith<VerificationRequestModel> get copyWith => _$VerificationRequestModelCopyWithImpl<VerificationRequestModel>(this as VerificationRequestModel, _$identity);

  /// Serializes this VerificationRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationRequestModel&&(identical(other.verificationRequestId, verificationRequestId) || other.verificationRequestId == verificationRequestId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.idFullName, idFullName) || other.idFullName == idFullName)&&(identical(other.idDateOfBirth, idDateOfBirth) || other.idDateOfBirth == idDateOfBirth)&&(identical(other.idGender, idGender) || other.idGender == idGender)&&(identical(other.address, address) || other.address == address)&&(identical(other.nationalIdNumber, nationalIdNumber) || other.nationalIdNumber == nationalIdNumber)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.documentFrontUrl, documentFrontUrl) || other.documentFrontUrl == documentFrontUrl)&&(identical(other.documentBackUrl, documentBackUrl) || other.documentBackUrl == documentBackUrl)&&(identical(other.selfieWithIdUrl, selfieWithIdUrl) || other.selfieWithIdUrl == selfieWithIdUrl)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verificationRequestId,userId,verificationStatus,idFullName,idDateOfBirth,idGender,address,nationalIdNumber,documentType,documentFrontUrl,documentBackUrl,selfieWithIdUrl,phoneVerified,emailVerified,rejectionReason,submittedAt,reviewedAt,createdAt);

@override
String toString() {
  return 'VerificationRequestModel(verificationRequestId: $verificationRequestId, userId: $userId, verificationStatus: $verificationStatus, idFullName: $idFullName, idDateOfBirth: $idDateOfBirth, idGender: $idGender, address: $address, nationalIdNumber: $nationalIdNumber, documentType: $documentType, documentFrontUrl: $documentFrontUrl, documentBackUrl: $documentBackUrl, selfieWithIdUrl: $selfieWithIdUrl, phoneVerified: $phoneVerified, emailVerified: $emailVerified, rejectionReason: $rejectionReason, submittedAt: $submittedAt, reviewedAt: $reviewedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $VerificationRequestModelCopyWith<$Res>  {
  factory $VerificationRequestModelCopyWith(VerificationRequestModel value, $Res Function(VerificationRequestModel) _then) = _$VerificationRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'verification_request_id') String? verificationRequestId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'verification_status') String verificationStatus,@JsonKey(name: 'id_full_name') String idFullName,@JsonKey(name: 'id_date_of_birth') DateTime idDateOfBirth,@JsonKey(name: 'id_gender') String idGender, String address,@JsonKey(name: 'national_id_number') String nationalIdNumber,@JsonKey(name: 'document_type') String documentType,@JsonKey(name: 'document_front_url') String? documentFrontUrl,@JsonKey(name: 'document_back_url') String? documentBackUrl,@JsonKey(name: 'selfie_with_id_url') String? selfieWithIdUrl,@JsonKey(name: 'phone_verified') bool phoneVerified,@JsonKey(name: 'email_verified') bool emailVerified,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'submitted_at') DateTime? submittedAt,@JsonKey(name: 'reviewed_at') DateTime? reviewedAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$VerificationRequestModelCopyWithImpl<$Res>
    implements $VerificationRequestModelCopyWith<$Res> {
  _$VerificationRequestModelCopyWithImpl(this._self, this._then);

  final VerificationRequestModel _self;
  final $Res Function(VerificationRequestModel) _then;

/// Create a copy of VerificationRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verificationRequestId = freezed,Object? userId = null,Object? verificationStatus = null,Object? idFullName = null,Object? idDateOfBirth = null,Object? idGender = null,Object? address = null,Object? nationalIdNumber = null,Object? documentType = null,Object? documentFrontUrl = freezed,Object? documentBackUrl = freezed,Object? selfieWithIdUrl = freezed,Object? phoneVerified = null,Object? emailVerified = null,Object? rejectionReason = freezed,Object? submittedAt = freezed,Object? reviewedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
verificationRequestId: freezed == verificationRequestId ? _self.verificationRequestId : verificationRequestId // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String,idFullName: null == idFullName ? _self.idFullName : idFullName // ignore: cast_nullable_to_non_nullable
as String,idDateOfBirth: null == idDateOfBirth ? _self.idDateOfBirth : idDateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,idGender: null == idGender ? _self.idGender : idGender // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,nationalIdNumber: null == nationalIdNumber ? _self.nationalIdNumber : nationalIdNumber // ignore: cast_nullable_to_non_nullable
as String,documentType: null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String,documentFrontUrl: freezed == documentFrontUrl ? _self.documentFrontUrl : documentFrontUrl // ignore: cast_nullable_to_non_nullable
as String?,documentBackUrl: freezed == documentBackUrl ? _self.documentBackUrl : documentBackUrl // ignore: cast_nullable_to_non_nullable
as String?,selfieWithIdUrl: freezed == selfieWithIdUrl ? _self.selfieWithIdUrl : selfieWithIdUrl // ignore: cast_nullable_to_non_nullable
as String?,phoneVerified: null == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [VerificationRequestModel].
extension VerificationRequestModelPatterns on VerificationRequestModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerificationRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerificationRequestModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerificationRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _VerificationRequestModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerificationRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _VerificationRequestModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'verification_request_id')  String? verificationRequestId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'verification_status')  String verificationStatus, @JsonKey(name: 'id_full_name')  String idFullName, @JsonKey(name: 'id_date_of_birth')  DateTime idDateOfBirth, @JsonKey(name: 'id_gender')  String idGender,  String address, @JsonKey(name: 'national_id_number')  String nationalIdNumber, @JsonKey(name: 'document_type')  String documentType, @JsonKey(name: 'document_front_url')  String? documentFrontUrl, @JsonKey(name: 'document_back_url')  String? documentBackUrl, @JsonKey(name: 'selfie_with_id_url')  String? selfieWithIdUrl, @JsonKey(name: 'phone_verified')  bool phoneVerified, @JsonKey(name: 'email_verified')  bool emailVerified, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'submitted_at')  DateTime? submittedAt, @JsonKey(name: 'reviewed_at')  DateTime? reviewedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerificationRequestModel() when $default != null:
return $default(_that.verificationRequestId,_that.userId,_that.verificationStatus,_that.idFullName,_that.idDateOfBirth,_that.idGender,_that.address,_that.nationalIdNumber,_that.documentType,_that.documentFrontUrl,_that.documentBackUrl,_that.selfieWithIdUrl,_that.phoneVerified,_that.emailVerified,_that.rejectionReason,_that.submittedAt,_that.reviewedAt,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'verification_request_id')  String? verificationRequestId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'verification_status')  String verificationStatus, @JsonKey(name: 'id_full_name')  String idFullName, @JsonKey(name: 'id_date_of_birth')  DateTime idDateOfBirth, @JsonKey(name: 'id_gender')  String idGender,  String address, @JsonKey(name: 'national_id_number')  String nationalIdNumber, @JsonKey(name: 'document_type')  String documentType, @JsonKey(name: 'document_front_url')  String? documentFrontUrl, @JsonKey(name: 'document_back_url')  String? documentBackUrl, @JsonKey(name: 'selfie_with_id_url')  String? selfieWithIdUrl, @JsonKey(name: 'phone_verified')  bool phoneVerified, @JsonKey(name: 'email_verified')  bool emailVerified, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'submitted_at')  DateTime? submittedAt, @JsonKey(name: 'reviewed_at')  DateTime? reviewedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _VerificationRequestModel():
return $default(_that.verificationRequestId,_that.userId,_that.verificationStatus,_that.idFullName,_that.idDateOfBirth,_that.idGender,_that.address,_that.nationalIdNumber,_that.documentType,_that.documentFrontUrl,_that.documentBackUrl,_that.selfieWithIdUrl,_that.phoneVerified,_that.emailVerified,_that.rejectionReason,_that.submittedAt,_that.reviewedAt,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'verification_request_id')  String? verificationRequestId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'verification_status')  String verificationStatus, @JsonKey(name: 'id_full_name')  String idFullName, @JsonKey(name: 'id_date_of_birth')  DateTime idDateOfBirth, @JsonKey(name: 'id_gender')  String idGender,  String address, @JsonKey(name: 'national_id_number')  String nationalIdNumber, @JsonKey(name: 'document_type')  String documentType, @JsonKey(name: 'document_front_url')  String? documentFrontUrl, @JsonKey(name: 'document_back_url')  String? documentBackUrl, @JsonKey(name: 'selfie_with_id_url')  String? selfieWithIdUrl, @JsonKey(name: 'phone_verified')  bool phoneVerified, @JsonKey(name: 'email_verified')  bool emailVerified, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'submitted_at')  DateTime? submittedAt, @JsonKey(name: 'reviewed_at')  DateTime? reviewedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _VerificationRequestModel() when $default != null:
return $default(_that.verificationRequestId,_that.userId,_that.verificationStatus,_that.idFullName,_that.idDateOfBirth,_that.idGender,_that.address,_that.nationalIdNumber,_that.documentType,_that.documentFrontUrl,_that.documentBackUrl,_that.selfieWithIdUrl,_that.phoneVerified,_that.emailVerified,_that.rejectionReason,_that.submittedAt,_that.reviewedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerificationRequestModel implements VerificationRequestModel {
  const _VerificationRequestModel({@JsonKey(name: 'verification_request_id') this.verificationRequestId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'verification_status') this.verificationStatus = 'pending', @JsonKey(name: 'id_full_name') required this.idFullName, @JsonKey(name: 'id_date_of_birth') required this.idDateOfBirth, @JsonKey(name: 'id_gender') this.idGender = 'male', required this.address, @JsonKey(name: 'national_id_number') required this.nationalIdNumber, @JsonKey(name: 'document_type') required this.documentType, @JsonKey(name: 'document_front_url') this.documentFrontUrl, @JsonKey(name: 'document_back_url') this.documentBackUrl, @JsonKey(name: 'selfie_with_id_url') this.selfieWithIdUrl, @JsonKey(name: 'phone_verified') this.phoneVerified = false, @JsonKey(name: 'email_verified') this.emailVerified = false, @JsonKey(name: 'rejection_reason') this.rejectionReason, @JsonKey(name: 'submitted_at') this.submittedAt, @JsonKey(name: 'reviewed_at') this.reviewedAt, @JsonKey(name: 'created_at') this.createdAt});
  factory _VerificationRequestModel.fromJson(Map<String, dynamic> json) => _$VerificationRequestModelFromJson(json);

@override@JsonKey(name: 'verification_request_id') final  String? verificationRequestId;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'verification_status') final  String verificationStatus;
@override@JsonKey(name: 'id_full_name') final  String idFullName;
@override@JsonKey(name: 'id_date_of_birth') final  DateTime idDateOfBirth;
@override@JsonKey(name: 'id_gender') final  String idGender;
@override final  String address;
@override@JsonKey(name: 'national_id_number') final  String nationalIdNumber;
@override@JsonKey(name: 'document_type') final  String documentType;
@override@JsonKey(name: 'document_front_url') final  String? documentFrontUrl;
@override@JsonKey(name: 'document_back_url') final  String? documentBackUrl;
@override@JsonKey(name: 'selfie_with_id_url') final  String? selfieWithIdUrl;
@override@JsonKey(name: 'phone_verified') final  bool phoneVerified;
@override@JsonKey(name: 'email_verified') final  bool emailVerified;
@override@JsonKey(name: 'rejection_reason') final  String? rejectionReason;
@override@JsonKey(name: 'submitted_at') final  DateTime? submittedAt;
@override@JsonKey(name: 'reviewed_at') final  DateTime? reviewedAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of VerificationRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationRequestModelCopyWith<_VerificationRequestModel> get copyWith => __$VerificationRequestModelCopyWithImpl<_VerificationRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerificationRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationRequestModel&&(identical(other.verificationRequestId, verificationRequestId) || other.verificationRequestId == verificationRequestId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.idFullName, idFullName) || other.idFullName == idFullName)&&(identical(other.idDateOfBirth, idDateOfBirth) || other.idDateOfBirth == idDateOfBirth)&&(identical(other.idGender, idGender) || other.idGender == idGender)&&(identical(other.address, address) || other.address == address)&&(identical(other.nationalIdNumber, nationalIdNumber) || other.nationalIdNumber == nationalIdNumber)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.documentFrontUrl, documentFrontUrl) || other.documentFrontUrl == documentFrontUrl)&&(identical(other.documentBackUrl, documentBackUrl) || other.documentBackUrl == documentBackUrl)&&(identical(other.selfieWithIdUrl, selfieWithIdUrl) || other.selfieWithIdUrl == selfieWithIdUrl)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verificationRequestId,userId,verificationStatus,idFullName,idDateOfBirth,idGender,address,nationalIdNumber,documentType,documentFrontUrl,documentBackUrl,selfieWithIdUrl,phoneVerified,emailVerified,rejectionReason,submittedAt,reviewedAt,createdAt);

@override
String toString() {
  return 'VerificationRequestModel(verificationRequestId: $verificationRequestId, userId: $userId, verificationStatus: $verificationStatus, idFullName: $idFullName, idDateOfBirth: $idDateOfBirth, idGender: $idGender, address: $address, nationalIdNumber: $nationalIdNumber, documentType: $documentType, documentFrontUrl: $documentFrontUrl, documentBackUrl: $documentBackUrl, selfieWithIdUrl: $selfieWithIdUrl, phoneVerified: $phoneVerified, emailVerified: $emailVerified, rejectionReason: $rejectionReason, submittedAt: $submittedAt, reviewedAt: $reviewedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$VerificationRequestModelCopyWith<$Res> implements $VerificationRequestModelCopyWith<$Res> {
  factory _$VerificationRequestModelCopyWith(_VerificationRequestModel value, $Res Function(_VerificationRequestModel) _then) = __$VerificationRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'verification_request_id') String? verificationRequestId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'verification_status') String verificationStatus,@JsonKey(name: 'id_full_name') String idFullName,@JsonKey(name: 'id_date_of_birth') DateTime idDateOfBirth,@JsonKey(name: 'id_gender') String idGender, String address,@JsonKey(name: 'national_id_number') String nationalIdNumber,@JsonKey(name: 'document_type') String documentType,@JsonKey(name: 'document_front_url') String? documentFrontUrl,@JsonKey(name: 'document_back_url') String? documentBackUrl,@JsonKey(name: 'selfie_with_id_url') String? selfieWithIdUrl,@JsonKey(name: 'phone_verified') bool phoneVerified,@JsonKey(name: 'email_verified') bool emailVerified,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'submitted_at') DateTime? submittedAt,@JsonKey(name: 'reviewed_at') DateTime? reviewedAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$VerificationRequestModelCopyWithImpl<$Res>
    implements _$VerificationRequestModelCopyWith<$Res> {
  __$VerificationRequestModelCopyWithImpl(this._self, this._then);

  final _VerificationRequestModel _self;
  final $Res Function(_VerificationRequestModel) _then;

/// Create a copy of VerificationRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verificationRequestId = freezed,Object? userId = null,Object? verificationStatus = null,Object? idFullName = null,Object? idDateOfBirth = null,Object? idGender = null,Object? address = null,Object? nationalIdNumber = null,Object? documentType = null,Object? documentFrontUrl = freezed,Object? documentBackUrl = freezed,Object? selfieWithIdUrl = freezed,Object? phoneVerified = null,Object? emailVerified = null,Object? rejectionReason = freezed,Object? submittedAt = freezed,Object? reviewedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_VerificationRequestModel(
verificationRequestId: freezed == verificationRequestId ? _self.verificationRequestId : verificationRequestId // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String,idFullName: null == idFullName ? _self.idFullName : idFullName // ignore: cast_nullable_to_non_nullable
as String,idDateOfBirth: null == idDateOfBirth ? _self.idDateOfBirth : idDateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,idGender: null == idGender ? _self.idGender : idGender // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,nationalIdNumber: null == nationalIdNumber ? _self.nationalIdNumber : nationalIdNumber // ignore: cast_nullable_to_non_nullable
as String,documentType: null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String,documentFrontUrl: freezed == documentFrontUrl ? _self.documentFrontUrl : documentFrontUrl // ignore: cast_nullable_to_non_nullable
as String?,documentBackUrl: freezed == documentBackUrl ? _self.documentBackUrl : documentBackUrl // ignore: cast_nullable_to_non_nullable
as String?,selfieWithIdUrl: freezed == selfieWithIdUrl ? _self.selfieWithIdUrl : selfieWithIdUrl // ignore: cast_nullable_to_non_nullable
as String?,phoneVerified: null == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
