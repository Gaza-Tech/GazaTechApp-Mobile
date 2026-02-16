// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marketplace_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MarketplaceState {

// Current category being viewed (slug-based key: 'all', or actual slug from DB)
 String get selectedCategory;// Categories fetched from DB
 List<CategoryModel> get categories; bool get isCategoriesLoading;// Listings data per category (cached)
 Map<String, List<ListingModel>> get listingsByCategory;// Pagination state per category
 Map<String, int> get currentPageByCategory; Map<String, bool> get hasMoreByCategory;// Loading states
 bool get isInitialLoading; bool get isLoadingMore;// Error state
 String? get errorMessage;// Total count per category
 Map<String, int> get totalCountByCategory;
/// Create a copy of MarketplaceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketplaceStateCopyWith<MarketplaceState> get copyWith => _$MarketplaceStateCopyWithImpl<MarketplaceState>(this as MarketplaceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketplaceState&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.isCategoriesLoading, isCategoriesLoading) || other.isCategoriesLoading == isCategoriesLoading)&&const DeepCollectionEquality().equals(other.listingsByCategory, listingsByCategory)&&const DeepCollectionEquality().equals(other.currentPageByCategory, currentPageByCategory)&&const DeepCollectionEquality().equals(other.hasMoreByCategory, hasMoreByCategory)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.totalCountByCategory, totalCountByCategory));
}


@override
int get hashCode => Object.hash(runtimeType,selectedCategory,const DeepCollectionEquality().hash(categories),isCategoriesLoading,const DeepCollectionEquality().hash(listingsByCategory),const DeepCollectionEquality().hash(currentPageByCategory),const DeepCollectionEquality().hash(hasMoreByCategory),isInitialLoading,isLoadingMore,errorMessage,const DeepCollectionEquality().hash(totalCountByCategory));

@override
String toString() {
  return 'MarketplaceState(selectedCategory: $selectedCategory, categories: $categories, isCategoriesLoading: $isCategoriesLoading, listingsByCategory: $listingsByCategory, currentPageByCategory: $currentPageByCategory, hasMoreByCategory: $hasMoreByCategory, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage, totalCountByCategory: $totalCountByCategory)';
}


}

