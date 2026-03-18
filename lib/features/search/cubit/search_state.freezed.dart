// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marketplace_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {

 String get keyword; MarketplaceSearchFiltersModel get filters; List<String> get recentSearches;// Filter dropdown data
 List<CategoryModel> get categories; List<LocationModel> get locations; bool get isFilterDataLoading;// Search results
 List<ListingModel> get results; int get currentPage; bool get hasMore;// Loading states
 bool get isSearching; bool get isLoadingMore;// Error
 String? get errorMessage;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<MarketplaceSearchState> get copyWith => _$SearchStateCopyWithImpl<MarketplaceSearchState>(this as MarketplaceSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketplaceSearchState&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.filters, filters) || other.filters == filters)&&const DeepCollectionEquality().equals(other.recentSearches, recentSearches)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.locations, locations)&&(identical(other.isFilterDataLoading, isFilterDataLoading) || other.isFilterDataLoading == isFilterDataLoading)&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,keyword,filters,const DeepCollectionEquality().hash(recentSearches),const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(locations),isFilterDataLoading,const DeepCollectionEquality().hash(results),currentPage,hasMore,isSearching,isLoadingMore,errorMessage);

@override
String toString() {
  return 'SearchState(keyword: $keyword, filters: $filters, recentSearches: $recentSearches, categories: $categories, locations: $locations, isFilterDataLoading: $isFilterDataLoading, results: $results, currentPage: $currentPage, hasMore: $hasMore, isSearching: $isSearching, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(MarketplaceSearchState value, $Res Function(MarketplaceSearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 String keyword, MarketplaceSearchFiltersModel filters, List<String> recentSearches, List<CategoryModel> categories, List<LocationModel> locations, bool isFilterDataLoading, List<ListingModel> results, int currentPage, bool hasMore, bool isSearching, bool isLoadingMore, String? errorMessage
});


