// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchFilter {

 Set<String> get categories; DateRange? get dateRange; Set<EngagementLevel> get engagementLevels; CommunitySort get sort;
/// Create a copy of SearchFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchFilterCopyWith<SearchFilter> get copyWith => _$SearchFilterCopyWithImpl<SearchFilter>(this as SearchFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchFilter&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&const DeepCollectionEquality().equals(other.engagementLevels, engagementLevels)&&(identical(other.sort, sort) || other.sort == sort));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),dateRange,const DeepCollectionEquality().hash(engagementLevels),sort);

@override
String toString() {
  return 'SearchFilter(categories: $categories, dateRange: $dateRange, engagementLevels: $engagementLevels, sort: $sort)';
}


}

/// @nodoc
abstract mixin class $SearchFilterCopyWith<$Res>  {
  factory $SearchFilterCopyWith(SearchFilter value, $Res Function(SearchFilter) _then) = _$SearchFilterCopyWithImpl;
@useResult
$Res call({
 Set<String> categories, DateRange? dateRange, Set<EngagementLevel> engagementLevels, CommunitySort sort
});




}
/// @nodoc
class _$SearchFilterCopyWithImpl<$Res>
    implements $SearchFilterCopyWith<$Res> {
  _$SearchFilterCopyWithImpl(this._self, this._then);

  final SearchFilter _self;
  final $Res Function(SearchFilter) _then;

/// Create a copy of SearchFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? dateRange = freezed,Object? engagementLevels = null,Object? sort = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as Set<String>,dateRange: freezed == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as DateRange?,engagementLevels: null == engagementLevels ? _self.engagementLevels : engagementLevels // ignore: cast_nullable_to_non_nullable
as Set<EngagementLevel>,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as CommunitySort,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchFilter].
extension SearchFilterPatterns on SearchFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchFilter value)  $default,){
final _that = this;
switch (_that) {
case _SearchFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchFilter value)?  $default,){
final _that = this;
switch (_that) {
case _SearchFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<String> categories,  DateRange? dateRange,  Set<EngagementLevel> engagementLevels,  CommunitySort sort)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchFilter() when $default != null:
return $default(_that.categories,_that.dateRange,_that.engagementLevels,_that.sort);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<String> categories,  DateRange? dateRange,  Set<EngagementLevel> engagementLevels,  CommunitySort sort)  $default,) {final _that = this;
switch (_that) {
case _SearchFilter():
return $default(_that.categories,_that.dateRange,_that.engagementLevels,_that.sort);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<String> categories,  DateRange? dateRange,  Set<EngagementLevel> engagementLevels,  CommunitySort sort)?  $default,) {final _that = this;
switch (_that) {
case _SearchFilter() when $default != null:
return $default(_that.categories,_that.dateRange,_that.engagementLevels,_that.sort);case _:
  return null;

}
}

}

/// @nodoc


class _SearchFilter extends SearchFilter {
  const _SearchFilter({final  Set<String> categories = const <String>{}, this.dateRange, final  Set<EngagementLevel> engagementLevels = const <EngagementLevel>{}, this.sort = CommunitySort.newest}): _categories = categories,_engagementLevels = engagementLevels,super._();
  

 final  Set<String> _categories;
@override@JsonKey() Set<String> get categories {
  if (_categories is EqualUnmodifiableSetView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_categories);
}

@override final  DateRange? dateRange;
 final  Set<EngagementLevel> _engagementLevels;
@override@JsonKey() Set<EngagementLevel> get engagementLevels {
  if (_engagementLevels is EqualUnmodifiableSetView) return _engagementLevels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_engagementLevels);
}

@override@JsonKey() final  CommunitySort sort;

/// Create a copy of SearchFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchFilterCopyWith<_SearchFilter> get copyWith => __$SearchFilterCopyWithImpl<_SearchFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchFilter&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&const DeepCollectionEquality().equals(other._engagementLevels, _engagementLevels)&&(identical(other.sort, sort) || other.sort == sort));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),dateRange,const DeepCollectionEquality().hash(_engagementLevels),sort);

@override
String toString() {
  return 'SearchFilter(categories: $categories, dateRange: $dateRange, engagementLevels: $engagementLevels, sort: $sort)';
}


}

/// @nodoc
abstract mixin class _$SearchFilterCopyWith<$Res> implements $SearchFilterCopyWith<$Res> {
  factory _$SearchFilterCopyWith(_SearchFilter value, $Res Function(_SearchFilter) _then) = __$SearchFilterCopyWithImpl;
@override @useResult
$Res call({
 Set<String> categories, DateRange? dateRange, Set<EngagementLevel> engagementLevels, CommunitySort sort
});




}
/// @nodoc
class __$SearchFilterCopyWithImpl<$Res>
    implements _$SearchFilterCopyWith<$Res> {
  __$SearchFilterCopyWithImpl(this._self, this._then);

  final _SearchFilter _self;
  final $Res Function(_SearchFilter) _then;

/// Create a copy of SearchFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? dateRange = freezed,Object? engagementLevels = null,Object? sort = null,}) {
  return _then(_SearchFilter(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as Set<String>,dateRange: freezed == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as DateRange?,engagementLevels: null == engagementLevels ? _self._engagementLevels : engagementLevels // ignore: cast_nullable_to_non_nullable
as Set<EngagementLevel>,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as CommunitySort,
  ));
}


}

// dart format on
