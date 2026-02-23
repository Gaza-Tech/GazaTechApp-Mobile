// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_filters_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchFiltersModel {

 String? get categoryId; String? get categoryName; String? get locationId; String? get locationName; List<String> get conditions; int? get priceMin; int? get priceMax; SearchSortOption get sort;
/// Create a copy of SearchFiltersModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchFiltersModelCopyWith<SearchFiltersModel> get copyWith => _$SearchFiltersModelCopyWithImpl<SearchFiltersModel>(this as SearchFiltersModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchFiltersModel&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&const DeepCollectionEquality().equals(other.conditions, conditions)&&(identical(other.priceMin, priceMin) || other.priceMin == priceMin)&&(identical(other.priceMax, priceMax) || other.priceMax == priceMax)&&(identical(other.sort, sort) || other.sort == sort));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,locationId,locationName,const DeepCollectionEquality().hash(conditions),priceMin,priceMax,sort);

@override
String toString() {
  return 'SearchFiltersModel(categoryId: $categoryId, categoryName: $categoryName, locationId: $locationId, locationName: $locationName, conditions: $conditions, priceMin: $priceMin, priceMax: $priceMax, sort: $sort)';
}


}

/// @nodoc
abstract mixin class $SearchFiltersModelCopyWith<$Res>  {
  factory $SearchFiltersModelCopyWith(SearchFiltersModel value, $Res Function(SearchFiltersModel) _then) = _$SearchFiltersModelCopyWithImpl;
@useResult
$Res call({
 String? categoryId, String? categoryName, String? locationId, String? locationName, List<String> conditions, int? priceMin, int? priceMax, SearchSortOption sort
});




}
/// @nodoc
class _$SearchFiltersModelCopyWithImpl<$Res>
    implements $SearchFiltersModelCopyWith<$Res> {
  _$SearchFiltersModelCopyWithImpl(this._self, this._then);

  final SearchFiltersModel _self;
  final $Res Function(SearchFiltersModel) _then;

/// Create a copy of SearchFiltersModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = freezed,Object? categoryName = freezed,Object? locationId = freezed,Object? locationName = freezed,Object? conditions = null,Object? priceMin = freezed,Object? priceMax = freezed,Object? sort = null,}) {
  return _then(_self.copyWith(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as String?,locationName: freezed == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String?,conditions: null == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as List<String>,priceMin: freezed == priceMin ? _self.priceMin : priceMin // ignore: cast_nullable_to_non_nullable
as int?,priceMax: freezed == priceMax ? _self.priceMax : priceMax // ignore: cast_nullable_to_non_nullable
as int?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as SearchSortOption,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchFiltersModel].
extension SearchFiltersModelPatterns on SearchFiltersModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchFiltersModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchFiltersModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchFiltersModel value)  $default,){
final _that = this;
switch (_that) {
case _SearchFiltersModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchFiltersModel value)?  $default,){
final _that = this;
switch (_that) {
case _SearchFiltersModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? categoryId,  String? categoryName,  String? locationId,  String? locationName,  List<String> conditions,  int? priceMin,  int? priceMax,  SearchSortOption sort)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchFiltersModel() when $default != null:
return $default(_that.categoryId,_that.categoryName,_that.locationId,_that.locationName,_that.conditions,_that.priceMin,_that.priceMax,_that.sort);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? categoryId,  String? categoryName,  String? locationId,  String? locationName,  List<String> conditions,  int? priceMin,  int? priceMax,  SearchSortOption sort)  $default,) {final _that = this;
switch (_that) {
case _SearchFiltersModel():
return $default(_that.categoryId,_that.categoryName,_that.locationId,_that.locationName,_that.conditions,_that.priceMin,_that.priceMax,_that.sort);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? categoryId,  String? categoryName,  String? locationId,  String? locationName,  List<String> conditions,  int? priceMin,  int? priceMax,  SearchSortOption sort)?  $default,) {final _that = this;
switch (_that) {
case _SearchFiltersModel() when $default != null:
return $default(_that.categoryId,_that.categoryName,_that.locationId,_that.locationName,_that.conditions,_that.priceMin,_that.priceMax,_that.sort);case _:
  return null;

}
}

}

/// @nodoc


class _SearchFiltersModel extends SearchFiltersModel {
  const _SearchFiltersModel({this.categoryId = null, this.categoryName = null, this.locationId = null, this.locationName = null, final  List<String> conditions = const [], this.priceMin = null, this.priceMax = null, this.sort = SearchSortOption.newest}): _conditions = conditions,super._();
  

@override@JsonKey() final  String? categoryId;
@override@JsonKey() final  String? categoryName;
@override@JsonKey() final  String? locationId;
@override@JsonKey() final  String? locationName;
 final  List<String> _conditions;
@override@JsonKey() List<String> get conditions {
  if (_conditions is EqualUnmodifiableListView) return _conditions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conditions);
}

@override@JsonKey() final  int? priceMin;
@override@JsonKey() final  int? priceMax;
@override@JsonKey() final  SearchSortOption sort;

/// Create a copy of SearchFiltersModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchFiltersModelCopyWith<_SearchFiltersModel> get copyWith => __$SearchFiltersModelCopyWithImpl<_SearchFiltersModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchFiltersModel&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&const DeepCollectionEquality().equals(other._conditions, _conditions)&&(identical(other.priceMin, priceMin) || other.priceMin == priceMin)&&(identical(other.priceMax, priceMax) || other.priceMax == priceMax)&&(identical(other.sort, sort) || other.sort == sort));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,locationId,locationName,const DeepCollectionEquality().hash(_conditions),priceMin,priceMax,sort);

@override
String toString() {
  return 'SearchFiltersModel(categoryId: $categoryId, categoryName: $categoryName, locationId: $locationId, locationName: $locationName, conditions: $conditions, priceMin: $priceMin, priceMax: $priceMax, sort: $sort)';
}


}

/// @nodoc
abstract mixin class _$SearchFiltersModelCopyWith<$Res> implements $SearchFiltersModelCopyWith<$Res> {
  factory _$SearchFiltersModelCopyWith(_SearchFiltersModel value, $Res Function(_SearchFiltersModel) _then) = __$SearchFiltersModelCopyWithImpl;
@override @useResult
$Res call({
 String? categoryId, String? categoryName, String? locationId, String? locationName, List<String> conditions, int? priceMin, int? priceMax, SearchSortOption sort
});




}
/// @nodoc
class __$SearchFiltersModelCopyWithImpl<$Res>
    implements _$SearchFiltersModelCopyWith<$Res> {
  __$SearchFiltersModelCopyWithImpl(this._self, this._then);

  final _SearchFiltersModel _self;
  final $Res Function(_SearchFiltersModel) _then;

/// Create a copy of SearchFiltersModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,Object? categoryName = freezed,Object? locationId = freezed,Object? locationName = freezed,Object? conditions = null,Object? priceMin = freezed,Object? priceMax = freezed,Object? sort = null,}) {
  return _then(_SearchFiltersModel(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as String?,locationName: freezed == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String?,conditions: null == conditions ? _self._conditions : conditions // ignore: cast_nullable_to_non_nullable
as List<String>,priceMin: freezed == priceMin ? _self.priceMin : priceMin // ignore: cast_nullable_to_non_nullable
as int?,priceMax: freezed == priceMax ? _self.priceMax : priceMax // ignore: cast_nullable_to_non_nullable
as int?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as SearchSortOption,
  ));
}


}

// dart format on
