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

class BookmarkEventService {
  final StreamController<ListingBookmarkEvent> _listingController =
      StreamController<ListingBookmarkEvent>.broadcast();

  final StreamController<PostBookmarkEvent> _postController =
      StreamController<PostBookmarkEvent>.broadcast();

  Stream<ListingBookmarkEvent> get listingBookmarkChanges =>
      _listingController.stream;

  Stream<PostBookmarkEvent> get postBookmarkChanges => _postController.stream;

  void emitListingBookmark(String listingId, {required bool isBookmarked}) {
    _listingController.add(
      ListingBookmarkEvent(listingId: listingId, isBookmarked: isBookmarked),
    );
  }

  void emitPostBookmark(String postId, {required bool isBookmarked}) {
    _postController.add(
      PostBookmarkEvent(postId: postId, isBookmarked: isBookmarked),
    );
  }

  void dispose() {
    _listingController.close();
    _postController.close();
  }
}
