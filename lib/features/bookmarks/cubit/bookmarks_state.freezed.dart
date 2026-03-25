// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmarks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookmarksState {

// Posts tab
 List<PostModel> get bookmarkedPosts; int get postsPage; bool get postsHasMore; bool get isPostsLoading; bool get isPostsLoadingMore;// Listings tab
 List<ListingModel> get bookmarkedListings; int get listingsPage; bool get listingsHasMore; bool get isListingsLoading; bool get isListingsLoadingMore;// Tracking sets
 Set<String> get likedPostIds; Set<String> get bookmarkedPostIds; Set<String> get bookmarkedListingIds; String? get errorMessage;
/// Create a copy of BookmarksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarksStateCopyWith<BookmarksState> get copyWith => _$BookmarksStateCopyWithImpl<BookmarksState>(this as BookmarksState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarksState&&const DeepCollectionEquality().equals(other.bookmarkedPosts, bookmarkedPosts)&&(identical(other.postsPage, postsPage) || other.postsPage == postsPage)&&(identical(other.postsHasMore, postsHasMore) || other.postsHasMore == postsHasMore)&&(identical(other.isPostsLoading, isPostsLoading) || other.isPostsLoading == isPostsLoading)&&(identical(other.isPostsLoadingMore, isPostsLoadingMore) || other.isPostsLoadingMore == isPostsLoadingMore)&&const DeepCollectionEquality().equals(other.bookmarkedListings, bookmarkedListings)&&(identical(other.listingsPage, listingsPage) || other.listingsPage == listingsPage)&&(identical(other.listingsHasMore, listingsHasMore) || other.listingsHasMore == listingsHasMore)&&(identical(other.isListingsLoading, isListingsLoading) || other.isListingsLoading == isListingsLoading)&&(identical(other.isListingsLoadingMore, isListingsLoadingMore) || other.isListingsLoadingMore == isListingsLoadingMore)&&const DeepCollectionEquality().equals(other.likedPostIds, likedPostIds)&&const DeepCollectionEquality().equals(other.bookmarkedPostIds, bookmarkedPostIds)&&const DeepCollectionEquality().equals(other.bookmarkedListingIds, bookmarkedListingIds)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bookmarkedPosts),postsPage,postsHasMore,isPostsLoading,isPostsLoadingMore,const DeepCollectionEquality().hash(bookmarkedListings),listingsPage,listingsHasMore,isListingsLoading,isListingsLoadingMore,const DeepCollectionEquality().hash(likedPostIds),const DeepCollectionEquality().hash(bookmarkedPostIds),const DeepCollectionEquality().hash(bookmarkedListingIds),errorMessage);

