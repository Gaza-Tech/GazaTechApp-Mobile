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

 String get selectedCategory; List<PostModel> get posts; bool get isPostsLoading; bool get isLoadingMore; bool get hasMore; int get currentPage; String? get errorMessage; Set<String> get likedPostIds; Set<String> get bookmarkedPostIds;
/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityStateCopyWith<CommunityState> get copyWith => _$CommunityStateCopyWithImpl<CommunityState>(this as CommunityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityState&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&const DeepCollectionEquality().equals(other.posts, posts)&&(identical(other.isPostsLoading, isPostsLoading) || other.isPostsLoading == isPostsLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.likedPostIds, likedPostIds)&&const DeepCollectionEquality().equals(other.bookmarkedPostIds, bookmarkedPostIds));
}


@override
int get hashCode => Object.hash(runtimeType,selectedCategory,const DeepCollectionEquality().hash(posts),isPostsLoading,isLoadingMore,hasMore,currentPage,errorMessage,const DeepCollectionEquality().hash(likedPostIds),const DeepCollectionEquality().hash(bookmarkedPostIds));

@override
String toString() {
  return 'CommunityState(selectedCategory: $selectedCategory, posts: $posts, isPostsLoading: $isPostsLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, currentPage: $currentPage, errorMessage: $errorMessage, likedPostIds: $likedPostIds, bookmarkedPostIds: $bookmarkedPostIds)';
}


}

/// @nodoc
abstract mixin class $CommunityStateCopyWith<$Res>  {
  factory $CommunityStateCopyWith(CommunityState value, $Res Function(CommunityState) _then) = _$CommunityStateCopyWithImpl;
@useResult
$Res call({
 String selectedCategory, List<PostModel> posts, bool isPostsLoading, bool isLoadingMore, bool hasMore, int currentPage, String? errorMessage, Set<String> likedPostIds, Set<String> bookmarkedPostIds
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
@pragma('vm:prefer-inline') @override $Res call({Object? selectedCategory = null,Object? posts = null,Object? isPostsLoading = null,Object? isLoadingMore = null,Object? hasMore = null,Object? currentPage = null,Object? errorMessage = freezed,Object? likedPostIds = null,Object? bookmarkedPostIds = null,}) {
  return _then(_self.copyWith(
selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostModel>,isPostsLoading: null == isPostsLoading ? _self.isPostsLoading : isPostsLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,likedPostIds: null == likedPostIds ? _self.likedPostIds : likedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,bookmarkedPostIds: null == bookmarkedPostIds ? _self.bookmarkedPostIds : bookmarkedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String selectedCategory,  List<PostModel> posts,  bool isPostsLoading,  bool isLoadingMore,  bool hasMore,  int currentPage,  String? errorMessage,  Set<String> likedPostIds,  Set<String> bookmarkedPostIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityState() when $default != null:
return $default(_that.selectedCategory,_that.posts,_that.isPostsLoading,_that.isLoadingMore,_that.hasMore,_that.currentPage,_that.errorMessage,_that.likedPostIds,_that.bookmarkedPostIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String selectedCategory,  List<PostModel> posts,  bool isPostsLoading,  bool isLoadingMore,  bool hasMore,  int currentPage,  String? errorMessage,  Set<String> likedPostIds,  Set<String> bookmarkedPostIds)  $default,) {final _that = this;
switch (_that) {
case _CommunityState():
return $default(_that.selectedCategory,_that.posts,_that.isPostsLoading,_that.isLoadingMore,_that.hasMore,_that.currentPage,_that.errorMessage,_that.likedPostIds,_that.bookmarkedPostIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String selectedCategory,  List<PostModel> posts,  bool isPostsLoading,  bool isLoadingMore,  bool hasMore,  int currentPage,  String? errorMessage,  Set<String> likedPostIds,  Set<String> bookmarkedPostIds)?  $default,) {final _that = this;
switch (_that) {
case _CommunityState() when $default != null:
return $default(_that.selectedCategory,_that.posts,_that.isPostsLoading,_that.isLoadingMore,_that.hasMore,_that.currentPage,_that.errorMessage,_that.likedPostIds,_that.bookmarkedPostIds);case _:
  return null;

}
}

}

/// @nodoc


class _CommunityState extends CommunityState {
  const _CommunityState({this.selectedCategory = 'all', final  List<PostModel> posts = const [], this.isPostsLoading = false, this.isLoadingMore = false, this.hasMore = true, this.currentPage = 0, this.errorMessage, final  Set<String> likedPostIds = const <String>{}, final  Set<String> bookmarkedPostIds = const <String>{}}): _posts = posts,_likedPostIds = likedPostIds,_bookmarkedPostIds = bookmarkedPostIds,super._();
  

@override@JsonKey() final  String selectedCategory;
 final  List<PostModel> _posts;
@override@JsonKey() List<PostModel> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

@override@JsonKey() final  bool isPostsLoading;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  int currentPage;
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


/// Create a copy of CommunityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityStateCopyWith<_CommunityState> get copyWith => __$CommunityStateCopyWithImpl<_CommunityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityState&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&const DeepCollectionEquality().equals(other._posts, _posts)&&(identical(other.isPostsLoading, isPostsLoading) || other.isPostsLoading == isPostsLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._likedPostIds, _likedPostIds)&&const DeepCollectionEquality().equals(other._bookmarkedPostIds, _bookmarkedPostIds));
}


@override
int get hashCode => Object.hash(runtimeType,selectedCategory,const DeepCollectionEquality().hash(_posts),isPostsLoading,isLoadingMore,hasMore,currentPage,errorMessage,const DeepCollectionEquality().hash(_likedPostIds),const DeepCollectionEquality().hash(_bookmarkedPostIds));

@override
String toString() {
  return 'CommunityState(selectedCategory: $selectedCategory, posts: $posts, isPostsLoading: $isPostsLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, currentPage: $currentPage, errorMessage: $errorMessage, likedPostIds: $likedPostIds, bookmarkedPostIds: $bookmarkedPostIds)';
}


}

/// @nodoc
abstract mixin class _$CommunityStateCopyWith<$Res> implements $CommunityStateCopyWith<$Res> {
  factory _$CommunityStateCopyWith(_CommunityState value, $Res Function(_CommunityState) _then) = __$CommunityStateCopyWithImpl;
@override @useResult
$Res call({
 String selectedCategory, List<PostModel> posts, bool isPostsLoading, bool isLoadingMore, bool hasMore, int currentPage, String? errorMessage, Set<String> likedPostIds, Set<String> bookmarkedPostIds
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
@override @pragma('vm:prefer-inline') $Res call({Object? selectedCategory = null,Object? posts = null,Object? isPostsLoading = null,Object? isLoadingMore = null,Object? hasMore = null,Object? currentPage = null,Object? errorMessage = freezed,Object? likedPostIds = null,Object? bookmarkedPostIds = null,}) {
  return _then(_CommunityState(
selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostModel>,isPostsLoading: null == isPostsLoading ? _self.isPostsLoading : isPostsLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,likedPostIds: null == likedPostIds ? _self._likedPostIds : likedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,bookmarkedPostIds: null == bookmarkedPostIds ? _self._bookmarkedPostIds : bookmarkedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
