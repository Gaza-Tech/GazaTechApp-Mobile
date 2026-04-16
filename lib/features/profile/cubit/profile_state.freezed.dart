// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {

 UserProfileModel? get userProfile; bool get isOwnProfile;// Profile loading
 bool get isProfileLoading;// Posts tab
 List<PostModel> get posts; int get postsPage; bool get postsHasMore; bool get isPostsLoading; bool get isPostsLoadingMore;// Listings tab
 List<ListingModel> get listings; int get listingsPage; bool get listingsHasMore; bool get isListingsLoading; bool get isListingsLoadingMore;// Like/bookmark tracking
 Set<String> get likedPostIds; Set<String> get bookmarkedPostIds;// Verification
 String? get verificationStatus; bool get isUserReported; String? get errorMessage;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&(identical(other.userProfile, userProfile) || other.userProfile == userProfile)&&(identical(other.isOwnProfile, isOwnProfile) || other.isOwnProfile == isOwnProfile)&&(identical(other.isProfileLoading, isProfileLoading) || other.isProfileLoading == isProfileLoading)&&const DeepCollectionEquality().equals(other.posts, posts)&&(identical(other.postsPage, postsPage) || other.postsPage == postsPage)&&(identical(other.postsHasMore, postsHasMore) || other.postsHasMore == postsHasMore)&&(identical(other.isPostsLoading, isPostsLoading) || other.isPostsLoading == isPostsLoading)&&(identical(other.isPostsLoadingMore, isPostsLoadingMore) || other.isPostsLoadingMore == isPostsLoadingMore)&&const DeepCollectionEquality().equals(other.listings, listings)&&(identical(other.listingsPage, listingsPage) || other.listingsPage == listingsPage)&&(identical(other.listingsHasMore, listingsHasMore) || other.listingsHasMore == listingsHasMore)&&(identical(other.isListingsLoading, isListingsLoading) || other.isListingsLoading == isListingsLoading)&&(identical(other.isListingsLoadingMore, isListingsLoadingMore) || other.isListingsLoadingMore == isListingsLoadingMore)&&const DeepCollectionEquality().equals(other.likedPostIds, likedPostIds)&&const DeepCollectionEquality().equals(other.bookmarkedPostIds, bookmarkedPostIds)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.isUserReported, isUserReported) || other.isUserReported == isUserReported)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,userProfile,isOwnProfile,isProfileLoading,const DeepCollectionEquality().hash(posts),postsPage,postsHasMore,isPostsLoading,isPostsLoadingMore,const DeepCollectionEquality().hash(listings),listingsPage,listingsHasMore,isListingsLoading,isListingsLoadingMore,const DeepCollectionEquality().hash(likedPostIds),const DeepCollectionEquality().hash(bookmarkedPostIds),verificationStatus,isUserReported,errorMessage);

@override
String toString() {
  return 'ProfileState(userProfile: $userProfile, isOwnProfile: $isOwnProfile, isProfileLoading: $isProfileLoading, posts: $posts, postsPage: $postsPage, postsHasMore: $postsHasMore, isPostsLoading: $isPostsLoading, isPostsLoadingMore: $isPostsLoadingMore, listings: $listings, listingsPage: $listingsPage, listingsHasMore: $listingsHasMore, isListingsLoading: $isListingsLoading, isListingsLoadingMore: $isListingsLoadingMore, likedPostIds: $likedPostIds, bookmarkedPostIds: $bookmarkedPostIds, verificationStatus: $verificationStatus, isUserReported: $isUserReported, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 UserProfileModel? userProfile, bool isOwnProfile, bool isProfileLoading, List<PostModel> posts, int postsPage, bool postsHasMore, bool isPostsLoading, bool isPostsLoadingMore, List<ListingModel> listings, int listingsPage, bool listingsHasMore, bool isListingsLoading, bool isListingsLoadingMore, Set<String> likedPostIds, Set<String> bookmarkedPostIds, String? verificationStatus, bool isUserReported, String? errorMessage
});