$SearchFiltersModelCopyWith<$Res> get filters;

}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final MarketplaceSearchState _self;
  final $Res Function(MarketplaceSearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keyword = null,Object? filters = null,Object? recentSearches = null,Object? categories = null,Object? locations = null,Object? isFilterDataLoading = null,Object? results = null,Object? currentPage = null,Object? hasMore = null,Object? isSearching = null,Object? isLoadingMore = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as MarketplaceSearchFiltersModel,recentSearches: null == recentSearches ? _self.recentSearches : recentSearches // ignore: cast_nullable_to_non_nullable
as List<String>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<LocationModel>,isFilterDataLoading: null == isFilterDataLoading ? _self.isFilterDataLoading : isFilterDataLoading // ignore: cast_nullable_to_non_nullable
as bool,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<ListingModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchFiltersModelCopyWith<$Res> get filters {
  
  return $SearchFiltersModelCopyWith<$Res>(_self.filters, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}


/// Adds pattern-matching-related methods to [MarketplaceSearchState].
extension SearchStatePatterns on MarketplaceSearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String keyword,  MarketplaceSearchFiltersModel filters,  List<String> recentSearches,  List<CategoryModel> categories,  List<LocationModel> locations,  bool isFilterDataLoading,  List<ListingModel> results,  int currentPage,  bool hasMore,  bool isSearching,  bool isLoadingMore,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.keyword,_that.filters,_that.recentSearches,_that.categories,_that.locations,_that.isFilterDataLoading,_that.results,_that.currentPage,_that.hasMore,_that.isSearching,_that.isLoadingMore,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String keyword,  MarketplaceSearchFiltersModel filters,  List<String> recentSearches,  List<CategoryModel> categories,  List<LocationModel> locations,  bool isFilterDataLoading,  List<ListingModel> results,  int currentPage,  bool hasMore,  bool isSearching,  bool isLoadingMore,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.keyword,_that.filters,_that.recentSearches,_that.categories,_that.locations,_that.isFilterDataLoading,_that.results,_that.currentPage,_that.hasMore,_that.isSearching,_that.isLoadingMore,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String keyword,  MarketplaceSearchFiltersModel filters,  List<String> recentSearches,  List<CategoryModel> categories,  List<LocationModel> locations,  bool isFilterDataLoading,  List<ListingModel> results,  int currentPage,  bool hasMore,  bool isSearching,  bool isLoadingMore,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.keyword,_that.filters,_that.recentSearches,_that.categories,_that.locations,_that.isFilterDataLoading,_that.results,_that.currentPage,_that.hasMore,_that.isSearching,_that.isLoadingMore,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState extends MarketplaceSearchState {
  const _SearchState({this.keyword = '', this.filters = const MarketplaceSearchFiltersModel(), final  List<String> recentSearches = const [], final  List<CategoryModel> categories = const [], final  List<LocationModel> locations = const [], this.isFilterDataLoading = false, final  List<ListingModel> results = const [], this.currentPage = 0, this.hasMore = true, this.isSearching = false, this.isLoadingMore = false, this.errorMessage}): _recentSearches = recentSearches,_categories = categories,_locations = locations,_results = results,super._();
  

@override@JsonKey() final  String keyword;
@override@JsonKey() final  MarketplaceSearchFiltersModel filters;
 final  List<String> _recentSearches;
@override@JsonKey() List<String> get recentSearches {
  if (_recentSearches is EqualUnmodifiableListView) return _recentSearches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSearches);
}

// Filter dropdown data
 final  List<CategoryModel> _categories;
// Filter dropdown data
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

@override@JsonKey() final  bool isFilterDataLoading;
// Search results
 final  List<ListingModel> _results;
// Search results
@override@JsonKey() List<ListingModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasMore;
// Loading states
@override@JsonKey() final  bool isSearching;
@override@JsonKey() final  bool isLoadingMore;
// Error
@override final  String? errorMessage;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.filters, filters) || other.filters == filters)&&const DeepCollectionEquality().equals(other._recentSearches, _recentSearches)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._locations, _locations)&&(identical(other.isFilterDataLoading, isFilterDataLoading) || other.isFilterDataLoading == isFilterDataLoading)&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,keyword,filters,const DeepCollectionEquality().hash(_recentSearches),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_locations),isFilterDataLoading,const DeepCollectionEquality().hash(_results),currentPage,hasMore,isSearching,isLoadingMore,errorMessage);

@override
String toString() {
  return 'SearchState(keyword: $keyword, filters: $filters, recentSearches: $recentSearches, categories: $categories, locations: $locations, isFilterDataLoading: $isFilterDataLoading, results: $results, currentPage: $currentPage, hasMore: $hasMore, isSearching: $isSearching, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 String keyword, MarketplaceSearchFiltersModel filters, List<String> recentSearches, List<CategoryModel> categories, List<LocationModel> locations, bool isFilterDataLoading, List<ListingModel> results, int currentPage, bool hasMore, bool isSearching, bool isLoadingMore, String? errorMessage
});


@override $SearchFiltersModelCopyWith<$Res> get filters;

}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keyword = null,Object? filters = null,Object? recentSearches = null,Object? categories = null,Object? locations = null,Object? isFilterDataLoading = null,Object? results = null,Object? currentPage = null,Object? hasMore = null,Object? isSearching = null,Object? isLoadingMore = null,Object? errorMessage = freezed,}) {
  return _then(_SearchState(
keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as MarketplaceSearchFiltersModel,recentSearches: null == recentSearches ? _self._recentSearches : recentSearches // ignore: cast_nullable_to_non_nullable
as List<String>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,locations: null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<LocationModel>,isFilterDataLoading: null == isFilterDataLoading ? _self.isFilterDataLoading : isFilterDataLoading // ignore: cast_nullable_to_non_nullable
as bool,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<ListingModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchFiltersModelCopyWith<$Res> get filters {
  
  return $SearchFiltersModelCopyWith<$Res>(_self.filters, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}

// dart format on
