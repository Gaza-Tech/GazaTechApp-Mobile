import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/features/community/ui/widgets/comment_card.dart';
import 'package:gaza_tech/features/community/ui/widgets/comment_input_bar.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card_actions.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card_header.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_image_gallery.dart';
import 'package:gaza_tech/features/community/ui/widgets/related_post_card.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({super.key});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  bool _isLiked = false;
  bool _isBookmarked = false;
  String? _replyingTo;
  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.postDetails),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (_) {},
            itemBuilder: (_) => [],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  _buildAuthorSection(theme),
                  SizedBox(height: 14.h),
                  _buildPostContent(theme),
                  SizedBox(height: 14.h),
                  const PostImageGallery(),
                  SizedBox(height: 14.h),
                  _buildActions(),
                  Divider(height: 28.h),
                  _buildCommentsSection(theme, l10n),
                  SizedBox(height: 16.h),
                  ..._buildCommentsList(),
                  _buildLoadMoreButton(theme, l10n),
                  SizedBox(height: 8.h),
                  Divider(height: 28.h),
                  _buildRelatedPosts(theme, l10n),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
          CommentInputBar(
            controller: _commentController,
            replyingTo: _replyingTo,
            onDismissReply: () => setState(() => _replyingTo = null),
            onSubmit: () {
              _commentController.clear();
              setState(() => _replyingTo = null);
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAuthorSection(ThemeData theme) {
    return Row(
      children: [
        const Expanded(
          child: PostCardHeader(
            userName: 'Ahmed e assan',
            timeAgo: '2 hours ago',
            category: 'question',
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () {},
          constraints: BoxConstraints(minWidth: 36.w, minHeight: 36.h),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }

  Widget _buildPostContent(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Best Gaming Laptop Under \$1000?',
          style: MyTextStyle.heading.h2.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "I'm looking for recommendations on gaming laptops under \$1000. "
          "I mainly play FPS games and some AAA titles. Need something with "
          "good cooling and at least 144Hz display. What are your suggestions?",
          style: MyTextStyle.body.m.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildActions() {
    return PostCardActions(
      likes: 142,
      comments: 28,
      isLiked: _isLiked,
      isBookmarked: _isBookmarked,
      onLikeToggle: () => setState(() => _isLiked = !_isLiked),
      onBookmarkToggle: () => setState(() => _isBookmarked = !_isBookmarked),
    );
  }

  Widget _buildCommentsSection(ThemeData theme, dynamic l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          l10n.commentsCount(28),
          style: MyTextStyle.heading.h3.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        Row(
          children: [
            Text(
              l10n.topSort,
              style: MyTextStyle.action.m.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 20.sp,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildCommentsList() {
    return [
      CommentCard(
        userName: 'Sarah Miller',
        timeAgo: '1 hour ago',
        text:
            "I'd recommend the ASUS TUF Gaming A15. Great performance for the "
            "price and excellent cooling system. I've been using it for 6 months now.",
        likes: 24,
        onReply: () => setState(() => _replyingTo = 'Sarah Miller'),
      ),
      CommentCard(
        userName: 'Ahmed e assan',
        timeAgo: '45 min ago',
        text: "Thanks! I'll check it out. What's the battery life like?",
        likes: 8,
        indentLevel: 1,
        onReply: () => setState(() => _replyingTo = 'Ahmed e assan'),
      ),
      CommentCard(
        userName: 'Mike Chen',
        timeAgo: '2 hours ago',
        text:
            'Lenovo Legion 5 is another solid option. Better build quality and '
            'the keyboard is amazing for gaming.',
        likes: 18,
        onReply: () => setState(() => _replyingTo = 'Mike Chen'),
      ),
      CommentCard(
        userName: 'David Park',
        timeAgo: '3 hours ago',
        text:
            "Don't forget to check the RAM and storage options. Make sure you "
            'can upgrade later if needed.',
        likes: 12,
        onReply: () => setState(() => _replyingTo = 'David Park'),
      ),
    ];
  }

  Widget _buildLoadMoreButton(ThemeData theme, dynamic l10n) {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          l10n.loadMoreComments,
          style: MyTextStyle.action.m.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildRelatedPosts(ThemeData theme, dynamic l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.relatedPosts,
          style: MyTextStyle.heading.h3.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 12.h),
        const RelatedPostCard(
          title: 'Best Budget Gaming PC Build 2024',
          category: 'Gaming',
          likes: 89,
          comments: 34,
        ),
        const RelatedPostCard(
          title: '144Hz vs 240Hz Monitors: Worth the Upgrade?',
          category: 'Gaming',
          likes: 156,
          comments: 67,
        ),
      ],
    );
  }
}
