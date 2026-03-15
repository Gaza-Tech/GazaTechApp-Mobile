// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostDetailsState {

 PostModel? get post; List<CommentModel> get comments; bool get isPostLoading; bool get isCommentsLoading; bool get isLoadingMoreComments; bool get hasMoreComments; int get commentsPage; String? get errorMessage; bool get isLiked; bool get isBookmarked; Set<String> get likedCommentIds;
/// Create a copy of PostDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostDetailsStateCopyWith<PostDetailsState> get copyWith => _$PostDetailsStateCopyWithImpl<PostDetailsState>(this as PostDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDetailsState&&(identical(other.post, post) || other.post == post)&&const DeepCollectionEquality().equals(other.comments, comments)&&(identical(other.isPostLoading, isPostLoading) || other.isPostLoading == isPostLoading)&&(identical(other.isCommentsLoading, isCommentsLoading) || other.isCommentsLoading == isCommentsLoading)&&(identical(other.isLoadingMoreComments, isLoadingMoreComments) || other.isLoadingMoreComments == isLoadingMoreComments)&&(identical(other.hasMoreComments, hasMoreComments) || other.hasMoreComments == hasMoreComments)&&(identical(other.commentsPage, commentsPage) || other.commentsPage == commentsPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&const DeepCollectionEquality().equals(other.likedCommentIds, likedCommentIds));
}


@override
int get hashCode => Object.hash(runtimeType,post,const DeepCollectionEquality().hash(comments),isPostLoading,isCommentsLoading,isLoadingMoreComments,hasMoreComments,commentsPage,errorMessage,isLiked,isBookmarked,const DeepCollectionEquality().hash(likedCommentIds));

@override
String toString() {
  return 'PostDetailsState(post: $post, comments: $comments, isPostLoading: $isPostLoading, isCommentsLoading: $isCommentsLoading, isLoadingMoreComments: $isLoadingMoreComments, hasMoreComments: $hasMoreComments, commentsPage: $commentsPage, errorMessage: $errorMessage, isLiked: $isLiked, isBookmarked: $isBookmarked, likedCommentIds: $likedCommentIds)';
}


}

/// @nodoc
abstract mixin class $PostDetailsStateCopyWith<$Res>  {
  factory $PostDetailsStateCopyWith(PostDetailsState value, $Res Function(PostDetailsState) _then) = _$PostDetailsStateCopyWithImpl;
@useResult
$Res call({
 PostModel? post, List<CommentModel> comments, bool isPostLoading, bool isCommentsLoading, bool isLoadingMoreComments, bool hasMoreComments, int commentsPage, String? errorMessage, bool isLiked, bool isBookmarked, Set<String> likedCommentIds
});


$PostModelCopyWith<$Res>? get post;

}
/// @nodoc
class _$PostDetailsStateCopyWithImpl<$Res>
    implements $PostDetailsStateCopyWith<$Res> {
  _$PostDetailsStateCopyWithImpl(this._self, this._then);

  final PostDetailsState _self;
  final $Res Function(PostDetailsState) _then;

/// Create a copy of PostDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? post = freezed,Object? comments = null,Object? isPostLoading = null,Object? isCommentsLoading = null,Object? isLoadingMoreComments = null,Object? hasMoreComments = null,Object? commentsPage = null,Object? errorMessage = freezed,Object? isLiked = null,Object? isBookmarked = null,Object? likedCommentIds = null,}) {
  return _then(_self.copyWith(
post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as PostModel?,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentModel>,isPostLoading: null == isPostLoading ? _self.isPostLoading : isPostLoading // ignore: cast_nullable_to_non_nullable
as bool,isCommentsLoading: null == isCommentsLoading ? _self.isCommentsLoading : isCommentsLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMoreComments: null == isLoadingMoreComments ? _self.isLoadingMoreComments : isLoadingMoreComments // ignore: cast_nullable_to_non_nullable
as bool,hasMoreComments: null == hasMoreComments ? _self.hasMoreComments : hasMoreComments // ignore: cast_nullable_to_non_nullable
as bool,commentsPage: null == commentsPage ? _self.commentsPage : commentsPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,likedCommentIds: null == likedCommentIds ? _self.likedCommentIds : likedCommentIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}
/// Create a copy of PostDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostModelCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $PostModelCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}


/// Adds pattern-matching-related methods to [PostDetailsState].
extension PostDetailsStatePatterns on PostDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _PostDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _PostDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PostModel? post,  List<CommentModel> comments,  bool isPostLoading,  bool isCommentsLoading,  bool isLoadingMoreComments,  bool hasMoreComments,  int commentsPage,  String? errorMessage,  bool isLiked,  bool isBookmarked,  Set<String> likedCommentIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostDetailsState() when $default != null:
return $default(_that.post,_that.comments,_that.isPostLoading,_that.isCommentsLoading,_that.isLoadingMoreComments,_that.hasMoreComments,_that.commentsPage,_that.errorMessage,_that.isLiked,_that.isBookmarked,_that.likedCommentIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PostModel? post,  List<CommentModel> comments,  bool isPostLoading,  bool isCommentsLoading,  bool isLoadingMoreComments,  bool hasMoreComments,  int commentsPage,  String? errorMessage,  bool isLiked,  bool isBookmarked,  Set<String> likedCommentIds)  $default,) {final _that = this;
switch (_that) {
case _PostDetailsState():
return $default(_that.post,_that.comments,_that.isPostLoading,_that.isCommentsLoading,_that.isLoadingMoreComments,_that.hasMoreComments,_that.commentsPage,_that.errorMessage,_that.isLiked,_that.isBookmarked,_that.likedCommentIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PostModel? post,  List<CommentModel> comments,  bool isPostLoading,  bool isCommentsLoading,  bool isLoadingMoreComments,  bool hasMoreComments,  int commentsPage,  String? errorMessage,  bool isLiked,  bool isBookmarked,  Set<String> likedCommentIds)?  $default,) {final _that = this;
switch (_that) {
case _PostDetailsState() when $default != null:
return $default(_that.post,_that.comments,_that.isPostLoading,_that.isCommentsLoading,_that.isLoadingMoreComments,_that.hasMoreComments,_that.commentsPage,_that.errorMessage,_that.isLiked,_that.isBookmarked,_that.likedCommentIds);case _:
  return null;

}
}

}

/// @nodoc


class _PostDetailsState extends PostDetailsState {
  const _PostDetailsState({this.post, final  List<CommentModel> comments = const [], this.isPostLoading = false, this.isCommentsLoading = false, this.isLoadingMoreComments = false, this.hasMoreComments = true, this.commentsPage = 0, this.errorMessage, this.isLiked = false, this.isBookmarked = false, final  Set<String> likedCommentIds = const <String>{}}): _comments = comments,_likedCommentIds = likedCommentIds,super._();
  

@override final  PostModel? post;
 final  List<CommentModel> _comments;
@override@JsonKey() List<CommentModel> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}

@override@JsonKey() final  bool isPostLoading;
@override@JsonKey() final  bool isCommentsLoading;
@override@JsonKey() final  bool isLoadingMoreComments;
@override@JsonKey() final  bool hasMoreComments;
@override@JsonKey() final  int commentsPage;
@override final  String? errorMessage;
@override@JsonKey() final  bool isLiked;
@override@JsonKey() final  bool isBookmarked;
 final  Set<String> _likedCommentIds;
@override@JsonKey() Set<String> get likedCommentIds {
  if (_likedCommentIds is EqualUnmodifiableSetView) return _likedCommentIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_likedCommentIds);
}


