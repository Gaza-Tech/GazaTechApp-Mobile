// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerificationState {

// Wizard navigation
 int get currentStep;// Existing request (for status screen / guard)
 VerificationRequestModel? get existingRequest; bool get isLoadingRequest;// Step 1: Personal Info — gender selection
 int get selectedGenderIndex;// Step 2: Documents
 int get selectedDocumentTypeIndex; String? get documentFrontPath; String? get documentBackPath; String? get selfieWithIdPath;// Step 3: Phone OTP
 bool get isOtpSent; bool get isOtpSending; bool get isOtpVerifying; bool get isPhoneVerified; String? get otpError;// Submission
 bool get isSubmitting; bool get submitSuccess;// General
 String? get errorMessage;
/// Create a copy of VerificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationStateCopyWith<VerificationState> get copyWith => _$VerificationStateCopyWithImpl<VerificationState>(this as VerificationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.existingRequest, existingRequest) || other.existingRequest == existingRequest)&&(identical(other.isLoadingRequest, isLoadingRequest) || other.isLoadingRequest == isLoadingRequest)&&(identical(other.selectedGenderIndex, selectedGenderIndex) || other.selectedGenderIndex == selectedGenderIndex)&&(identical(other.selectedDocumentTypeIndex, selectedDocumentTypeIndex) || other.selectedDocumentTypeIndex == selectedDocumentTypeIndex)&&(identical(other.documentFrontPath, documentFrontPath) || other.documentFrontPath == documentFrontPath)&&(identical(other.documentBackPath, documentBackPath) || other.documentBackPath == documentBackPath)&&(identical(other.selfieWithIdPath, selfieWithIdPath) || other.selfieWithIdPath == selfieWithIdPath)&&(identical(other.isOtpSent, isOtpSent) || other.isOtpSent == isOtpSent)&&(identical(other.isOtpSending, isOtpSending) || other.isOtpSending == isOtpSending)&&(identical(other.isOtpVerifying, isOtpVerifying) || other.isOtpVerifying == isOtpVerifying)&&(identical(other.isPhoneVerified, isPhoneVerified) || other.isPhoneVerified == isPhoneVerified)&&(identical(other.otpError, otpError) || other.otpError == otpError)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.submitSuccess, submitSuccess) || other.submitSuccess == submitSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,existingRequest,isLoadingRequest,selectedGenderIndex,selectedDocumentTypeIndex,documentFrontPath,documentBackPath,selfieWithIdPath,isOtpSent,isOtpSending,isOtpVerifying,isPhoneVerified,otpError,isSubmitting,submitSuccess,errorMessage);

