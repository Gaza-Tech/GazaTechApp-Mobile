// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drafts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DraftsState {

// Posts tab
 List<PostModel> get posts; int get postsPage; bool get postsHasMore; bool get isPostsLoading; bool get isPostsLoadingMore;// Listings tab
 List<ListingDetailModel> get listings; int get listingsPage; bool get listingsHasMore; bool get isListingsLoading; bool get isListingsLoadingMore; String? get errorMessage;
/// Create a copy of DraftsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftsStateCopyWith<DraftsState> get copyWith => _$DraftsStateCopyWithImpl<DraftsState>(this as DraftsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftsState&&const DeepCollectionEquality().equals(other.posts, posts)&&(identical(other.postsPage, postsPage) || other.postsPage == postsPage)&&(identical(other.postsHasMore, postsHasMore) || other.postsHasMore == postsHasMore)&&(identical(other.isPostsLoading, isPostsLoading) || other.isPostsLoading == isPostsLoading)&&(identical(other.isPostsLoadingMore, isPostsLoadingMore) || other.isPostsLoadingMore == isPostsLoadingMore)&&const DeepCollectionEquality().equals(other.listings, listings)&&(identical(other.listingsPage, listingsPage) || other.listingsPage == listingsPage)&&(identical(other.listingsHasMore, listingsHasMore) || other.listingsHasMore == listingsHasMore)&&(identical(other.isListingsLoading, isListingsLoading) || other.isListingsLoading == isListingsLoading)&&(identical(other.isListingsLoadingMore, isListingsLoadingMore) || other.isListingsLoadingMore == isListingsLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(posts),postsPage,postsHasMore,isPostsLoading,isPostsLoadingMore,const DeepCollectionEquality().hash(listings),listingsPage,listingsHasMore,isListingsLoading,isListingsLoadingMore,errorMessage);