/// @nodoc
abstract mixin class $MarketplaceStateCopyWith<$Res>  {
  factory $MarketplaceStateCopyWith(MarketplaceState value, $Res Function(MarketplaceState) _then) = _$MarketplaceStateCopyWithImpl;
@useResult
$Res call({
 String selectedCategory, List<CategoryModel> categories, bool isCategoriesLoading, Map<String, List<ListingModel>> listingsByCategory, Map<String, int> currentPageByCategory, Map<String, bool> hasMoreByCategory, bool isInitialLoading, bool isLoadingMore, String? errorMessage, Map<String, int> totalCountByCategory
});




}
/// @nodoc
class _$MarketplaceStateCopyWithImpl<$Res>
    implements $MarketplaceStateCopyWith<$Res> {
  _$MarketplaceStateCopyWithImpl(this._self, this._then);

  final MarketplaceState _self;
  final $Res Function(MarketplaceState) _then;

/// Create a copy of MarketplaceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedCategory = null,Object? categories = null,Object? isCategoriesLoading = null,Object? listingsByCategory = null,Object? currentPageByCategory = null,Object? hasMoreByCategory = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? errorMessage = freezed,Object? totalCountByCategory = null,}) {
  return _then(_self.copyWith(
selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,isCategoriesLoading: null == isCategoriesLoading ? _self.isCategoriesLoading : isCategoriesLoading // ignore: cast_nullable_to_non_nullable
as bool,listingsByCategory: null == listingsByCategory ? _self.listingsByCategory : listingsByCategory // ignore: cast_nullable_to_non_nullable
as Map<String, List<ListingModel>>,currentPageByCategory: null == currentPageByCategory ? _self.currentPageByCategory : currentPageByCategory // ignore: cast_nullable_to_non_nullable
as Map<String, int>,hasMoreByCategory: null == hasMoreByCategory ? _self.hasMoreByCategory : hasMoreByCategory // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,totalCountByCategory: null == totalCountByCategory ? _self.totalCountByCategory : totalCountByCategory // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketplaceState].
extension MarketplaceStatePatterns on MarketplaceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketplaceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketplaceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketplaceState value)  $default,){
final _that = this;
switch (_that) {
case _MarketplaceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketplaceState value)?  $default,){
final _that = this;
switch (_that) {
case _MarketplaceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String selectedCategory,  List<CategoryModel> categories,  bool isCategoriesLoading,  Map<String, List<ListingModel>> listingsByCategory,  Map<String, int> currentPageByCategory,  Map<String, bool> hasMoreByCategory,  bool isInitialLoading,  bool isLoadingMore,  String? errorMessage,  Map<String, int> totalCountByCategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketplaceState() when $default != null:
return $default(_that.selectedCategory,_that.categories,_that.isCategoriesLoading,_that.listingsByCategory,_that.currentPageByCategory,_that.hasMoreByCategory,_that.isInitialLoading,_that.isLoadingMore,_that.errorMessage,_that.totalCountByCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String selectedCategory,  List<CategoryModel> categories,  bool isCategoriesLoading,  Map<String, List<ListingModel>> listingsByCategory,  Map<String, int> currentPageByCategory,  Map<String, bool> hasMoreByCategory,  bool isInitialLoading,  bool isLoadingMore,  String? errorMessage,  Map<String, int> totalCountByCategory)  $default,) {final _that = this;
switch (_that) {
case _MarketplaceState():
return $default(_that.selectedCategory,_that.categories,_that.isCategoriesLoading,_that.listingsByCategory,_that.currentPageByCategory,_that.hasMoreByCategory,_that.isInitialLoading,_that.isLoadingMore,_that.errorMessage,_that.totalCountByCategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String selectedCategory,  List<CategoryModel> categories,  bool isCategoriesLoading,  Map<String, List<ListingModel>> listingsByCategory,  Map<String, int> currentPageByCategory,  Map<String, bool> hasMoreByCategory,  bool isInitialLoading,  bool isLoadingMore,  String? errorMessage,  Map<String, int> totalCountByCategory)?  $default,) {final _that = this;
switch (_that) {
case _MarketplaceState() when $default != null:
return $default(_that.selectedCategory,_that.categories,_that.isCategoriesLoading,_that.listingsByCategory,_that.currentPageByCategory,_that.hasMoreByCategory,_that.isInitialLoading,_that.isLoadingMore,_that.errorMessage,_that.totalCountByCategory);case _:
  return null;

}
}

}

/// @nodoc


class _MarketplaceState extends MarketplaceState {
  const _MarketplaceState({this.selectedCategory = 'all', final  List<CategoryModel> categories = const [], this.isCategoriesLoading = false, final  Map<String, List<ListingModel>> listingsByCategory = const {}, final  Map<String, int> currentPageByCategory = const {}, final  Map<String, bool> hasMoreByCategory = const {}, this.isInitialLoading = false, this.isLoadingMore = false, this.errorMessage, final  Map<String, int> totalCountByCategory = const {}}): _categories = categories,_listingsByCategory = listingsByCategory,_currentPageByCategory = currentPageByCategory,_hasMoreByCategory = hasMoreByCategory,_totalCountByCategory = totalCountByCategory,super._();
  

// Current category being viewed (slug-based key: 'all', or actual slug from DB)
@override@JsonKey() final  String selectedCategory;
// Categories fetched from DB
 final  List<CategoryModel> _categories;
// Categories fetched from DB
@override@JsonKey() List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override@JsonKey() final  bool isCategoriesLoading;
// Listings data per category (cached)
 final  Map<String, List<ListingModel>> _listingsByCategory;
// Listings data per category (cached)
@override@JsonKey() Map<String, List<ListingModel>> get listingsByCategory {
  if (_listingsByCategory is EqualUnmodifiableMapView) return _listingsByCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_listingsByCategory);
}

// Pagination state per category
 final  Map<String, int> _currentPageByCategory;
// Pagination state per category
@override@JsonKey() Map<String, int> get currentPageByCategory {
  if (_currentPageByCategory is EqualUnmodifiableMapView) return _currentPageByCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_currentPageByCategory);
}

 final  Map<String, bool> _hasMoreByCategory;
@override@JsonKey() Map<String, bool> get hasMoreByCategory {
  if (_hasMoreByCategory is EqualUnmodifiableMapView) return _hasMoreByCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_hasMoreByCategory);
}

