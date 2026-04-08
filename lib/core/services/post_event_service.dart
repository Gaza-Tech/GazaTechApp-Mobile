import 'dart:async';

class ListingBookmarkEvent {
  final String listingId;
  final bool isBookmarked;

  const ListingBookmarkEvent({
    required this.listingId,
    required this.isBookmarked,
  });
}

class PostBookmarkEvent {
  final String postId;
  final bool isBookmarked;

  const PostBookmarkEvent({required this.postId, required this.isBookmarked});
}

class PostLikeEvent {
  final String postId;
  final bool isLiked;
  final int likesCount;

  const PostLikeEvent({
    required this.postId,
    required this.isLiked,
    required this.likesCount,
  });
}

class PostCommentCountEvent {
  final String postId;
  final int commentsCount;

  const PostCommentCountEvent({
    required this.postId,
    required this.commentsCount,
  });
}

class PostEventService {
  final StreamController<ListingBookmarkEvent> _listingController =
      StreamController<ListingBookmarkEvent>.broadcast();

  final StreamController<PostBookmarkEvent> _postBookmarkController =
      StreamController<PostBookmarkEvent>.broadcast();

  final StreamController<PostLikeEvent> _postLikeController =
      StreamController<PostLikeEvent>.broadcast();

  final StreamController<PostCommentCountEvent> _postCommentCountController =
      StreamController<PostCommentCountEvent>.broadcast();

  Stream<ListingBookmarkEvent> get listingBookmarkChanges =>
      _listingController.stream;

  Stream<PostBookmarkEvent> get postBookmarkChanges =>
      _postBookmarkController.stream;

  Stream<PostLikeEvent> get postLikeChanges => _postLikeController.stream;

  Stream<PostCommentCountEvent> get postCommentCountChanges =>
      _postCommentCountController.stream;

  void emitListingBookmark(String listingId, {required bool isBookmarked}) {
    _listingController.add(
      ListingBookmarkEvent(listingId: listingId, isBookmarked: isBookmarked),
    );
  }

  void emitPostBookmark(String postId, {required bool isBookmarked}) {
    _postBookmarkController.add(
      PostBookmarkEvent(postId: postId, isBookmarked: isBookmarked),
    );
  }

  void emitPostLike(
    String postId, {
    required bool isLiked,
    required int likesCount,
  }) {
    _postLikeController.add(
      PostLikeEvent(
        postId: postId,
        isLiked: isLiked,
        likesCount: likesCount,
      ),
    );
  }

  void emitPostCommentCount(String postId, {required int commentsCount}) {
    _postCommentCountController.add(
      PostCommentCountEvent(postId: postId, commentsCount: commentsCount),
    );
  }

  void dispose() {
    _listingController.close();
    _postBookmarkController.close();
    _postLikeController.close();
    _postCommentCountController.close();
  }
}