$UserProfileModelCopyWith<$Res>? get userProfile;

}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userProfile = freezed,Object? isOwnProfile = null,Object? isProfileLoading = null,Object? posts = null,Object? postsPage = null,Object? postsHasMore = null,Object? isPostsLoading = null,Object? isPostsLoadingMore = null,Object? listings = null,Object? listingsPage = null,Object? listingsHasMore = null,Object? isListingsLoading = null,Object? isListingsLoadingMore = null,Object? likedPostIds = null,Object? bookmarkedPostIds = null,Object? verificationStatus = freezed,Object? isUserReported = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
userProfile: freezed == userProfile ? _self.userProfile : userProfile // ignore: cast_nullable_to_non_nullable
as UserProfileModel?,isOwnProfile: null == isOwnProfile ? _self.isOwnProfile : isOwnProfile // ignore: cast_nullable_to_non_nullable
as bool,isProfileLoading: null == isProfileLoading ? _self.isProfileLoading : isProfileLoading // ignore: cast_nullable_to_non_nullable
as bool,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostModel>,postsPage: null == postsPage ? _self.postsPage : postsPage // ignore: cast_nullable_to_non_nullable
as int,postsHasMore: null == postsHasMore ? _self.postsHasMore : postsHasMore // ignore: cast_nullable_to_non_nullable
as bool,isPostsLoading: null == isPostsLoading ? _self.isPostsLoading : isPostsLoading // ignore: cast_nullable_to_non_nullable
as bool,isPostsLoadingMore: null == isPostsLoadingMore ? _self.isPostsLoadingMore : isPostsLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,listings: null == listings ? _self.listings : listings // ignore: cast_nullable_to_non_nullable
as List<ListingModel>,listingsPage: null == listingsPage ? _self.listingsPage : listingsPage // ignore: cast_nullable_to_non_nullable
as int,listingsHasMore: null == listingsHasMore ? _self.listingsHasMore : listingsHasMore // ignore: cast_nullable_to_non_nullable
as bool,isListingsLoading: null == isListingsLoading ? _self.isListingsLoading : isListingsLoading // ignore: cast_nullable_to_non_nullable
as bool,isListingsLoadingMore: null == isListingsLoadingMore ? _self.isListingsLoadingMore : isListingsLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,likedPostIds: null == likedPostIds ? _self.likedPostIds : likedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,bookmarkedPostIds: null == bookmarkedPostIds ? _self.bookmarkedPostIds : bookmarkedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,verificationStatus: freezed == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String?,isUserReported: null == isUserReported ? _self.isUserReported : isUserReported // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileModelCopyWith<$Res>? get userProfile {
    if (_self.userProfile == null) {
    return null;
  }

  return $UserProfileModelCopyWith<$Res>(_self.userProfile!, (value) {
    return _then(_self.copyWith(userProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserProfileModel? userProfile,  bool isOwnProfile,  bool isProfileLoading,  List<PostModel> posts,  int postsPage,  bool postsHasMore,  bool isPostsLoading,  bool isPostsLoadingMore,  List<ListingModel> listings,  int listingsPage,  bool listingsHasMore,  bool isListingsLoading,  bool isListingsLoadingMore,  Set<String> likedPostIds,  Set<String> bookmarkedPostIds,  String? verificationStatus,  bool isUserReported,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.userProfile,_that.isOwnProfile,_that.isProfileLoading,_that.posts,_that.postsPage,_that.postsHasMore,_that.isPostsLoading,_that.isPostsLoadingMore,_that.listings,_that.listingsPage,_that.listingsHasMore,_that.isListingsLoading,_that.isListingsLoadingMore,_that.likedPostIds,_that.bookmarkedPostIds,_that.verificationStatus,_that.isUserReported,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserProfileModel? userProfile,  bool isOwnProfile,  bool isProfileLoading,  List<PostModel> posts,  int postsPage,  bool postsHasMore,  bool isPostsLoading,  bool isPostsLoadingMore,  List<ListingModel> listings,  int listingsPage,  bool listingsHasMore,  bool isListingsLoading,  bool isListingsLoadingMore,  Set<String> likedPostIds,  Set<String> bookmarkedPostIds,  String? verificationStatus,  bool isUserReported,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ProfileState():
return $default(_that.userProfile,_that.isOwnProfile,_that.isProfileLoading,_that.posts,_that.postsPage,_that.postsHasMore,_that.isPostsLoading,_that.isPostsLoadingMore,_that.listings,_that.listingsPage,_that.listingsHasMore,_that.isListingsLoading,_that.isListingsLoadingMore,_that.likedPostIds,_that.bookmarkedPostIds,_that.verificationStatus,_that.isUserReported,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserProfileModel? userProfile,  bool isOwnProfile,  bool isProfileLoading,  List<PostModel> posts,  int postsPage,  bool postsHasMore,  bool isPostsLoading,  bool isPostsLoadingMore,  List<ListingModel> listings,  int listingsPage,  bool listingsHasMore,  bool isListingsLoading,  bool isListingsLoadingMore,  Set<String> likedPostIds,  Set<String> bookmarkedPostIds,  String? verificationStatus,  bool isUserReported,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.userProfile,_that.isOwnProfile,_that.isProfileLoading,_that.posts,_that.postsPage,_that.postsHasMore,_that.isPostsLoading,_that.isPostsLoadingMore,_that.listings,_that.listingsPage,_that.listingsHasMore,_that.isListingsLoading,_that.isListingsLoadingMore,_that.likedPostIds,_that.bookmarkedPostIds,_that.verificationStatus,_that.isUserReported,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileState implements ProfileState {
  const _ProfileState({this.userProfile, this.isOwnProfile = false, this.isProfileLoading = false, final  List<PostModel> posts = const [], this.postsPage = 0, this.postsHasMore = true, this.isPostsLoading = false, this.isPostsLoadingMore = false, final  List<ListingModel> listings = const [], this.listingsPage = 0, this.listingsHasMore = true, this.isListingsLoading = false, this.isListingsLoadingMore = false, final  Set<String> likedPostIds = const <String>{}, final  Set<String> bookmarkedPostIds = const <String>{}, this.verificationStatus, this.isUserReported = false, this.errorMessage}): _posts = posts,_listings = listings,_likedPostIds = likedPostIds,_bookmarkedPostIds = bookmarkedPostIds;
  

@override final  UserProfileModel? userProfile;
@override@JsonKey() final  bool isOwnProfile;
// Profile loading
@override@JsonKey() final  bool isProfileLoading;
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
 final  List<ListingModel> _listings;
// Listings tab
@override@JsonKey() List<ListingModel> get listings {
  if (_listings is EqualUnmodifiableListView) return _listings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listings);
}

@override@JsonKey() final  int listingsPage;
@override@JsonKey() final  bool listingsHasMore;
@override@JsonKey() final  bool isListingsLoading;
@override@JsonKey() final  bool isListingsLoadingMore;
// Like/bookmark tracking
 final  Set<String> _likedPostIds;
// Like/bookmark tracking
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

// Verification
@override final  String? verificationStatus;
@override@JsonKey() final  bool isUserReported;
@override final  String? errorMessage;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&(identical(other.userProfile, userProfile) || other.userProfile == userProfile)&&(identical(other.isOwnProfile, isOwnProfile) || other.isOwnProfile == isOwnProfile)&&(identical(other.isProfileLoading, isProfileLoading) || other.isProfileLoading == isProfileLoading)&&const DeepCollectionEquality().equals(other._posts, _posts)&&(identical(other.postsPage, postsPage) || other.postsPage == postsPage)&&(identical(other.postsHasMore, postsHasMore) || other.postsHasMore == postsHasMore)&&(identical(other.isPostsLoading, isPostsLoading) || other.isPostsLoading == isPostsLoading)&&(identical(other.isPostsLoadingMore, isPostsLoadingMore) || other.isPostsLoadingMore == isPostsLoadingMore)&&const DeepCollectionEquality().equals(other._listings, _listings)&&(identical(other.listingsPage, listingsPage) || other.listingsPage == listingsPage)&&(identical(other.listingsHasMore, listingsHasMore) || other.listingsHasMore == listingsHasMore)&&(identical(other.isListingsLoading, isListingsLoading) || other.isListingsLoading == isListingsLoading)&&(identical(other.isListingsLoadingMore, isListingsLoadingMore) || other.isListingsLoadingMore == isListingsLoadingMore)&&const DeepCollectionEquality().equals(other._likedPostIds, _likedPostIds)&&const DeepCollectionEquality().equals(other._bookmarkedPostIds, _bookmarkedPostIds)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.isUserReported, isUserReported) || other.isUserReported == isUserReported)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,userProfile,isOwnProfile,isProfileLoading,const DeepCollectionEquality().hash(_posts),postsPage,postsHasMore,isPostsLoading,isPostsLoadingMore,const DeepCollectionEquality().hash(_listings),listingsPage,listingsHasMore,isListingsLoading,isListingsLoadingMore,const DeepCollectionEquality().hash(_likedPostIds),const DeepCollectionEquality().hash(_bookmarkedPostIds),verificationStatus,isUserReported,errorMessage);

@override
String toString() {
  return 'ProfileState(userProfile: $userProfile, isOwnProfile: $isOwnProfile, isProfileLoading: $isProfileLoading, posts: $posts, postsPage: $postsPage, postsHasMore: $postsHasMore, isPostsLoading: $isPostsLoading, isPostsLoadingMore: $isPostsLoadingMore, listings: $listings, listingsPage: $listingsPage, listingsHasMore: $listingsHasMore, isListingsLoading: $isListingsLoading, isListingsLoadingMore: $isListingsLoadingMore, likedPostIds: $likedPostIds, bookmarkedPostIds: $bookmarkedPostIds, verificationStatus: $verificationStatus, isUserReported: $isUserReported, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 UserProfileModel? userProfile, bool isOwnProfile, bool isProfileLoading, List<PostModel> posts, int postsPage, bool postsHasMore, bool isPostsLoading, bool isPostsLoadingMore, List<ListingModel> listings, int listingsPage, bool listingsHasMore, bool isListingsLoading, bool isListingsLoadingMore, Set<String> likedPostIds, Set<String> bookmarkedPostIds, String? verificationStatus, bool isUserReported, String? errorMessage
});


@override $UserProfileModelCopyWith<$Res>? get userProfile;

}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userProfile = freezed,Object? isOwnProfile = null,Object? isProfileLoading = null,Object? posts = null,Object? postsPage = null,Object? postsHasMore = null,Object? isPostsLoading = null,Object? isPostsLoadingMore = null,Object? listings = null,Object? listingsPage = null,Object? listingsHasMore = null,Object? isListingsLoading = null,Object? isListingsLoadingMore = null,Object? likedPostIds = null,Object? bookmarkedPostIds = null,Object? verificationStatus = freezed,Object? isUserReported = null,Object? errorMessage = freezed,}) {
  return _then(_ProfileState(
userProfile: freezed == userProfile ? _self.userProfile : userProfile // ignore: cast_nullable_to_non_nullable
as UserProfileModel?,isOwnProfile: null == isOwnProfile ? _self.isOwnProfile : isOwnProfile // ignore: cast_nullable_to_non_nullable
as bool,isProfileLoading: null == isProfileLoading ? _self.isProfileLoading : isProfileLoading // ignore: cast_nullable_to_non_nullable
as bool,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostModel>,postsPage: null == postsPage ? _self.postsPage : postsPage // ignore: cast_nullable_to_non_nullable
as int,postsHasMore: null == postsHasMore ? _self.postsHasMore : postsHasMore // ignore: cast_nullable_to_non_nullable
as bool,isPostsLoading: null == isPostsLoading ? _self.isPostsLoading : isPostsLoading // ignore: cast_nullable_to_non_nullable
as bool,isPostsLoadingMore: null == isPostsLoadingMore ? _self.isPostsLoadingMore : isPostsLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,listings: null == listings ? _self._listings : listings // ignore: cast_nullable_to_non_nullable
as List<ListingModel>,listingsPage: null == listingsPage ? _self.listingsPage : listingsPage // ignore: cast_nullable_to_non_nullable
as int,listingsHasMore: null == listingsHasMore ? _self.listingsHasMore : listingsHasMore // ignore: cast_nullable_to_non_nullable
as bool,isListingsLoading: null == isListingsLoading ? _self.isListingsLoading : isListingsLoading // ignore: cast_nullable_to_non_nullable
as bool,isListingsLoadingMore: null == isListingsLoadingMore ? _self.isListingsLoadingMore : isListingsLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,likedPostIds: null == likedPostIds ? _self._likedPostIds : likedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,bookmarkedPostIds: null == bookmarkedPostIds ? _self._bookmarkedPostIds : bookmarkedPostIds // ignore: cast_nullable_to_non_nullable
as Set<String>,verificationStatus: freezed == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String?,isUserReported: null == isUserReported ? _self.isUserReported : isUserReported // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileModelCopyWith<$Res>? get userProfile {
    if (_self.userProfile == null) {
    return null;
  }

  return $UserProfileModelCopyWith<$Res>(_self.userProfile!, (value) {
    return _then(_self.copyWith(userProfile: value));
  });
}
}

// dart format on
