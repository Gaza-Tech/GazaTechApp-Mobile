// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResetPasswordState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResetPasswordState()';
}


}

/// @nodoc
class $ResetPasswordStateCopyWith<$Res>  {
$ResetPasswordStateCopyWith(ResetPasswordState _, $Res Function(ResetPasswordState) __);
}


/// Adds pattern-matching-related methods to [ResetPasswordState].
extension ResetPasswordStatePatterns on ResetPasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( VerifyLoading value)?  verifyLoading,TResult Function( VerifySuccess value)?  verifySuccess,TResult Function( VerifyFailure value)?  verifyFailure,TResult Function( ResetLoading value)?  resetLoading,TResult Function( ResetSuccess value)?  resetSuccess,TResult Function( ResetFailure value)?  resetFailure,TResult Function( ResendLoading value)?  resendLoading,TResult Function( ResendSuccess value)?  resendSuccess,TResult Function( ResendFailure value)?  resendFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case VerifyLoading() when verifyLoading != null:
return verifyLoading(_that);case VerifySuccess() when verifySuccess != null:
return verifySuccess(_that);case VerifyFailure() when verifyFailure != null:
return verifyFailure(_that);case ResetLoading() when resetLoading != null:
return resetLoading(_that);case ResetSuccess() when resetSuccess != null:
return resetSuccess(_that);case ResetFailure() when resetFailure != null:
return resetFailure(_that);case ResendLoading() when resendLoading != null:
return resendLoading(_that);case ResendSuccess() when resendSuccess != null:
return resendSuccess(_that);case ResendFailure() when resendFailure != null:
return resendFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( VerifyLoading value)  verifyLoading,required TResult Function( VerifySuccess value)  verifySuccess,required TResult Function( VerifyFailure value)  verifyFailure,required TResult Function( ResetLoading value)  resetLoading,required TResult Function( ResetSuccess value)  resetSuccess,required TResult Function( ResetFailure value)  resetFailure,required TResult Function( ResendLoading value)  resendLoading,required TResult Function( ResendSuccess value)  resendSuccess,required TResult Function( ResendFailure value)  resendFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case VerifyLoading():
return verifyLoading(_that);case VerifySuccess():
return verifySuccess(_that);case VerifyFailure():
return verifyFailure(_that);case ResetLoading():
return resetLoading(_that);case ResetSuccess():
return resetSuccess(_that);case ResetFailure():
return resetFailure(_that);case ResendLoading():
return resendLoading(_that);case ResendSuccess():
return resendSuccess(_that);case ResendFailure():
return resendFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( VerifyLoading value)?  verifyLoading,TResult? Function( VerifySuccess value)?  verifySuccess,TResult? Function( VerifyFailure value)?  verifyFailure,TResult? Function( ResetLoading value)?  resetLoading,TResult? Function( ResetSuccess value)?  resetSuccess,TResult? Function( ResetFailure value)?  resetFailure,TResult? Function( ResendLoading value)?  resendLoading,TResult? Function( ResendSuccess value)?  resendSuccess,TResult? Function( ResendFailure value)?  resendFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case VerifyLoading() when verifyLoading != null:
return verifyLoading(_that);case VerifySuccess() when verifySuccess != null:
return verifySuccess(_that);case VerifyFailure() when verifyFailure != null:
return verifyFailure(_that);case ResetLoading() when resetLoading != null:
return resetLoading(_that);case ResetSuccess() when resetSuccess != null:
return resetSuccess(_that);case ResetFailure() when resetFailure != null:
return resetFailure(_that);case ResendLoading() when resendLoading != null:
return resendLoading(_that);case ResendSuccess() when resendSuccess != null:
return resendSuccess(_that);case ResendFailure() when resendFailure != null:
return resendFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  verifyLoading,TResult Function( String message)?  verifySuccess,TResult Function( String message)?  verifyFailure,TResult Function()?  resetLoading,TResult Function( String message)?  resetSuccess,TResult Function( String message)?  resetFailure,TResult Function()?  resendLoading,TResult Function( String message)?  resendSuccess,TResult Function( String message)?  resendFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case VerifyLoading() when verifyLoading != null:
return verifyLoading();case VerifySuccess() when verifySuccess != null:
return verifySuccess(_that.message);case VerifyFailure() when verifyFailure != null:
return verifyFailure(_that.message);case ResetLoading() when resetLoading != null:
return resetLoading();case ResetSuccess() when resetSuccess != null:
return resetSuccess(_that.message);case ResetFailure() when resetFailure != null:
return resetFailure(_that.message);case ResendLoading() when resendLoading != null:
return resendLoading();case ResendSuccess() when resendSuccess != null:
return resendSuccess(_that.message);case ResendFailure() when resendFailure != null:
return resendFailure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  verifyLoading,required TResult Function( String message)  verifySuccess,required TResult Function( String message)  verifyFailure,required TResult Function()  resetLoading,required TResult Function( String message)  resetSuccess,required TResult Function( String message)  resetFailure,required TResult Function()  resendLoading,required TResult Function( String message)  resendSuccess,required TResult Function( String message)  resendFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case VerifyLoading():
return verifyLoading();case VerifySuccess():
return verifySuccess(_that.message);case VerifyFailure():
return verifyFailure(_that.message);case ResetLoading():
return resetLoading();case ResetSuccess():
return resetSuccess(_that.message);case ResetFailure():
return resetFailure(_that.message);case ResendLoading():
return resendLoading();case ResendSuccess():
return resendSuccess(_that.message);case ResendFailure():
return resendFailure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  verifyLoading,TResult? Function( String message)?  verifySuccess,TResult? Function( String message)?  verifyFailure,TResult? Function()?  resetLoading,TResult? Function( String message)?  resetSuccess,TResult? Function( String message)?  resetFailure,TResult? Function()?  resendLoading,TResult? Function( String message)?  resendSuccess,TResult? Function( String message)?  resendFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case VerifyLoading() when verifyLoading != null:
return verifyLoading();case VerifySuccess() when verifySuccess != null:
return verifySuccess(_that.message);case VerifyFailure() when verifyFailure != null:
return verifyFailure(_that.message);case ResetLoading() when resetLoading != null:
return resetLoading();case ResetSuccess() when resetSuccess != null:
return resetSuccess(_that.message);case ResetFailure() when resetFailure != null:
return resetFailure(_that.message);case ResendLoading() when resendLoading != null:
return resendLoading();case ResendSuccess() when resendSuccess != null:
return resendSuccess(_that.message);case ResendFailure() when resendFailure != null:
return resendFailure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ResetPasswordState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResetPasswordState.initial()';
}


}




