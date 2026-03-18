import 'post_model.dart';
import 'comment_model.dart';

class PostsResponse {
  final List<PostModel> posts;
  final bool hasMore;

  const PostsResponse({required this.posts, required this.hasMore});
}

class CommentsResponse {
  final List<CommentModel> comments;
  final bool hasMore;

  const CommentsResponse({required this.comments, required this.hasMore});
}
