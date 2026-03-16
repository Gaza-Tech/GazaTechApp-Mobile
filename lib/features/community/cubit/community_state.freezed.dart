// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommunityState {

 String get selectedCategory;// Posts data per category (cached)
 Map<String, List<PostModel>> get postsByCategory;// Pagination state per category
 Map<String, int> get currentPageByCategory; Map<String, bool> get hasMoreByCategory;// Loading states
 bool get isInitialLoading; bool get isLoadingMore;// Error state
 String? get errorMessage;// Global like/bookmark state
 Set<String> get likedPostIds; Set<String> get bookmarkedPostIds;// Sort state
 CommunitySort get activeSort;
/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityStateCopyWith<CommunityState> get copyWith => _$CommunityStateCopyWithImpl<CommunityState>(this as CommunityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityState&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&const DeepCollectionEquality().equals(other.postsByCategory, postsByCategory)&&const DeepCollectionEquality().equals(other.currentPageByCategory, currentPageByCategory)&&const DeepCollectionEquality().equals(other.hasMoreByCategory, hasMoreByCategory)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.likedPostIds, likedPostIds)&&const DeepCollectionEquality().equals(other.bookmarkedPostIds, bookmarkedPostIds)&&(identical(other.activeSort, activeSort) || other.activeSort == activeSort));
}


@override
int get hashCode => Object.hash(runtimeType,selectedCategory,const DeepCollectionEquality().hash(postsByCategory),const DeepCollectionEquality().hash(currentPageByCategory),const DeepCollectionEquality().hash(hasMoreByCategory),isInitialLoading,isLoadingMore,errorMessage,const DeepCollectionEquality().hash(likedPostIds),const DeepCollectionEquality().hash(bookmarkedPostIds),activeSort);

@override
String toString() {
  return 'CommunityState(selectedCategory: $selectedCategory, postsByCategory: $postsByCategory, currentPageByCategory: $currentPageByCategory, hasMoreByCategory: $hasMoreByCategory, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage, likedPostIds: $likedPostIds, bookmarkedPostIds: $bookmarkedPostIds, activeSort: $activeSort)';
}


}

/// @nodoc
abstract mixin class $CommunityStateCopyWith<$Res>  {
  factory $CommunityStateCopyWith(CommunityState value, $Res Function(CommunityState) _then) = _$CommunityStateCopyWithImpl;
@useResult
$Res call({
 String selectedCategory, Map<String, List<PostModel>> postsByCategory, Map<String, int> currentPageByCategory, Map<String, bool> hasMoreByCategory, bool isInitialLoading, bool isLoadingMore, String? errorMessage, Set<String> likedPostIds, Set<String> bookmarkedPostIds, CommunitySort activeSort
});




}
/// @nodoc
class _$CommunityStateCopyWithImpl<$Res>
    implements $CommunityStateCopyWith<$Res> {
  _$CommunityStateCopyWithImpl(this._self, this._then);

  final CommunityState _self;
  final $Res Function(CommunityState) _then;

/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedCategory = null,Object? postsByCategory = null,Object? currentPageByCategory = null,Object? hasMoreByCategory = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? errorMessage = freezed,Object? likedPostIds = null,Object? bookmarkedPostIds = null,Object? activeSort = null,}) {
  return _then(_self.copyWith(
selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,postsByCategory: null == postsByCategory ? _self.postsByCategory : postsByCategory // ignore: cast_nullable_to_non_nullable
as Map<String, List<PostModel>>,currentPageByCategory: null == currentPageByCategory ? _self.currentPageByCategory : currentPageByCategory // ignore: cast_nullable_to_non_nullable
as Map<String, int>,hasMoreByCategory: null == hasMoreByCategory ? _self.hasMoreByCategory : hasMoreByCategory // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,likedPostIds: null == likedPostIds ? _self.likedPostIds : likedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,bookmarkedPostIds: null == bookmarkedPostIds ? _self.bookmarkedPostIds : bookmarkedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,activeSort: null == activeSort ? _self.activeSort : activeSort // ignore: cast_nullable_to_non_nullable
as CommunitySort,
  ));
}

}


/// Adds pattern-matching-related methods to [CommunityState].
extension CommunityStatePatterns on CommunityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityState value)  $default,){
final _that = this;
switch (_that) {
case _CommunityState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityState value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String selectedCategory,  Map<String, List<PostModel>> postsByCategory,  Map<String, int> currentPageByCategory,  Map<String, bool> hasMoreByCategory,  bool isInitialLoading,  bool isLoadingMore,  String? errorMessage,  Set<String> likedPostIds,  Set<String> bookmarkedPostIds,  CommunitySort activeSort)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityState() when $default != null:
return $default(_that.selectedCategory,_that.postsByCategory,_that.currentPageByCategory,_that.hasMoreByCategory,_that.isInitialLoading,_that.isLoadingMore,_that.errorMessage,_that.likedPostIds,_that.bookmarkedPostIds,_that.activeSort);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String selectedCategory,  Map<String, List<PostModel>> postsByCategory,  Map<String, int> currentPageByCategory,  Map<String, bool> hasMoreByCategory,  bool isInitialLoading,  bool isLoadingMore,  String? errorMessage,  Set<String> likedPostIds,  Set<String> bookmarkedPostIds,  CommunitySort activeSort)  $default,) {final _that = this;
switch (_that) {
case _CommunityState():
return $default(_that.selectedCategory,_that.postsByCategory,_that.currentPageByCategory,_that.hasMoreByCategory,_that.isInitialLoading,_that.isLoadingMore,_that.errorMessage,_that.likedPostIds,_that.bookmarkedPostIds,_that.activeSort);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String selectedCategory,  Map<String, List<PostModel>> postsByCategory,  Map<String, int> currentPageByCategory,  Map<String, bool> hasMoreByCategory,  bool isInitialLoading,  bool isLoadingMore,  String? errorMessage,  Set<String> likedPostIds,  Set<String> bookmarkedPostIds,  CommunitySort activeSort)?  $default,) {final _that = this;
switch (_that) {
case _CommunityState() when $default != null:
return $default(_that.selectedCategory,_that.postsByCategory,_that.currentPageByCategory,_that.hasMoreByCategory,_that.isInitialLoading,_that.isLoadingMore,_that.errorMessage,_that.likedPostIds,_that.bookmarkedPostIds,_that.activeSort);case _:
  return null;

}
}

}

