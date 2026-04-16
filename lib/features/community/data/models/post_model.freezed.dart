// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostModel {

@JsonKey(name: 'post_id') String get postId;@JsonKey(name: 'author_id') String get authorId; String get title; String get content;@JsonKey(name: 'post_category') String get postCategory;@JsonKey(name: 'content_status') String get contentStatus;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'published_at') DateTime? get publishedAt;@JsonKey(name: 'users', fromJson: _authorFromJson) PostAuthorModel? get author;@JsonKey(name: 'likes_count') int get likesCount;@JsonKey(name: 'comments_count') int get commentsCount;@JsonKey(name: 'community_posts_attachments', fromJson: _attachmentUrlsFromJson) List<String> get attachmentUrls; bool get isLiked; bool get isBookmarked; bool get isReported;
/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostModelCopyWith<PostModel> get copyWith => _$PostModelCopyWithImpl<PostModel>(this as PostModel, _$identity);

  /// Serializes this PostModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostModel&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.postCategory, postCategory) || other.postCategory == postCategory)&&(identical(other.contentStatus, contentStatus) || other.contentStatus == contentStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.author, author) || other.author == author)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.commentsCount, commentsCount) || other.commentsCount == commentsCount)&&const DeepCollectionEquality().equals(other.attachmentUrls, attachmentUrls)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.isReported, isReported) || other.isReported == isReported));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,postId,authorId,title,content,postCategory,contentStatus,createdAt,publishedAt,author,likesCount,commentsCount,const DeepCollectionEquality().hash(attachmentUrls),isLiked,isBookmarked,isReported);

@override
String toString() {
  return 'PostModel(postId: $postId, authorId: $authorId, title: $title, content: $content, postCategory: $postCategory, contentStatus: $contentStatus, createdAt: $createdAt, publishedAt: $publishedAt, author: $author, likesCount: $likesCount, commentsCount: $commentsCount, attachmentUrls: $attachmentUrls, isLiked: $isLiked, isBookmarked: $isBookmarked, isReported: $isReported)';
}


}

/// @nodoc
abstract mixin class $PostModelCopyWith<$Res>  {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) _then) = _$PostModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'post_id') String postId,@JsonKey(name: 'author_id') String authorId, String title, String content,@JsonKey(name: 'post_category') String postCategory,@JsonKey(name: 'content_status') String contentStatus,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'published_at') DateTime? publishedAt,@JsonKey(name: 'users', fromJson: _authorFromJson) PostAuthorModel? author,@JsonKey(name: 'likes_count') int likesCount,@JsonKey(name: 'comments_count') int commentsCount,@JsonKey(name: 'community_posts_attachments', fromJson: _attachmentUrlsFromJson) List<String> attachmentUrls, bool isLiked, bool isBookmarked, bool isReported
});


