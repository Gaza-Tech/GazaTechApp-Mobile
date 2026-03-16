// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommunitySearchState {

 String get keyword; List<PostModel> get results; int get currentPage; bool get hasMore; bool get isSearching; bool get isLoadingMore; List<String> get recentSearches; String? get errorMessage; Set<String> get likedPostIds; Set<String> get bookmarkedPostIds;
/// Create a copy of CommunitySearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunitySearchStateCopyWith<CommunitySearchState> get copyWith => _$CommunitySearchStateCopyWithImpl<CommunitySearchState>(this as CommunitySearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunitySearchState&&(identical(other.keyword, keyword) || other.keyword == keyword)&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&const DeepCollectionEquality().equals(other.recentSearches, recentSearches)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.likedPostIds, likedPostIds)&&const DeepCollectionEquality().equals(other.bookmarkedPostIds, bookmarkedPostIds));
}


@override
int get hashCode => Object.hash(runtimeType,keyword,const DeepCollectionEquality().hash(results),currentPage,hasMore,isSearching,isLoadingMore,const DeepCollectionEquality().hash(recentSearches),errorMessage,const DeepCollectionEquality().hash(likedPostIds),const DeepCollectionEquality().hash(bookmarkedPostIds));

@override
String toString() {
  return 'CommunitySearchState(keyword: $keyword, results: $results, currentPage: $currentPage, hasMore: $hasMore, isSearching: $isSearching, isLoadingMore: $isLoadingMore, recentSearches: $recentSearches, errorMessage: $errorMessage, likedPostIds: $likedPostIds, bookmarkedPostIds: $bookmarkedPostIds)';
}


}

/// @nodoc
abstract mixin class $CommunitySearchStateCopyWith<$Res>  {
  factory $CommunitySearchStateCopyWith(CommunitySearchState value, $Res Function(CommunitySearchState) _then) = _$CommunitySearchStateCopyWithImpl;
@useResult
$Res call({
 String keyword, List<PostModel> results, int currentPage, bool hasMore, bool isSearching, bool isLoadingMore, List<String> recentSearches, String? errorMessage, Set<String> likedPostIds, Set<String> bookmarkedPostIds
});




}
/// @nodoc
class _$CommunitySearchStateCopyWithImpl<$Res>
    implements $CommunitySearchStateCopyWith<$Res> {
  _$CommunitySearchStateCopyWithImpl(this._self, this._then);

  final CommunitySearchState _self;
  final $Res Function(CommunitySearchState) _then;

/// Create a copy of CommunitySearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keyword = null,Object? results = null,Object? currentPage = null,Object? hasMore = null,Object? isSearching = null,Object? isLoadingMore = null,Object? recentSearches = null,Object? errorMessage = freezed,Object? likedPostIds = null,Object? bookmarkedPostIds = null,}) {
  return _then(_self.copyWith(
keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<PostModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,recentSearches: null == recentSearches ? _self.recentSearches : recentSearches // ignore: cast_nullable_to_non_nullable
as List<String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,likedPostIds: null == likedPostIds ? _self.likedPostIds : likedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,bookmarkedPostIds: null == bookmarkedPostIds ? _self.bookmarkedPostIds : bookmarkedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CommunitySearchState].
extension CommunitySearchStatePatterns on CommunitySearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunitySearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunitySearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunitySearchState value)  $default,){
final _that = this;
switch (_that) {
case _CommunitySearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunitySearchState value)?  $default,){
final _that = this;
switch (_that) {
case _CommunitySearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String keyword,  List<PostModel> results,  int currentPage,  bool hasMore,  bool isSearching,  bool isLoadingMore,  List<String> recentSearches,  String? errorMessage,  Set<String> likedPostIds,  Set<String> bookmarkedPostIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunitySearchState() when $default != null:
return $default(_that.keyword,_that.results,_that.currentPage,_that.hasMore,_that.isSearching,_that.isLoadingMore,_that.recentSearches,_that.errorMessage,_that.likedPostIds,_that.bookmarkedPostIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String keyword,  List<PostModel> results,  int currentPage,  bool hasMore,  bool isSearching,  bool isLoadingMore,  List<String> recentSearches,  String? errorMessage,  Set<String> likedPostIds,  Set<String> bookmarkedPostIds)  $default,) {final _that = this;
switch (_that) {
case _CommunitySearchState():
return $default(_that.keyword,_that.results,_that.currentPage,_that.hasMore,_that.isSearching,_that.isLoadingMore,_that.recentSearches,_that.errorMessage,_that.likedPostIds,_that.bookmarkedPostIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String keyword,  List<PostModel> results,  int currentPage,  bool hasMore,  bool isSearching,  bool isLoadingMore,  List<String> recentSearches,  String? errorMessage,  Set<String> likedPostIds,  Set<String> bookmarkedPostIds)?  $default,) {final _that = this;
switch (_that) {
case _CommunitySearchState() when $default != null:
return $default(_that.keyword,_that.results,_that.currentPage,_that.hasMore,_that.isSearching,_that.isLoadingMore,_that.recentSearches,_that.errorMessage,_that.likedPostIds,_that.bookmarkedPostIds);case _:
  return null;

}
}

}

/// @nodoc


class _CommunitySearchState extends CommunitySearchState {
  const _CommunitySearchState({this.keyword = '', final  List<PostModel> results = const [], this.currentPage = 0, this.hasMore = true, this.isSearching = false, this.isLoadingMore = false, final  List<String> recentSearches = const [], this.errorMessage, final  Set<String> likedPostIds = const <String>{}, final  Set<String> bookmarkedPostIds = const <String>{}}): _results = results,_recentSearches = recentSearches,_likedPostIds = likedPostIds,_bookmarkedPostIds = bookmarkedPostIds,super._();
  

@override@JsonKey() final  String keyword;
 final  List<PostModel> _results;
@override@JsonKey() List<PostModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isSearching;
@override@JsonKey() final  bool isLoadingMore;
 final  List<String> _recentSearches;
@override@JsonKey() List<String> get recentSearches {
  if (_recentSearches is EqualUnmodifiableListView) return _recentSearches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSearches);
}

@override final  String? errorMessage;
 final  Set<String> _likedPostIds;
@override@JsonKey() Set<String> get likedPostIds {
  if (_likedPostIds is EqualUnmodifiableSetView) return _likedPostIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_likedPostIds);
}

 final  Set<String> _bookmarkedPostIds;