// Loading states
@override@JsonKey() final  bool isInitialLoading;
@override@JsonKey() final  bool isLoadingMore;
// Error state
@override final  String? errorMessage;
// Total count per category
 final  Map<String, int> _totalCountByCategory;
// Total count per category
@override@JsonKey() Map<String, int> get totalCountByCategory {
  if (_totalCountByCategory is EqualUnmodifiableMapView) return _totalCountByCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_totalCountByCategory);
}


/// Create a copy of MarketplaceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketplaceStateCopyWith<_MarketplaceState> get copyWith => __$MarketplaceStateCopyWithImpl<_MarketplaceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketplaceState&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.isCategoriesLoading, isCategoriesLoading) || other.isCategoriesLoading == isCategoriesLoading)&&const DeepCollectionEquality().equals(other._listingsByCategory, _listingsByCategory)&&const DeepCollectionEquality().equals(other._currentPageByCategory, _currentPageByCategory)&&const DeepCollectionEquality().equals(other._hasMoreByCategory, _hasMoreByCategory)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._totalCountByCategory, _totalCountByCategory));
}


@override
int get hashCode => Object.hash(runtimeType,selectedCategory,const DeepCollectionEquality().hash(_categories),isCategoriesLoading,const DeepCollectionEquality().hash(_listingsByCategory),const DeepCollectionEquality().hash(_currentPageByCategory),const DeepCollectionEquality().hash(_hasMoreByCategory),isInitialLoading,isLoadingMore,errorMessage,const DeepCollectionEquality().hash(_totalCountByCategory));

@override
String toString() {
  return 'MarketplaceState(selectedCategory: $selectedCategory, categories: $categories, isCategoriesLoading: $isCategoriesLoading, listingsByCategory: $listingsByCategory, currentPageByCategory: $currentPageByCategory, hasMoreByCategory: $hasMoreByCategory, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage, totalCountByCategory: $totalCountByCategory)';
}


}

/// @nodoc
abstract mixin class _$MarketplaceStateCopyWith<$Res> implements $MarketplaceStateCopyWith<$Res> {
  factory _$MarketplaceStateCopyWith(_MarketplaceState value, $Res Function(_MarketplaceState) _then) = __$MarketplaceStateCopyWithImpl;
@override @useResult
$Res call({
 String selectedCategory, List<CategoryModel> categories, bool isCategoriesLoading, Map<String, List<ListingModel>> listingsByCategory, Map<String, int> currentPageByCategory, Map<String, bool> hasMoreByCategory, bool isInitialLoading, bool isLoadingMore, String? errorMessage, Map<String, int> totalCountByCategory
});




}
/// @nodoc
class __$MarketplaceStateCopyWithImpl<$Res>
    implements _$MarketplaceStateCopyWith<$Res> {
  __$MarketplaceStateCopyWithImpl(this._self, this._then);

  final _MarketplaceState _self;
  final $Res Function(_MarketplaceState) _then;

/// Create a copy of MarketplaceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedCategory = null,Object? categories = null,Object? isCategoriesLoading = null,Object? listingsByCategory = null,Object? currentPageByCategory = null,Object? hasMoreByCategory = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? errorMessage = freezed,Object? totalCountByCategory = null,}) {
  return _then(_MarketplaceState(
selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,isCategoriesLoading: null == isCategoriesLoading ? _self.isCategoriesLoading : isCategoriesLoading // ignore: cast_nullable_to_non_nullable
as bool,listingsByCategory: null == listingsByCategory ? _self._listingsByCategory : listingsByCategory // ignore: cast_nullable_to_non_nullable
as Map<String, List<ListingModel>>,currentPageByCategory: null == currentPageByCategory ? _self._currentPageByCategory : currentPageByCategory // ignore: cast_nullable_to_non_nullable
as Map<String, int>,hasMoreByCategory: null == hasMoreByCategory ? _self._hasMoreByCategory : hasMoreByCategory // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,totalCountByCategory: null == totalCountByCategory ? _self._totalCountByCategory : totalCountByCategory // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}


}

// dart format on