$PostAuthorModelCopyWith<$Res>? get author;

}
/// @nodoc
class _$PostModelCopyWithImpl<$Res>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._self, this._then);

  final PostModel _self;
  final $Res Function(PostModel) _then;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? postId = null,Object? authorId = null,Object? title = null,Object? content = null,Object? postCategory = null,Object? contentStatus = null,Object? createdAt = null,Object? publishedAt = freezed,Object? author = freezed,Object? likesCount = null,Object? commentsCount = null,Object? attachmentUrls = null,Object? isLiked = null,Object? isBookmarked = null,Object? isReported = null,}) {
  return _then(_self.copyWith(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,postCategory: null == postCategory ? _self.postCategory : postCategory // ignore: cast_nullable_to_non_nullable
as String,contentStatus: null == contentStatus ? _self.contentStatus : contentStatus // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as PostAuthorModel?,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,commentsCount: null == commentsCount ? _self.commentsCount : commentsCount // ignore: cast_nullable_to_non_nullable
as int,attachmentUrls: null == attachmentUrls ? _self.attachmentUrls : attachmentUrls // ignore: cast_nullable_to_non_nullable
as List<String>,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,isReported: null == isReported ? _self.isReported : isReported // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostAuthorModelCopyWith<$Res>? get author {
    if (_self.author == null) {
    return null;
  }

  return $PostAuthorModelCopyWith<$Res>(_self.author!, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}


/// Adds pattern-matching-related methods to [PostModel].
extension PostModelPatterns on PostModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostModel value)  $default,){
final _that = this;
switch (_that) {
case _PostModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostModel value)?  $default,){
final _that = this;
switch (_that) {
case _PostModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'post_id')  String postId, @JsonKey(name: 'author_id')  String authorId,  String title,  String content, @JsonKey(name: 'post_category')  String postCategory, @JsonKey(name: 'content_status')  String contentStatus, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'published_at')  DateTime? publishedAt, @JsonKey(name: 'users', fromJson: _authorFromJson)  PostAuthorModel? author, @JsonKey(name: 'likes_count')  int likesCount, @JsonKey(name: 'comments_count')  int commentsCount, @JsonKey(name: 'community_posts_attachments', fromJson: _attachmentUrlsFromJson)  List<String> attachmentUrls,  bool isLiked,  bool isBookmarked,  bool isReported)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostModel() when $default != null:
return $default(_that.postId,_that.authorId,_that.title,_that.content,_that.postCategory,_that.contentStatus,_that.createdAt,_that.publishedAt,_that.author,_that.likesCount,_that.commentsCount,_that.attachmentUrls,_that.isLiked,_that.isBookmarked,_that.isReported);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'post_id')  String postId, @JsonKey(name: 'author_id')  String authorId,  String title,  String content, @JsonKey(name: 'post_category')  String postCategory, @JsonKey(name: 'content_status')  String contentStatus, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'published_at')  DateTime? publishedAt, @JsonKey(name: 'users', fromJson: _authorFromJson)  PostAuthorModel? author, @JsonKey(name: 'likes_count')  int likesCount, @JsonKey(name: 'comments_count')  int commentsCount, @JsonKey(name: 'community_posts_attachments', fromJson: _attachmentUrlsFromJson)  List<String> attachmentUrls,  bool isLiked,  bool isBookmarked,  bool isReported)  $default,) {final _that = this;
switch (_that) {
case _PostModel():
return $default(_that.postId,_that.authorId,_that.title,_that.content,_that.postCategory,_that.contentStatus,_that.createdAt,_that.publishedAt,_that.author,_that.likesCount,_that.commentsCount,_that.attachmentUrls,_that.isLiked,_that.isBookmarked,_that.isReported);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'post_id')  String postId, @JsonKey(name: 'author_id')  String authorId,  String title,  String content, @JsonKey(name: 'post_category')  String postCategory, @JsonKey(name: 'content_status')  String contentStatus, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'published_at')  DateTime? publishedAt, @JsonKey(name: 'users', fromJson: _authorFromJson)  PostAuthorModel? author, @JsonKey(name: 'likes_count')  int likesCount, @JsonKey(name: 'comments_count')  int commentsCount, @JsonKey(name: 'community_posts_attachments', fromJson: _attachmentUrlsFromJson)  List<String> attachmentUrls,  bool isLiked,  bool isBookmarked,  bool isReported)?  $default,) {final _that = this;
switch (_that) {
case _PostModel() when $default != null:
return $default(_that.postId,_that.authorId,_that.title,_that.content,_that.postCategory,_that.contentStatus,_that.createdAt,_that.publishedAt,_that.author,_that.likesCount,_that.commentsCount,_that.attachmentUrls,_that.isLiked,_that.isBookmarked,_that.isReported);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostModel extends PostModel {
  const _PostModel({@JsonKey(name: 'post_id') required this.postId, @JsonKey(name: 'author_id') required this.authorId, required this.title, required this.content, @JsonKey(name: 'post_category') required this.postCategory, @JsonKey(name: 'content_status') required this.contentStatus, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'published_at') this.publishedAt, @JsonKey(name: 'users', fromJson: _authorFromJson) this.author, @JsonKey(name: 'likes_count') this.likesCount = 0, @JsonKey(name: 'comments_count') this.commentsCount = 0, @JsonKey(name: 'community_posts_attachments', fromJson: _attachmentUrlsFromJson) final  List<String> attachmentUrls = const [], this.isLiked = false, this.isBookmarked = false, this.isReported = false}): _attachmentUrls = attachmentUrls,super._();
  factory _PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

@override@JsonKey(name: 'post_id') final  String postId;
@override@JsonKey(name: 'author_id') final  String authorId;
@override final  String title;
@override final  String content;
@override@JsonKey(name: 'post_category') final  String postCategory;
@override@JsonKey(name: 'content_status') final  String contentStatus;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'published_at') final  DateTime? publishedAt;
@override@JsonKey(name: 'users', fromJson: _authorFromJson) final  PostAuthorModel? author;
@override@JsonKey(name: 'likes_count') final  int likesCount;
@override@JsonKey(name: 'comments_count') final  int commentsCount;
 final  List<String> _attachmentUrls;
@override@JsonKey(name: 'community_posts_attachments', fromJson: _attachmentUrlsFromJson) List<String> get attachmentUrls {
  if (_attachmentUrls is EqualUnmodifiableListView) return _attachmentUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachmentUrls);
}