@override
String toString() {
  return 'VerificationState(currentStep: $currentStep, existingRequest: $existingRequest, isLoadingRequest: $isLoadingRequest, selectedGenderIndex: $selectedGenderIndex, selectedDocumentTypeIndex: $selectedDocumentTypeIndex, documentFrontPath: $documentFrontPath, documentBackPath: $documentBackPath, selfieWithIdPath: $selfieWithIdPath, isOtpSent: $isOtpSent, isOtpSending: $isOtpSending, isOtpVerifying: $isOtpVerifying, isPhoneVerified: $isPhoneVerified, otpError: $otpError, isSubmitting: $isSubmitting, submitSuccess: $submitSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $VerificationStateCopyWith<$Res>  {
  factory $VerificationStateCopyWith(VerificationState value, $Res Function(VerificationState) _then) = _$VerificationStateCopyWithImpl;
@useResult
$Res call({
 int currentStep, VerificationRequestModel? existingRequest, bool isLoadingRequest, int selectedGenderIndex, int selectedDocumentTypeIndex, String? documentFrontPath, String? documentBackPath, String? selfieWithIdPath, bool isOtpSent, bool isOtpSending, bool isOtpVerifying, bool isPhoneVerified, String? otpError, bool isSubmitting, bool submitSuccess, String? errorMessage
});


$VerificationRequestModelCopyWith<$Res>? get existingRequest;

}
/// @nodoc
class _$VerificationStateCopyWithImpl<$Res>
    implements $VerificationStateCopyWith<$Res> {
  _$VerificationStateCopyWithImpl(this._self, this._then);

  final VerificationState _self;
  final $Res Function(VerificationState) _then;

/// Create a copy of VerificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? existingRequest = freezed,Object? isLoadingRequest = null,Object? selectedGenderIndex = null,Object? selectedDocumentTypeIndex = null,Object? documentFrontPath = freezed,Object? documentBackPath = freezed,Object? selfieWithIdPath = freezed,Object? isOtpSent = null,Object? isOtpSending = null,Object? isOtpVerifying = null,Object? isPhoneVerified = null,Object? otpError = freezed,Object? isSubmitting = null,Object? submitSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,existingRequest: freezed == existingRequest ? _self.existingRequest : existingRequest // ignore: cast_nullable_to_non_nullable
as VerificationRequestModel?,isLoadingRequest: null == isLoadingRequest ? _self.isLoadingRequest : isLoadingRequest // ignore: cast_nullable_to_non_nullable
as bool,selectedGenderIndex: null == selectedGenderIndex ? _self.selectedGenderIndex : selectedGenderIndex // ignore: cast_nullable_to_non_nullable
as int,selectedDocumentTypeIndex: null == selectedDocumentTypeIndex ? _self.selectedDocumentTypeIndex : selectedDocumentTypeIndex // ignore: cast_nullable_to_non_nullable
as int,documentFrontPath: freezed == documentFrontPath ? _self.documentFrontPath : documentFrontPath // ignore: cast_nullable_to_non_nullable
as String?,documentBackPath: freezed == documentBackPath ? _self.documentBackPath : documentBackPath // ignore: cast_nullable_to_non_nullable
as String?,selfieWithIdPath: freezed == selfieWithIdPath ? _self.selfieWithIdPath : selfieWithIdPath // ignore: cast_nullable_to_non_nullable
as String?,isOtpSent: null == isOtpSent ? _self.isOtpSent : isOtpSent // ignore: cast_nullable_to_non_nullable
as bool,isOtpSending: null == isOtpSending ? _self.isOtpSending : isOtpSending // ignore: cast_nullable_to_non_nullable
as bool,isOtpVerifying: null == isOtpVerifying ? _self.isOtpVerifying : isOtpVerifying // ignore: cast_nullable_to_non_nullable
as bool,isPhoneVerified: null == isPhoneVerified ? _self.isPhoneVerified : isPhoneVerified // ignore: cast_nullable_to_non_nullable
as bool,otpError: freezed == otpError ? _self.otpError : otpError // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,submitSuccess: null == submitSuccess ? _self.submitSuccess : submitSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of VerificationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerificationRequestModelCopyWith<$Res>? get existingRequest {
    if (_self.existingRequest == null) {
    return null;
  }

  return $VerificationRequestModelCopyWith<$Res>(_self.existingRequest!, (value) {
    return _then(_self.copyWith(existingRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [VerificationState].
extension VerificationStatePatterns on VerificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerificationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerificationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerificationState value)  $default,){
final _that = this;
switch (_that) {
case _VerificationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerificationState value)?  $default,){
final _that = this;
switch (_that) {
case _VerificationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStep,  VerificationRequestModel? existingRequest,  bool isLoadingRequest,  int selectedGenderIndex,  int selectedDocumentTypeIndex,  String? documentFrontPath,  String? documentBackPath,  String? selfieWithIdPath,  bool isOtpSent,  bool isOtpSending,  bool isOtpVerifying,  bool isPhoneVerified,  String? otpError,  bool isSubmitting,  bool submitSuccess,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerificationState() when $default != null:
return $default(_that.currentStep,_that.existingRequest,_that.isLoadingRequest,_that.selectedGenderIndex,_that.selectedDocumentTypeIndex,_that.documentFrontPath,_that.documentBackPath,_that.selfieWithIdPath,_that.isOtpSent,_that.isOtpSending,_that.isOtpVerifying,_that.isPhoneVerified,_that.otpError,_that.isSubmitting,_that.submitSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStep,  VerificationRequestModel? existingRequest,  bool isLoadingRequest,  int selectedGenderIndex,  int selectedDocumentTypeIndex,  String? documentFrontPath,  String? documentBackPath,  String? selfieWithIdPath,  bool isOtpSent,  bool isOtpSending,  bool isOtpVerifying,  bool isPhoneVerified,  String? otpError,  bool isSubmitting,  bool submitSuccess,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _VerificationState():
return $default(_that.currentStep,_that.existingRequest,_that.isLoadingRequest,_that.selectedGenderIndex,_that.selectedDocumentTypeIndex,_that.documentFrontPath,_that.documentBackPath,_that.selfieWithIdPath,_that.isOtpSent,_that.isOtpSending,_that.isOtpVerifying,_that.isPhoneVerified,_that.otpError,_that.isSubmitting,_that.submitSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStep,  VerificationRequestModel? existingRequest,  bool isLoadingRequest,  int selectedGenderIndex,  int selectedDocumentTypeIndex,  String? documentFrontPath,  String? documentBackPath,  String? selfieWithIdPath,  bool isOtpSent,  bool isOtpSending,  bool isOtpVerifying,  bool isPhoneVerified,  String? otpError,  bool isSubmitting,  bool submitSuccess,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VerificationState() when $default != null:
return $default(_that.currentStep,_that.existingRequest,_that.isLoadingRequest,_that.selectedGenderIndex,_that.selectedDocumentTypeIndex,_that.documentFrontPath,_that.documentBackPath,_that.selfieWithIdPath,_that.isOtpSent,_that.isOtpSending,_that.isOtpVerifying,_that.isPhoneVerified,_that.otpError,_that.isSubmitting,_that.submitSuccess,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VerificationState implements VerificationState {
  const _VerificationState({this.currentStep = 0, this.existingRequest, this.isLoadingRequest = false, this.selectedGenderIndex = -1, this.selectedDocumentTypeIndex = -1, this.documentFrontPath, this.documentBackPath, this.selfieWithIdPath, this.isOtpSent = false, this.isOtpSending = false, this.isOtpVerifying = false, this.isPhoneVerified = false, this.otpError, this.isSubmitting = false, this.submitSuccess = false, this.errorMessage});
  

// Wizard navigation
@override@JsonKey() final  int currentStep;
// Existing request (for status screen / guard)
@override final  VerificationRequestModel? existingRequest;
@override@JsonKey() final  bool isLoadingRequest;
// Step 1: Personal Info — gender selection
@override@JsonKey() final  int selectedGenderIndex;
// Step 2: Documents
@override@JsonKey() final  int selectedDocumentTypeIndex;
@override final  String? documentFrontPath;
@override final  String? documentBackPath;
@override final  String? selfieWithIdPath;
// Step 3: Phone OTP
@override@JsonKey() final  bool isOtpSent;
@override@JsonKey() final  bool isOtpSending;
@override@JsonKey() final  bool isOtpVerifying;
@override@JsonKey() final  bool isPhoneVerified;
@override final  String? otpError;
// Submission
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool submitSuccess;
// General
@override final  String? errorMessage;

/// Create a copy of VerificationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationStateCopyWith<_VerificationState> get copyWith => __$VerificationStateCopyWithImpl<_VerificationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.existingRequest, existingRequest) || other.existingRequest == existingRequest)&&(identical(other.isLoadingRequest, isLoadingRequest) || other.isLoadingRequest == isLoadingRequest)&&(identical(other.selectedGenderIndex, selectedGenderIndex) || other.selectedGenderIndex == selectedGenderIndex)&&(identical(other.selectedDocumentTypeIndex, selectedDocumentTypeIndex) || other.selectedDocumentTypeIndex == selectedDocumentTypeIndex)&&(identical(other.documentFrontPath, documentFrontPath) || other.documentFrontPath == documentFrontPath)&&(identical(other.documentBackPath, documentBackPath) || other.documentBackPath == documentBackPath)&&(identical(other.selfieWithIdPath, selfieWithIdPath) || other.selfieWithIdPath == selfieWithIdPath)&&(identical(other.isOtpSent, isOtpSent) || other.isOtpSent == isOtpSent)&&(identical(other.isOtpSending, isOtpSending) || other.isOtpSending == isOtpSending)&&(identical(other.isOtpVerifying, isOtpVerifying) || other.isOtpVerifying == isOtpVerifying)&&(identical(other.isPhoneVerified, isPhoneVerified) || other.isPhoneVerified == isPhoneVerified)&&(identical(other.otpError, otpError) || other.otpError == otpError)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.submitSuccess, submitSuccess) || other.submitSuccess == submitSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,existingRequest,isLoadingRequest,selectedGenderIndex,selectedDocumentTypeIndex,documentFrontPath,documentBackPath,selfieWithIdPath,isOtpSent,isOtpSending,isOtpVerifying,isPhoneVerified,otpError,isSubmitting,submitSuccess,errorMessage);

@override
String toString() {
  return 'VerificationState(currentStep: $currentStep, existingRequest: $existingRequest, isLoadingRequest: $isLoadingRequest, selectedGenderIndex: $selectedGenderIndex, selectedDocumentTypeIndex: $selectedDocumentTypeIndex, documentFrontPath: $documentFrontPath, documentBackPath: $documentBackPath, selfieWithIdPath: $selfieWithIdPath, isOtpSent: $isOtpSent, isOtpSending: $isOtpSending, isOtpVerifying: $isOtpVerifying, isPhoneVerified: $isPhoneVerified, otpError: $otpError, isSubmitting: $isSubmitting, submitSuccess: $submitSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$VerificationStateCopyWith<$Res> implements $VerificationStateCopyWith<$Res> {
  factory _$VerificationStateCopyWith(_VerificationState value, $Res Function(_VerificationState) _then) = __$VerificationStateCopyWithImpl;
@override @useResult
$Res call({
 int currentStep, VerificationRequestModel? existingRequest, bool isLoadingRequest, int selectedGenderIndex, int selectedDocumentTypeIndex, String? documentFrontPath, String? documentBackPath, String? selfieWithIdPath, bool isOtpSent, bool isOtpSending, bool isOtpVerifying, bool isPhoneVerified, String? otpError, bool isSubmitting, bool submitSuccess, String? errorMessage
});


@override $VerificationRequestModelCopyWith<$Res>? get existingRequest;

}
/// @nodoc
class __$VerificationStateCopyWithImpl<$Res>
    implements _$VerificationStateCopyWith<$Res> {
  __$VerificationStateCopyWithImpl(this._self, this._then);

  final _VerificationState _self;
  final $Res Function(_VerificationState) _then;

/// Create a copy of VerificationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? existingRequest = freezed,Object? isLoadingRequest = null,Object? selectedGenderIndex = null,Object? selectedDocumentTypeIndex = null,Object? documentFrontPath = freezed,Object? documentBackPath = freezed,Object? selfieWithIdPath = freezed,Object? isOtpSent = null,Object? isOtpSending = null,Object? isOtpVerifying = null,Object? isPhoneVerified = null,Object? otpError = freezed,Object? isSubmitting = null,Object? submitSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_VerificationState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,existingRequest: freezed == existingRequest ? _self.existingRequest : existingRequest // ignore: cast_nullable_to_non_nullable
as VerificationRequestModel?,isLoadingRequest: null == isLoadingRequest ? _self.isLoadingRequest : isLoadingRequest // ignore: cast_nullable_to_non_nullable
as bool,selectedGenderIndex: null == selectedGenderIndex ? _self.selectedGenderIndex : selectedGenderIndex // ignore: cast_nullable_to_non_nullable
as int,selectedDocumentTypeIndex: null == selectedDocumentTypeIndex ? _self.selectedDocumentTypeIndex : selectedDocumentTypeIndex // ignore: cast_nullable_to_non_nullable
as int,documentFrontPath: freezed == documentFrontPath ? _self.documentFrontPath : documentFrontPath // ignore: cast_nullable_to_non_nullable
as String?,documentBackPath: freezed == documentBackPath ? _self.documentBackPath : documentBackPath // ignore: cast_nullable_to_non_nullable
as String?,selfieWithIdPath: freezed == selfieWithIdPath ? _self.selfieWithIdPath : selfieWithIdPath // ignore: cast_nullable_to_non_nullable
as String?,isOtpSent: null == isOtpSent ? _self.isOtpSent : isOtpSent // ignore: cast_nullable_to_non_nullable
as bool,isOtpSending: null == isOtpSending ? _self.isOtpSending : isOtpSending // ignore: cast_nullable_to_non_nullable
as bool,isOtpVerifying: null == isOtpVerifying ? _self.isOtpVerifying : isOtpVerifying // ignore: cast_nullable_to_non_nullable
as bool,isPhoneVerified: null == isPhoneVerified ? _self.isPhoneVerified : isPhoneVerified // ignore: cast_nullable_to_non_nullable
as bool,otpError: freezed == otpError ? _self.otpError : otpError // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,submitSuccess: null == submitSuccess ? _self.submitSuccess : submitSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of VerificationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerificationRequestModelCopyWith<$Res>? get existingRequest {
    if (_self.existingRequest == null) {
    return null;
  }

  return $VerificationRequestModelCopyWith<$Res>(_self.existingRequest!, (value) {
    return _then(_self.copyWith(existingRequest: value));
  });
}
}

// dart format on
