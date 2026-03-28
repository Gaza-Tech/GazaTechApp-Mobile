// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_listing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddListingState {

// Form data from DB
 List<CategoryModel> get categories; List<LocationModel> get locations; bool get isLoadingFormData;// Edit mode
 bool get isEditMode;// Submission
 bool get isSubmitting; bool get submitSuccess;// Error
 String? get errorMessage;
/// Create a copy of AddListingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddListingStateCopyWith<AddListingState> get copyWith => _$AddListingStateCopyWithImpl<AddListingState>(this as AddListingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddListingState&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.locations, locations)&&(identical(other.isLoadingFormData, isLoadingFormData) || other.isLoadingFormData == isLoadingFormData)&&(identical(other.isEditMode, isEditMode) || other.isEditMode == isEditMode)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.submitSuccess, submitSuccess) || other.submitSuccess == submitSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(locations),isLoadingFormData,isEditMode,isSubmitting,submitSuccess,errorMessage);

@override
String toString() {
  return 'AddListingState(categories: $categories, locations: $locations, isLoadingFormData: $isLoadingFormData, isEditMode: $isEditMode, isSubmitting: $isSubmitting, submitSuccess: $submitSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AddListingStateCopyWith<$Res>  {
  factory $AddListingStateCopyWith(AddListingState value, $Res Function(AddListingState) _then) = _$AddListingStateCopyWithImpl;
@useResult
$Res call({
 List<CategoryModel> categories, List<LocationModel> locations, bool isLoadingFormData, bool isEditMode, bool isSubmitting, bool submitSuccess, String? errorMessage
});




}
/// @nodoc
class _$AddListingStateCopyWithImpl<$Res>
    implements $AddListingStateCopyWith<$Res> {
  _$AddListingStateCopyWithImpl(this._self, this._then);

  final AddListingState _self;
  final $Res Function(AddListingState) _then;

/// Create a copy of AddListingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? locations = null,Object? isLoadingFormData = null,Object? isEditMode = null,Object? isSubmitting = null,Object? submitSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<LocationModel>,isLoadingFormData: null == isLoadingFormData ? _self.isLoadingFormData : isLoadingFormData // ignore: cast_nullable_to_non_nullable
as bool,isEditMode: null == isEditMode ? _self.isEditMode : isEditMode // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,submitSuccess: null == submitSuccess ? _self.submitSuccess : submitSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddListingState].
extension AddListingStatePatterns on AddListingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddListingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddListingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddListingState value)  $default,){
final _that = this;
switch (_that) {
case _AddListingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddListingState value)?  $default,){
final _that = this;
switch (_that) {
case _AddListingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CategoryModel> categories,  List<LocationModel> locations,  bool isLoadingFormData,  bool isEditMode,  bool isSubmitting,  bool submitSuccess,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddListingState() when $default != null:
return $default(_that.categories,_that.locations,_that.isLoadingFormData,_that.isEditMode,_that.isSubmitting,_that.submitSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CategoryModel> categories,  List<LocationModel> locations,  bool isLoadingFormData,  bool isEditMode,  bool isSubmitting,  bool submitSuccess,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AddListingState():
return $default(_that.categories,_that.locations,_that.isLoadingFormData,_that.isEditMode,_that.isSubmitting,_that.submitSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CategoryModel> categories,  List<LocationModel> locations,  bool isLoadingFormData,  bool isEditMode,  bool isSubmitting,  bool submitSuccess,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AddListingState() when $default != null:
return $default(_that.categories,_that.locations,_that.isLoadingFormData,_that.isEditMode,_that.isSubmitting,_that.submitSuccess,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AddListingState implements AddListingState {
  const _AddListingState({final  List<CategoryModel> categories = const [], final  List<LocationModel> locations = const [], this.isLoadingFormData = false, this.isEditMode = false, this.isSubmitting = false, this.submitSuccess = false, this.errorMessage}): _categories = categories,_locations = locations;
  

// Form data from DB
 final  List<CategoryModel> _categories;
// Form data from DB
@override@JsonKey() List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<LocationModel> _locations;
@override@JsonKey() List<LocationModel> get locations {
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locations);
}

@override@JsonKey() final  bool isLoadingFormData;
// Edit mode
@override@JsonKey() final  bool isEditMode;
// Submission
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool submitSuccess;
// Error
@override final  String? errorMessage;

/// Create a copy of AddListingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddListingStateCopyWith<_AddListingState> get copyWith => __$AddListingStateCopyWithImpl<_AddListingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddListingState&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._locations, _locations)&&(identical(other.isLoadingFormData, isLoadingFormData) || other.isLoadingFormData == isLoadingFormData)&&(identical(other.isEditMode, isEditMode) || other.isEditMode == isEditMode)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.submitSuccess, submitSuccess) || other.submitSuccess == submitSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_locations),isLoadingFormData,isEditMode,isSubmitting,submitSuccess,errorMessage);

@override
String toString() {
  return 'AddListingState(categories: $categories, locations: $locations, isLoadingFormData: $isLoadingFormData, isEditMode: $isEditMode, isSubmitting: $isSubmitting, submitSuccess: $submitSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AddListingStateCopyWith<$Res> implements $AddListingStateCopyWith<$Res> {
  factory _$AddListingStateCopyWith(_AddListingState value, $Res Function(_AddListingState) _then) = __$AddListingStateCopyWithImpl;
@override @useResult
$Res call({
 List<CategoryModel> categories, List<LocationModel> locations, bool isLoadingFormData, bool isEditMode, bool isSubmitting, bool submitSuccess, String? errorMessage
});




}
/// @nodoc
class __$AddListingStateCopyWithImpl<$Res>
    implements _$AddListingStateCopyWith<$Res> {
  __$AddListingStateCopyWithImpl(this._self, this._then);

  final _AddListingState _self;
  final $Res Function(_AddListingState) _then;

/// Create a copy of AddListingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? locations = null,Object? isLoadingFormData = null,Object? isEditMode = null,Object? isSubmitting = null,Object? submitSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_AddListingState(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,locations: null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<LocationModel>,isLoadingFormData: null == isLoadingFormData ? _self.isLoadingFormData : isLoadingFormData // ignore: cast_nullable_to_non_nullable
as bool,isEditMode: null == isEditMode ? _self.isEditMode : isEditMode // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,submitSuccess: null == submitSuccess ? _self.submitSuccess : submitSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