@override
String toString() {
  return 'DraftsState(posts: $posts, postsPage: $postsPage, postsHasMore: $postsHasMore, isPostsLoading: $isPostsLoading, isPostsLoadingMore: $isPostsLoadingMore, listings: $listings, listingsPage: $listingsPage, listingsHasMore: $listingsHasMore, isListingsLoading: $isListingsLoading, isListingsLoadingMore: $isListingsLoadingMore, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $DraftsStateCopyWith<$Res>  {
  factory $DraftsStateCopyWith(DraftsState value, $Res Function(DraftsState) _then) = _$DraftsStateCopyWithImpl;
@useResult
$Res call({
 List<PostModel> posts, int postsPage, bool postsHasMore, bool isPostsLoading, bool isPostsLoadingMore, List<ListingDetailModel> listings, int listingsPage, bool listingsHasMore, bool isListingsLoading, bool isListingsLoadingMore, String? errorMessage
});




}
/// @nodoc
class _$DraftsStateCopyWithImpl<$Res>
    implements $DraftsStateCopyWith<$Res> {
  _$DraftsStateCopyWithImpl(this._self, this._then);

  final DraftsState _self;
  final $Res Function(DraftsState) _then;

/// Create a copy of DraftsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? posts = null,Object? postsPage = null,Object? postsHasMore = null,Object? isPostsLoading = null,Object? isPostsLoadingMore = null,Object? listings = null,Object? listingsPage = null,Object? listingsHasMore = null,Object? isListingsLoading = null,Object? isListingsLoadingMore = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostModel>,postsPage: null == postsPage ? _self.postsPage : postsPage // ignore: cast_nullable_to_non_nullable
as int,postsHasMore: null == postsHasMore ? _self.postsHasMore : postsHasMore // ignore: cast_nullable_to_non_nullable
as bool,isPostsLoading: null == isPostsLoading ? _self.isPostsLoading : isPostsLoading // ignore: cast_nullable_to_non_nullable
as bool,isPostsLoadingMore: null == isPostsLoadingMore ? _self.isPostsLoadingMore : isPostsLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,listings: null == listings ? _self.listings : listings // ignore: cast_nullable_to_non_nullable
as List<ListingDetailModel>,listingsPage: null == listingsPage ? _self.listingsPage : listingsPage // ignore: cast_nullable_to_non_nullable
as int,listingsHasMore: null == listingsHasMore ? _self.listingsHasMore : listingsHasMore // ignore: cast_nullable_to_non_nullable
as bool,isListingsLoading: null == isListingsLoading ? _self.isListingsLoading : isListingsLoading // ignore: cast_nullable_to_non_nullable
as bool,isListingsLoadingMore: null == isListingsLoadingMore ? _self.isListingsLoadingMore : isListingsLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DraftsState].
extension DraftsStatePatterns on DraftsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DraftsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DraftsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DraftsState value)  $default,){
final _that = this;
switch (_that) {
case _DraftsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DraftsState value)?  $default,){
final _that = this;
switch (_that) {
case _DraftsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PostModel> posts,  int postsPage,  bool postsHasMore,  bool isPostsLoading,  bool isPostsLoadingMore,  List<ListingDetailModel> listings,  int listingsPage,  bool listingsHasMore,  bool isListingsLoading,  bool isListingsLoadingMore,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DraftsState() when $default != null:
return $default(_that.posts,_that.postsPage,_that.postsHasMore,_that.isPostsLoading,_that.isPostsLoadingMore,_that.listings,_that.listingsPage,_that.listingsHasMore,_that.isListingsLoading,_that.isListingsLoadingMore,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PostModel> posts,  int postsPage,  bool postsHasMore,  bool isPostsLoading,  bool isPostsLoadingMore,  List<ListingDetailModel> listings,  int listingsPage,  bool listingsHasMore,  bool isListingsLoading,  bool isListingsLoadingMore,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _DraftsState():
return $default(_that.posts,_that.postsPage,_that.postsHasMore,_that.isPostsLoading,_that.isPostsLoadingMore,_that.listings,_that.listingsPage,_that.listingsHasMore,_that.isListingsLoading,_that.isListingsLoadingMore,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PostModel> posts,  int postsPage,  bool postsHasMore,  bool isPostsLoading,  bool isPostsLoadingMore,  List<ListingDetailModel> listings,  int listingsPage,  bool listingsHasMore,  bool isListingsLoading,  bool isListingsLoadingMore,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _DraftsState() when $default != null:
return $default(_that.posts,_that.postsPage,_that.postsHasMore,_that.isPostsLoading,_that.isPostsLoadingMore,_that.listings,_that.listingsPage,_that.listingsHasMore,_that.isListingsLoading,_that.isListingsLoadingMore,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _DraftsState implements DraftsState {
  const _DraftsState({final  List<PostModel> posts = const [], this.postsPage = 0, this.postsHasMore = true, this.isPostsLoading = false, this.isPostsLoadingMore = false, final  List<ListingDetailModel> listings = const [], this.listingsPage = 0, this.listingsHasMore = true, this.isListingsLoading = false, this.isListingsLoadingMore = false, this.errorMessage}): _posts = posts,_listings = listings;
  

// Posts tab
 final  List<PostModel> _posts;
// Posts tab
@override@JsonKey() List<PostModel> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

@override@JsonKey() final  int postsPage;
@override@JsonKey() final  bool postsHasMore;
@override@JsonKey() final  bool isPostsLoading;
@override@JsonKey() final  bool isPostsLoadingMore;
// Listings tab
 final  List<ListingDetailModel> _listings;
// Listings tab
@override@JsonKey() List<ListingDetailModel> get listings {
  if (_listings is EqualUnmodifiableListView) return _listings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listings);
}

@override@JsonKey() final  int listingsPage;
@override@JsonKey() final  bool listingsHasMore;
@override@JsonKey() final  bool isListingsLoading;
@override@JsonKey() final  bool isListingsLoadingMore;
@override final  String? errorMessage;

/// Create a copy of DraftsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraftsStateCopyWith<_DraftsState> get copyWith => __$DraftsStateCopyWithImpl<_DraftsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftsState&&const DeepCollectionEquality().equals(other._posts, _posts)&&(identical(other.postsPage, postsPage) || other.postsPage == postsPage)&&(identical(other.postsHasMore, postsHasMore) || other.postsHasMore == postsHasMore)&&(identical(other.isPostsLoading, isPostsLoading) || other.isPostsLoading == isPostsLoading)&&(identical(other.isPostsLoadingMore, isPostsLoadingMore) || other.isPostsLoadingMore == isPostsLoadingMore)&&const DeepCollectionEquality().equals(other._listings, _listings)&&(identical(other.listingsPage, listingsPage) || other.listingsPage == listingsPage)&&(identical(other.listingsHasMore, listingsHasMore) || other.listingsHasMore == listingsHasMore)&&(identical(other.isListingsLoading, isListingsLoading) || other.isListingsLoading == isListingsLoading)&&(identical(other.isListingsLoadingMore, isListingsLoadingMore) || other.isListingsLoadingMore == isListingsLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts),postsPage,postsHasMore,isPostsLoading,isPostsLoadingMore,const DeepCollectionEquality().hash(_listings),listingsPage,listingsHasMore,isListingsLoading,isListingsLoadingMore,errorMessage);

@override
String toString() {
  return 'DraftsState(posts: $posts, postsPage: $postsPage, postsHasMore: $postsHasMore, isPostsLoading: $isPostsLoading, isPostsLoadingMore: $isPostsLoadingMore, listings: $listings, listingsPage: $listingsPage, listingsHasMore: $listingsHasMore, isListingsLoading: $isListingsLoading, isListingsLoadingMore: $isListingsLoadingMore, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$DraftsStateCopyWith<$Res> implements $DraftsStateCopyWith<$Res> {
  factory _$DraftsStateCopyWith(_DraftsState value, $Res Function(_DraftsState) _then) = __$DraftsStateCopyWithImpl;
@override @useResult
$Res call({
 List<PostModel> posts, int postsPage, bool postsHasMore, bool isPostsLoading, bool isPostsLoadingMore, List<ListingDetailModel> listings, int listingsPage, bool listingsHasMore, bool isListingsLoading, bool isListingsLoadingMore, String? errorMessage
});




}
/// @nodoc
class __$DraftsStateCopyWithImpl<$Res>
    implements _$DraftsStateCopyWith<$Res> {
  __$DraftsStateCopyWithImpl(this._self, this._then);

  final _DraftsState _self;
  final $Res Function(_DraftsState) _then;

/// Create a copy of DraftsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? posts = null,Object? postsPage = null,Object? postsHasMore = null,Object? isPostsLoading = null,Object? isPostsLoadingMore = null,Object? listings = null,Object? listingsPage = null,Object? listingsHasMore = null,Object? isListingsLoading = null,Object? isListingsLoadingMore = null,Object? errorMessage = freezed,}) {
  return _then(_DraftsState(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostModel>,postsPage: null == postsPage ? _self.postsPage : postsPage // ignore: cast_nullable_to_non_nullable
as int,postsHasMore: null == postsHasMore ? _self.postsHasMore : postsHasMore // ignore: cast_nullable_to_non_nullable
as bool,isPostsLoading: null == isPostsLoading ? _self.isPostsLoading : isPostsLoading // ignore: cast_nullable_to_non_nullable
as bool,isPostsLoadingMore: null == isPostsLoadingMore ? _self.isPostsLoadingMore : isPostsLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,listings: null == listings ? _self._listings : listings // ignore: cast_nullable_to_non_nullable
as List<ListingDetailModel>,listingsPage: null == listingsPage ? _self.listingsPage : listingsPage // ignore: cast_nullable_to_non_nullable
as int,listingsHasMore: null == listingsHasMore ? _self.listingsHasMore : listingsHasMore // ignore: cast_nullable_to_non_nullable
as bool,isListingsLoading: null == isListingsLoading ? _self.isListingsLoading : isListingsLoading // ignore: cast_nullable_to_non_nullable
as bool,isListingsLoadingMore: null == isListingsLoadingMore ? _self.isListingsLoadingMore : isListingsLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