@override
String toString() {
  return 'BookmarksState(bookmarkedPosts: $bookmarkedPosts, postsPage: $postsPage, postsHasMore: $postsHasMore, isPostsLoading: $isPostsLoading, isPostsLoadingMore: $isPostsLoadingMore, bookmarkedListings: $bookmarkedListings, listingsPage: $listingsPage, listingsHasMore: $listingsHasMore, isListingsLoading: $isListingsLoading, isListingsLoadingMore: $isListingsLoadingMore, likedPostIds: $likedPostIds, bookmarkedPostIds: $bookmarkedPostIds, bookmarkedListingIds: $bookmarkedListingIds, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $BookmarksStateCopyWith<$Res>  {
  factory $BookmarksStateCopyWith(BookmarksState value, $Res Function(BookmarksState) _then) = _$BookmarksStateCopyWithImpl;
@useResult
$Res call({
 List<PostModel> bookmarkedPosts, int postsPage, bool postsHasMore, bool isPostsLoading, bool isPostsLoadingMore, List<ListingModel> bookmarkedListings, int listingsPage, bool listingsHasMore, bool isListingsLoading, bool isListingsLoadingMore, Set<String> likedPostIds, Set<String> bookmarkedPostIds, Set<String> bookmarkedListingIds, String? errorMessage
});




}
/// @nodoc
class _$BookmarksStateCopyWithImpl<$Res>
    implements $BookmarksStateCopyWith<$Res> {
  _$BookmarksStateCopyWithImpl(this._self, this._then);

  final BookmarksState _self;
  final $Res Function(BookmarksState) _then;

/// Create a copy of BookmarksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookmarkedPosts = null,Object? postsPage = null,Object? postsHasMore = null,Object? isPostsLoading = null,Object? isPostsLoadingMore = null,Object? bookmarkedListings = null,Object? listingsPage = null,Object? listingsHasMore = null,Object? isListingsLoading = null,Object? isListingsLoadingMore = null,Object? likedPostIds = null,Object? bookmarkedPostIds = null,Object? bookmarkedListingIds = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
bookmarkedPosts: null == bookmarkedPosts ? _self.bookmarkedPosts : bookmarkedPosts // ignore: cast_nullable_to_non_nullable
as List<PostModel>,postsPage: null == postsPage ? _self.postsPage : postsPage // ignore: cast_nullable_to_non_nullable
as int,postsHasMore: null == postsHasMore ? _self.postsHasMore : postsHasMore // ignore: cast_nullable_to_non_nullable
as bool,isPostsLoading: null == isPostsLoading ? _self.isPostsLoading : isPostsLoading // ignore: cast_nullable_to_non_nullable
as bool,isPostsLoadingMore: null == isPostsLoadingMore ? _self.isPostsLoadingMore : isPostsLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,bookmarkedListings: null == bookmarkedListings ? _self.bookmarkedListings : bookmarkedListings // ignore: cast_nullable_to_non_nullable
as List<ListingModel>,listingsPage: null == listingsPage ? _self.listingsPage : listingsPage // ignore: cast_nullable_to_non_nullable
as int,listingsHasMore: null == listingsHasMore ? _self.listingsHasMore : listingsHasMore // ignore: cast_nullable_to_non_nullable
as bool,isListingsLoading: null == isListingsLoading ? _self.isListingsLoading : isListingsLoading // ignore: cast_nullable_to_non_nullable
as bool,isListingsLoadingMore: null == isListingsLoadingMore ? _self.isListingsLoadingMore : isListingsLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,likedPostIds: null == likedPostIds ? _self.likedPostIds : likedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,bookmarkedPostIds: null == bookmarkedPostIds ? _self.bookmarkedPostIds : bookmarkedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,bookmarkedListingIds: null == bookmarkedListingIds ? _self.bookmarkedListingIds : bookmarkedListingIds // ignore: cast_nullable_to_non_nullable
as Set<String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookmarksState].
extension BookmarksStatePatterns on BookmarksState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookmarksState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookmarksState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookmarksState value)  $default,){
final _that = this;
switch (_that) {
case _BookmarksState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookmarksState value)?  $default,){
final _that = this;
switch (_that) {
case _BookmarksState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PostModel> bookmarkedPosts,  int postsPage,  bool postsHasMore,  bool isPostsLoading,  bool isPostsLoadingMore,  List<ListingModel> bookmarkedListings,  int listingsPage,  bool listingsHasMore,  bool isListingsLoading,  bool isListingsLoadingMore,  Set<String> likedPostIds,  Set<String> bookmarkedPostIds,  Set<String> bookmarkedListingIds,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookmarksState() when $default != null:
return $default(_that.bookmarkedPosts,_that.postsPage,_that.postsHasMore,_that.isPostsLoading,_that.isPostsLoadingMore,_that.bookmarkedListings,_that.listingsPage,_that.listingsHasMore,_that.isListingsLoading,_that.isListingsLoadingMore,_that.likedPostIds,_that.bookmarkedPostIds,_that.bookmarkedListingIds,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PostModel> bookmarkedPosts,  int postsPage,  bool postsHasMore,  bool isPostsLoading,  bool isPostsLoadingMore,  List<ListingModel> bookmarkedListings,  int listingsPage,  bool listingsHasMore,  bool isListingsLoading,  bool isListingsLoadingMore,  Set<String> likedPostIds,  Set<String> bookmarkedPostIds,  Set<String> bookmarkedListingIds,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _BookmarksState():
return $default(_that.bookmarkedPosts,_that.postsPage,_that.postsHasMore,_that.isPostsLoading,_that.isPostsLoadingMore,_that.bookmarkedListings,_that.listingsPage,_that.listingsHasMore,_that.isListingsLoading,_that.isListingsLoadingMore,_that.likedPostIds,_that.bookmarkedPostIds,_that.bookmarkedListingIds,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PostModel> bookmarkedPosts,  int postsPage,  bool postsHasMore,  bool isPostsLoading,  bool isPostsLoadingMore,  List<ListingModel> bookmarkedListings,  int listingsPage,  bool listingsHasMore,  bool isListingsLoading,  bool isListingsLoadingMore,  Set<String> likedPostIds,  Set<String> bookmarkedPostIds,  Set<String> bookmarkedListingIds,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _BookmarksState() when $default != null:
return $default(_that.bookmarkedPosts,_that.postsPage,_that.postsHasMore,_that.isPostsLoading,_that.isPostsLoadingMore,_that.bookmarkedListings,_that.listingsPage,_that.listingsHasMore,_that.isListingsLoading,_that.isListingsLoadingMore,_that.likedPostIds,_that.bookmarkedPostIds,_that.bookmarkedListingIds,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _BookmarksState implements BookmarksState {
  const _BookmarksState({final  List<PostModel> bookmarkedPosts = const [], this.postsPage = 0, this.postsHasMore = true, this.isPostsLoading = false, this.isPostsLoadingMore = false, final  List<ListingModel> bookmarkedListings = const [], this.listingsPage = 0, this.listingsHasMore = true, this.isListingsLoading = false, this.isListingsLoadingMore = false, final  Set<String> likedPostIds = const <String>{}, final  Set<String> bookmarkedPostIds = const <String>{}, final  Set<String> bookmarkedListingIds = const <String>{}, this.errorMessage}): _bookmarkedPosts = bookmarkedPosts,_bookmarkedListings = bookmarkedListings,_likedPostIds = likedPostIds,_bookmarkedPostIds = bookmarkedPostIds,_bookmarkedListingIds = bookmarkedListingIds;
  

// Posts tab
 final  List<PostModel> _bookmarkedPosts;
// Posts tab
@override@JsonKey() List<PostModel> get bookmarkedPosts {
  if (_bookmarkedPosts is EqualUnmodifiableListView) return _bookmarkedPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookmarkedPosts);
}

@override@JsonKey() final  int postsPage;
@override@JsonKey() final  bool postsHasMore;
@override@JsonKey() final  bool isPostsLoading;
@override@JsonKey() final  bool isPostsLoadingMore;
// Listings tab
 final  List<ListingModel> _bookmarkedListings;
// Listings tab
@override@JsonKey() List<ListingModel> get bookmarkedListings {
  if (_bookmarkedListings is EqualUnmodifiableListView) return _bookmarkedListings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookmarkedListings);
}

@override@JsonKey() final  int listingsPage;
@override@JsonKey() final  bool listingsHasMore;
@override@JsonKey() final  bool isListingsLoading;
@override@JsonKey() final  bool isListingsLoadingMore;
// Tracking sets
 final  Set<String> _likedPostIds;
// Tracking sets
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

 final  Set<String> _bookmarkedListingIds;
@override@JsonKey() Set<String> get bookmarkedListingIds {
  if (_bookmarkedListingIds is EqualUnmodifiableSetView) return _bookmarkedListingIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_bookmarkedListingIds);
}

@override final  String? errorMessage;

/// Create a copy of BookmarksState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarksStateCopyWith<_BookmarksState> get copyWith => __$BookmarksStateCopyWithImpl<_BookmarksState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarksState&&const DeepCollectionEquality().equals(other._bookmarkedPosts, _bookmarkedPosts)&&(identical(other.postsPage, postsPage) || other.postsPage == postsPage)&&(identical(other.postsHasMore, postsHasMore) || other.postsHasMore == postsHasMore)&&(identical(other.isPostsLoading, isPostsLoading) || other.isPostsLoading == isPostsLoading)&&(identical(other.isPostsLoadingMore, isPostsLoadingMore) || other.isPostsLoadingMore == isPostsLoadingMore)&&const DeepCollectionEquality().equals(other._bookmarkedListings, _bookmarkedListings)&&(identical(other.listingsPage, listingsPage) || other.listingsPage == listingsPage)&&(identical(other.listingsHasMore, listingsHasMore) || other.listingsHasMore == listingsHasMore)&&(identical(other.isListingsLoading, isListingsLoading) || other.isListingsLoading == isListingsLoading)&&(identical(other.isListingsLoadingMore, isListingsLoadingMore) || other.isListingsLoadingMore == isListingsLoadingMore)&&const DeepCollectionEquality().equals(other._likedPostIds, _likedPostIds)&&const DeepCollectionEquality().equals(other._bookmarkedPostIds, _bookmarkedPostIds)&&const DeepCollectionEquality().equals(other._bookmarkedListingIds, _bookmarkedListingIds)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bookmarkedPosts),postsPage,postsHasMore,isPostsLoading,isPostsLoadingMore,const DeepCollectionEquality().hash(_bookmarkedListings),listingsPage,listingsHasMore,isListingsLoading,isListingsLoadingMore,const DeepCollectionEquality().hash(_likedPostIds),const DeepCollectionEquality().hash(_bookmarkedPostIds),const DeepCollectionEquality().hash(_bookmarkedListingIds),errorMessage);

@override
String toString() {
  return 'BookmarksState(bookmarkedPosts: $bookmarkedPosts, postsPage: $postsPage, postsHasMore: $postsHasMore, isPostsLoading: $isPostsLoading, isPostsLoadingMore: $isPostsLoadingMore, bookmarkedListings: $bookmarkedListings, listingsPage: $listingsPage, listingsHasMore: $listingsHasMore, isListingsLoading: $isListingsLoading, isListingsLoadingMore: $isListingsLoadingMore, likedPostIds: $likedPostIds, bookmarkedPostIds: $bookmarkedPostIds, bookmarkedListingIds: $bookmarkedListingIds, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$BookmarksStateCopyWith<$Res> implements $BookmarksStateCopyWith<$Res> {
  factory _$BookmarksStateCopyWith(_BookmarksState value, $Res Function(_BookmarksState) _then) = __$BookmarksStateCopyWithImpl;
@override @useResult
$Res call({
 List<PostModel> bookmarkedPosts, int postsPage, bool postsHasMore, bool isPostsLoading, bool isPostsLoadingMore, List<ListingModel> bookmarkedListings, int listingsPage, bool listingsHasMore, bool isListingsLoading, bool isListingsLoadingMore, Set<String> likedPostIds, Set<String> bookmarkedPostIds, Set<String> bookmarkedListingIds, String? errorMessage
});




}
/// @nodoc
class __$BookmarksStateCopyWithImpl<$Res>
    implements _$BookmarksStateCopyWith<$Res> {
  __$BookmarksStateCopyWithImpl(this._self, this._then);

  final _BookmarksState _self;
  final $Res Function(_BookmarksState) _then;

/// Create a copy of BookmarksState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookmarkedPosts = null,Object? postsPage = null,Object? postsHasMore = null,Object? isPostsLoading = null,Object? isPostsLoadingMore = null,Object? bookmarkedListings = null,Object? listingsPage = null,Object? listingsHasMore = null,Object? isListingsLoading = null,Object? isListingsLoadingMore = null,Object? likedPostIds = null,Object? bookmarkedPostIds = null,Object? bookmarkedListingIds = null,Object? errorMessage = freezed,}) {
  return _then(_BookmarksState(
bookmarkedPosts: null == bookmarkedPosts ? _self._bookmarkedPosts : bookmarkedPosts // ignore: cast_nullable_to_non_nullable
as List<PostModel>,postsPage: null == postsPage ? _self.postsPage : postsPage // ignore: cast_nullable_to_non_nullable
as int,postsHasMore: null == postsHasMore ? _self.postsHasMore : postsHasMore // ignore: cast_nullable_to_non_nullable
as bool,isPostsLoading: null == isPostsLoading ? _self.isPostsLoading : isPostsLoading // ignore: cast_nullable_to_non_nullable
as bool,isPostsLoadingMore: null == isPostsLoadingMore ? _self.isPostsLoadingMore : isPostsLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,bookmarkedListings: null == bookmarkedListings ? _self._bookmarkedListings : bookmarkedListings // ignore: cast_nullable_to_non_nullable
as List<ListingModel>,listingsPage: null == listingsPage ? _self.listingsPage : listingsPage // ignore: cast_nullable_to_non_nullable
as int,listingsHasMore: null == listingsHasMore ? _self.listingsHasMore : listingsHasMore // ignore: cast_nullable_to_non_nullable
as bool,isListingsLoading: null == isListingsLoading ? _self.isListingsLoading : isListingsLoading // ignore: cast_nullable_to_non_nullable
as bool,isListingsLoadingMore: null == isListingsLoadingMore ? _self.isListingsLoadingMore : isListingsLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,likedPostIds: null == likedPostIds ? _self._likedPostIds : likedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,bookmarkedPostIds: null == bookmarkedPostIds ? _self._bookmarkedPostIds : bookmarkedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,bookmarkedListingIds: null == bookmarkedListingIds ? _self._bookmarkedListingIds : bookmarkedListingIds // ignore: cast_nullable_to_non_nullable
as Set<String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