/// @nodoc


class VerifyLoading implements ResetPasswordState {
  const VerifyLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResetPasswordState.verifyLoading()';
}


}




/// @nodoc


class VerifySuccess implements ResetPasswordState {
  const VerifySuccess(this.message);
  

 final  String message;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifySuccessCopyWith<VerifySuccess> get copyWith => _$VerifySuccessCopyWithImpl<VerifySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifySuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ResetPasswordState.verifySuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class $VerifySuccessCopyWith<$Res> implements $ResetPasswordStateCopyWith<$Res> {
  factory $VerifySuccessCopyWith(VerifySuccess value, $Res Function(VerifySuccess) _then) = _$VerifySuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$VerifySuccessCopyWithImpl<$Res>
    implements $VerifySuccessCopyWith<$Res> {
  _$VerifySuccessCopyWithImpl(this._self, this._then);

  final VerifySuccess _self;
  final $Res Function(VerifySuccess) _then;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(VerifySuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VerifyFailure implements ResetPasswordState {
  const VerifyFailure(this.message);
  

 final  String message;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyFailureCopyWith<VerifyFailure> get copyWith => _$VerifyFailureCopyWithImpl<VerifyFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ResetPasswordState.verifyFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $VerifyFailureCopyWith<$Res> implements $ResetPasswordStateCopyWith<$Res> {
  factory $VerifyFailureCopyWith(VerifyFailure value, $Res Function(VerifyFailure) _then) = _$VerifyFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$VerifyFailureCopyWithImpl<$Res>
    implements $VerifyFailureCopyWith<$Res> {
  _$VerifyFailureCopyWithImpl(this._self, this._then);

  final VerifyFailure _self;
  final $Res Function(VerifyFailure) _then;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(VerifyFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResetLoading implements ResetPasswordState {
  const ResetLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResetPasswordState.resetLoading()';
}


}




/// @nodoc


class ResetSuccess implements ResetPasswordState {
  const ResetSuccess(this.message);
  

 final  String message;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetSuccessCopyWith<ResetSuccess> get copyWith => _$ResetSuccessCopyWithImpl<ResetSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ResetPasswordState.resetSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class $ResetSuccessCopyWith<$Res> implements $ResetPasswordStateCopyWith<$Res> {
  factory $ResetSuccessCopyWith(ResetSuccess value, $Res Function(ResetSuccess) _then) = _$ResetSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ResetSuccessCopyWithImpl<$Res>
    implements $ResetSuccessCopyWith<$Res> {
  _$ResetSuccessCopyWithImpl(this._self, this._then);

  final ResetSuccess _self;
  final $Res Function(ResetSuccess) _then;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ResetSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResetFailure implements ResetPasswordState {
  const ResetFailure(this.message);
  

 final  String message;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetFailureCopyWith<ResetFailure> get copyWith => _$ResetFailureCopyWithImpl<ResetFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ResetPasswordState.resetFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ResetFailureCopyWith<$Res> implements $ResetPasswordStateCopyWith<$Res> {
  factory $ResetFailureCopyWith(ResetFailure value, $Res Function(ResetFailure) _then) = _$ResetFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ResetFailureCopyWithImpl<$Res>
    implements $ResetFailureCopyWith<$Res> {
  _$ResetFailureCopyWithImpl(this._self, this._then);

  final ResetFailure _self;
  final $Res Function(ResetFailure) _then;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ResetFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResendLoading implements ResetPasswordState {
  const ResendLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResendLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResetPasswordState.resendLoading()';
}


}




/// @nodoc


class ResendSuccess implements ResetPasswordState {
  const ResendSuccess(this.message);
  

 final  String message;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResendSuccessCopyWith<ResendSuccess> get copyWith => _$ResendSuccessCopyWithImpl<ResendSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResendSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ResetPasswordState.resendSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class $ResendSuccessCopyWith<$Res> implements $ResetPasswordStateCopyWith<$Res> {
  factory $ResendSuccessCopyWith(ResendSuccess value, $Res Function(ResendSuccess) _then) = _$ResendSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ResendSuccessCopyWithImpl<$Res>
    implements $ResendSuccessCopyWith<$Res> {
  _$ResendSuccessCopyWithImpl(this._self, this._then);

  final ResendSuccess _self;
  final $Res Function(ResendSuccess) _then;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ResendSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResendFailure implements ResetPasswordState {
  const ResendFailure(this.message);
  

 final  String message;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResendFailureCopyWith<ResendFailure> get copyWith => _$ResendFailureCopyWithImpl<ResendFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResendFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ResetPasswordState.resendFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ResendFailureCopyWith<$Res> implements $ResetPasswordStateCopyWith<$Res> {
  factory $ResendFailureCopyWith(ResendFailure value, $Res Function(ResendFailure) _then) = _$ResendFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ResendFailureCopyWithImpl<$Res>
    implements $ResendFailureCopyWith<$Res> {
  _$ResendFailureCopyWithImpl(this._self, this._then);

  final ResendFailure _self;
  final $Res Function(ResendFailure) _then;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ResendFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