@override@JsonKey() final  bool isLiked;
@override@JsonKey() final  bool isBookmarked;
@override@JsonKey() final  bool isReported;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostModelCopyWith<_PostModel> get copyWith => __$PostModelCopyWithImpl<_PostModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostModel&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.postCategory, postCategory) || other.postCategory == postCategory)&&(identical(other.contentStatus, contentStatus) || other.contentStatus == contentStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.author, author) || other.author == author)&&(identical(other.likesCount, likesCount) || other.likesCount == likesCount)&&(identical(other.commentsCount, commentsCount) || other.commentsCount == commentsCount)&&const DeepCollectionEquality().equals(other._attachmentUrls, _attachmentUrls)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.isReported, isReported) || other.isReported == isReported));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,postId,authorId,title,content,postCategory,contentStatus,createdAt,publishedAt,author,likesCount,commentsCount,const DeepCollectionEquality().hash(_attachmentUrls),isLiked,isBookmarked,isReported);

@override
String toString() {
  return 'PostModel(postId: $postId, authorId: $authorId, title: $title, content: $content, postCategory: $postCategory, contentStatus: $contentStatus, createdAt: $createdAt, publishedAt: $publishedAt, author: $author, likesCount: $likesCount, commentsCount: $commentsCount, attachmentUrls: $attachmentUrls, isLiked: $isLiked, isBookmarked: $isBookmarked, isReported: $isReported)';
}


}

/// @nodoc
abstract mixin class _$PostModelCopyWith<$Res> implements $PostModelCopyWith<$Res> {
  factory _$PostModelCopyWith(_PostModel value, $Res Function(_PostModel) _then) = __$PostModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'post_id') String postId,@JsonKey(name: 'author_id') String authorId, String title, String content,@JsonKey(name: 'post_category') String postCategory,@JsonKey(name: 'content_status') String contentStatus,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'published_at') DateTime? publishedAt,@JsonKey(name: 'users', fromJson: _authorFromJson) PostAuthorModel? author,@JsonKey(name: 'likes_count') int likesCount,@JsonKey(name: 'comments_count') int commentsCount,@JsonKey(name: 'community_posts_attachments', fromJson: _attachmentUrlsFromJson) List<String> attachmentUrls, bool isLiked, bool isBookmarked, bool isReported
});


@override $PostAuthorModelCopyWith<$Res>? get author;

}
/// @nodoc
class __$PostModelCopyWithImpl<$Res>
    implements _$PostModelCopyWith<$Res> {
  __$PostModelCopyWithImpl(this._self, this._then);

  final _PostModel _self;
  final $Res Function(_PostModel) _then;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? postId = null,Object? authorId = null,Object? title = null,Object? content = null,Object? postCategory = null,Object? contentStatus = null,Object? createdAt = null,Object? publishedAt = freezed,Object? author = freezed,Object? likesCount = null,Object? commentsCount = null,Object? attachmentUrls = null,Object? isLiked = null,Object? isBookmarked = null,Object? isReported = null,}) {
  return _then(_PostModel(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,postCategory: null == postCategory ? _self.postCategory : postCategory // ignore: cast_nullable_to_non_nullable
as String,contentStatus: null == contentStatus ? _self.contentStatus : contentStatus // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as PostAuthorModel?,likesCount: null == likesCount ? _self.likesCount : likesCount // ignore: cast_nullable_to_non_nullable
as int,commentsCount: null == commentsCount ? _self.commentsCount : commentsCount // ignore: cast_nullable_to_non_nullable
as int,attachmentUrls: null == attachmentUrls ? _self._attachmentUrls : attachmentUrls // ignore: cast_nullable_to_non_nullable
as List<String>,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,isReported: null == isReported ? _self.isReported : isReported // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostAuthorModelCopyWith<$Res>? get author {
    if (_self.author == null) {
    return null;
  }

  return $PostAuthorModelCopyWith<$Res>(_self.author!, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}

// dart format on