/// Create a copy of PostDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostDetailsStateCopyWith<_PostDetailsState> get copyWith => __$PostDetailsStateCopyWithImpl<_PostDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostDetailsState&&(identical(other.post, post) || other.post == post)&&const DeepCollectionEquality().equals(other._comments, _comments)&&(identical(other.isPostLoading, isPostLoading) || other.isPostLoading == isPostLoading)&&(identical(other.isCommentsLoading, isCommentsLoading) || other.isCommentsLoading == isCommentsLoading)&&(identical(other.isLoadingMoreComments, isLoadingMoreComments) || other.isLoadingMoreComments == isLoadingMoreComments)&&(identical(other.hasMoreComments, hasMoreComments) || other.hasMoreComments == hasMoreComments)&&(identical(other.commentsPage, commentsPage) || other.commentsPage == commentsPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&const DeepCollectionEquality().equals(other._likedCommentIds, _likedCommentIds));
}


@override
int get hashCode => Object.hash(runtimeType,post,const DeepCollectionEquality().hash(_comments),isPostLoading,isCommentsLoading,isLoadingMoreComments,hasMoreComments,commentsPage,errorMessage,isLiked,isBookmarked,const DeepCollectionEquality().hash(_likedCommentIds));

@override
String toString() {
  return 'PostDetailsState(post: $post, comments: $comments, isPostLoading: $isPostLoading, isCommentsLoading: $isCommentsLoading, isLoadingMoreComments: $isLoadingMoreComments, hasMoreComments: $hasMoreComments, commentsPage: $commentsPage, errorMessage: $errorMessage, isLiked: $isLiked, isBookmarked: $isBookmarked, likedCommentIds: $likedCommentIds)';
}


}

/// @nodoc
abstract mixin class _$PostDetailsStateCopyWith<$Res> implements $PostDetailsStateCopyWith<$Res> {
  factory _$PostDetailsStateCopyWith(_PostDetailsState value, $Res Function(_PostDetailsState) _then) = __$PostDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 PostModel? post, List<CommentModel> comments, bool isPostLoading, bool isCommentsLoading, bool isLoadingMoreComments, bool hasMoreComments, int commentsPage, String? errorMessage, bool isLiked, bool isBookmarked, Set<String> likedCommentIds
});


@override $PostModelCopyWith<$Res>? get post;

}
/// @nodoc
class __$PostDetailsStateCopyWithImpl<$Res>
    implements _$PostDetailsStateCopyWith<$Res> {
  __$PostDetailsStateCopyWithImpl(this._self, this._then);

  final _PostDetailsState _self;
  final $Res Function(_PostDetailsState) _then;

/// Create a copy of PostDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? post = freezed,Object? comments = null,Object? isPostLoading = null,Object? isCommentsLoading = null,Object? isLoadingMoreComments = null,Object? hasMoreComments = null,Object? commentsPage = null,Object? errorMessage = freezed,Object? isLiked = null,Object? isBookmarked = null,Object? likedCommentIds = null,}) {
  return _then(_PostDetailsState(
post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as PostModel?,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentModel>,isPostLoading: null == isPostLoading ? _self.isPostLoading : isPostLoading // ignore: cast_nullable_to_non_nullable
as bool,isCommentsLoading: null == isCommentsLoading ? _self.isCommentsLoading : isCommentsLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMoreComments: null == isLoadingMoreComments ? _self.isLoadingMoreComments : isLoadingMoreComments // ignore: cast_nullable_to_non_nullable
as bool,hasMoreComments: null == hasMoreComments ? _self.hasMoreComments : hasMoreComments // ignore: cast_nullable_to_non_nullable
as bool,commentsPage: null == commentsPage ? _self.commentsPage : commentsPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,likedCommentIds: null == likedCommentIds ? _self._likedCommentIds : likedCommentIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

/// Create a copy of PostDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostModelCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $PostModelCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

// dart format on