/// @nodoc


class _CommunityState extends CommunityState {
  const _CommunityState({this.selectedCategory = 'all', final  Map<String, List<PostModel>> postsByCategory = const {}, final  Map<String, int> currentPageByCategory = const {}, final  Map<String, bool> hasMoreByCategory = const {}, this.isInitialLoading = false, this.isLoadingMore = false, this.errorMessage, final  Set<String> likedPostIds = const <String>{}, final  Set<String> bookmarkedPostIds = const <String>{}, this.activeSort = CommunitySort.newest}): _postsByCategory = postsByCategory,_currentPageByCategory = currentPageByCategory,_hasMoreByCategory = hasMoreByCategory,_likedPostIds = likedPostIds,_bookmarkedPostIds = bookmarkedPostIds,super._();
  

@override@JsonKey() final  String selectedCategory;
// Posts data per category (cached)
 final  Map<String, List<PostModel>> _postsByCategory;
// Posts data per category (cached)
@override@JsonKey() Map<String, List<PostModel>> get postsByCategory {
  if (_postsByCategory is EqualUnmodifiableMapView) return _postsByCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_postsByCategory);
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
// Global like/bookmark state
 final  Set<String> _likedPostIds;
// Global like/bookmark state
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

// Sort state
@override@JsonKey() final  CommunitySort activeSort;

/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityStateCopyWith<_CommunityState> get copyWith => __$CommunityStateCopyWithImpl<_CommunityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityState&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&const DeepCollectionEquality().equals(other._postsByCategory, _postsByCategory)&&const DeepCollectionEquality().equals(other._currentPageByCategory, _currentPageByCategory)&&const DeepCollectionEquality().equals(other._hasMoreByCategory, _hasMoreByCategory)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._likedPostIds, _likedPostIds)&&const DeepCollectionEquality().equals(other._bookmarkedPostIds, _bookmarkedPostIds)&&(identical(other.activeSort, activeSort) || other.activeSort == activeSort));
}


@override
int get hashCode => Object.hash(runtimeType,selectedCategory,const DeepCollectionEquality().hash(_postsByCategory),const DeepCollectionEquality().hash(_currentPageByCategory),const DeepCollectionEquality().hash(_hasMoreByCategory),isInitialLoading,isLoadingMore,errorMessage,const DeepCollectionEquality().hash(_likedPostIds),const DeepCollectionEquality().hash(_bookmarkedPostIds),activeSort);

@override
String toString() {
  return 'CommunityState(selectedCategory: $selectedCategory, postsByCategory: $postsByCategory, currentPageByCategory: $currentPageByCategory, hasMoreByCategory: $hasMoreByCategory, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage, likedPostIds: $likedPostIds, bookmarkedPostIds: $bookmarkedPostIds, activeSort: $activeSort)';
}


}

/// @nodoc
abstract mixin class _$CommunityStateCopyWith<$Res> implements $CommunityStateCopyWith<$Res> {
  factory _$CommunityStateCopyWith(_CommunityState value, $Res Function(_CommunityState) _then) = __$CommunityStateCopyWithImpl;
@override @useResult
$Res call({
 String selectedCategory, Map<String, List<PostModel>> postsByCategory, Map<String, int> currentPageByCategory, Map<String, bool> hasMoreByCategory, bool isInitialLoading, bool isLoadingMore, String? errorMessage, Set<String> likedPostIds, Set<String> bookmarkedPostIds, CommunitySort activeSort
});




}
/// @nodoc
class __$CommunityStateCopyWithImpl<$Res>
    implements _$CommunityStateCopyWith<$Res> {
  __$CommunityStateCopyWithImpl(this._self, this._then);

  final _CommunityState _self;
  final $Res Function(_CommunityState) _then;

/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedCategory = null,Object? postsByCategory = null,Object? currentPageByCategory = null,Object? hasMoreByCategory = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? errorMessage = freezed,Object? likedPostIds = null,Object? bookmarkedPostIds = null,Object? activeSort = null,}) {
  return _then(_CommunityState(
selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,postsByCategory: null == postsByCategory ? _self._postsByCategory : postsByCategory // ignore: cast_nullable_to_non_nullable
as Map<String, List<PostModel>>,currentPageByCategory: null == currentPageByCategory ? _self._currentPageByCategory : currentPageByCategory // ignore: cast_nullable_to_non_nullable
as Map<String, int>,hasMoreByCategory: null == hasMoreByCategory ? _self._hasMoreByCategory : hasMoreByCategory // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,likedPostIds: null == likedPostIds ? _self._likedPostIds : likedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,bookmarkedPostIds: null == bookmarkedPostIds ? _self._bookmarkedPostIds : bookmarkedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,activeSort: null == activeSort ? _self.activeSort : activeSort // ignore: cast_nullable_to_non_nullable
as CommunitySort,
  ));
}


}

// dart format on