@override@JsonKey() Set<String> get bookmarkedPostIds {
  if (_bookmarkedPostIds is EqualUnmodifiableSetView) return _bookmarkedPostIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_bookmarkedPostIds);
}


/// Create a copy of CommunitySearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunitySearchStateCopyWith<_CommunitySearchState> get copyWith => __$CommunitySearchStateCopyWithImpl<_CommunitySearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunitySearchState&&(identical(other.keyword, keyword) || other.keyword == keyword)&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&const DeepCollectionEquality().equals(other._recentSearches, _recentSearches)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._likedPostIds, _likedPostIds)&&const DeepCollectionEquality().equals(other._bookmarkedPostIds, _bookmarkedPostIds));
}


@override
int get hashCode => Object.hash(runtimeType,keyword,const DeepCollectionEquality().hash(_results),currentPage,hasMore,isSearching,isLoadingMore,const DeepCollectionEquality().hash(_recentSearches),errorMessage,const DeepCollectionEquality().hash(_likedPostIds),const DeepCollectionEquality().hash(_bookmarkedPostIds));

@override
String toString() {
  return 'CommunitySearchState(keyword: $keyword, results: $results, currentPage: $currentPage, hasMore: $hasMore, isSearching: $isSearching, isLoadingMore: $isLoadingMore, recentSearches: $recentSearches, errorMessage: $errorMessage, likedPostIds: $likedPostIds, bookmarkedPostIds: $bookmarkedPostIds)';
}


}

/// @nodoc
abstract mixin class _$CommunitySearchStateCopyWith<$Res> implements $CommunitySearchStateCopyWith<$Res> {
  factory _$CommunitySearchStateCopyWith(_CommunitySearchState value, $Res Function(_CommunitySearchState) _then) = __$CommunitySearchStateCopyWithImpl;
@override @useResult
$Res call({
 String keyword, List<PostModel> results, int currentPage, bool hasMore, bool isSearching, bool isLoadingMore, List<String> recentSearches, String? errorMessage, Set<String> likedPostIds, Set<String> bookmarkedPostIds
});




}
/// @nodoc
class __$CommunitySearchStateCopyWithImpl<$Res>
    implements _$CommunitySearchStateCopyWith<$Res> {
  __$CommunitySearchStateCopyWithImpl(this._self, this._then);

  final _CommunitySearchState _self;
  final $Res Function(_CommunitySearchState) _then;

/// Create a copy of CommunitySearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keyword = null,Object? results = null,Object? currentPage = null,Object? hasMore = null,Object? isSearching = null,Object? isLoadingMore = null,Object? recentSearches = null,Object? errorMessage = freezed,Object? likedPostIds = null,Object? bookmarkedPostIds = null,}) {
  return _then(_CommunitySearchState(
keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<PostModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,recentSearches: null == recentSearches ? _self._recentSearches : recentSearches // ignore: cast_nullable_to_non_nullable
as List<String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,likedPostIds: null == likedPostIds ? _self._likedPostIds : likedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,bookmarkedPostIds: null == bookmarkedPostIds ? _self._bookmarkedPostIds : bookmarkedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
