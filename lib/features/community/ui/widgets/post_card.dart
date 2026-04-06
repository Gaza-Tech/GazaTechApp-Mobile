import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card_actions.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card_header.dart';

class PostCard extends StatelessWidget {
  final String userName;
  final String timeAgo;
  final String category;
  final String title;
  final String description;
  final int likes;
  final int comments;
  final bool isLiked;
  final bool isBookmarked;
  final VoidCallback? onLikeToggle;
  final VoidCallback? onBookmarkToggle;
  final VoidCallback? onTap;
  final String? avatarUrl;
  final VoidCallback? onAuthorTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final List<String> attachmentUrls;

  const PostCard({
    super.key,
    required this.userName,
    required this.timeAgo,
    required this.category,
    required this.title,
    required this.description,
    required this.likes,
    required this.comments,
    this.isLiked = false,
    this.isBookmarked = false,
    this.onLikeToggle,
    this.onBookmarkToggle,
    this.onTap,
    this.avatarUrl,
    this.onAuthorTap,
    this.onEdit,
    this.onDelete,
    this.attachmentUrls = const [],
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: PostCardHeader(
                      userName: userName,
                      timeAgo: timeAgo,
                      category: category,
                      avatarUrl: avatarUrl,
                      onAuthorTap: onAuthorTap,
                    ),
                  ),
                  if (onEdit != null || onDelete != null)
                    _PostMoreMenuButton(onEdit: onEdit, onDelete: onDelete),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                title,
                style: MyTextStyle.heading.h4.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 6.h),
              Text(
                description,
                style: MyTextStyle.body.s.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (attachmentUrls.isNotEmpty) ...[
                SizedBox(height: 10.h),
                _PostCardThumbnails(urls: attachmentUrls),
              ],
              SizedBox(height: 12.h),
              PostCardActions(
                likes: likes,
                comments: comments,
                isLiked: isLiked,
                isBookmarked: isBookmarked,
                onLikeToggle: onLikeToggle,
                onBookmarkToggle: onBookmarkToggle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PostMoreMenuButton extends StatelessWidget {
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const _PostMoreMenuButton({this.onEdit, this.onDelete});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(minWidth: 32.w, minHeight: 32.h),
      iconSize: 18.sp,
      icon: Icon(Icons.more_vert, size: 18.sp),
      onSelected: (value) {
        if (value == 'edit') onEdit?.call();
        if (value == 'delete') onDelete?.call();
      },
      itemBuilder: (context) => [
        if (onEdit != null)
          PopupMenuItem(
            value: 'edit',
            child: Row(
              children: [
                const Icon(Icons.edit_outlined, size: 20),
                SizedBox(width: 8.w),
                Text(l10n.edit),
              ],
            ),
          ),
        if (onDelete != null)
          PopupMenuItem(
            value: 'delete',
            child: Row(
              children: [
                Icon(
                  Icons.delete_outlined,
                  size: 20,
                  color: Theme.of(context).colorScheme.error,
                ),
                SizedBox(width: 8.w),
                Text(
                  l10n.delete,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _PostCardThumbnails extends StatelessWidget {
  final List<String> urls;

  const _PostCardThumbnails({required this.urls});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 100.h,
      child: Row(
        children: [
          for (int i = 0; i < urls.length; i++) ...[
            if (i > 0) SizedBox(width: 6.w),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl: urls[i],
                  fit: BoxFit.cover,
                  height: 100.h,
                  memCacheWidth: 200,
                  placeholder: (_, __) => Container(
                    color: theme.colorScheme.surfaceContainerHighest,
                  ),
                  errorWidget: (_, __, ___) => Container(
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: const Icon(Icons.image_not_supported_outlined),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
