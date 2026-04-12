import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card_header.dart';

class DraftPostCard extends StatelessWidget {
  final String title;
  final String content;
  final String category;
  final String authorName;
  final String timeAgo;
  final List<String> attachmentUrls;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onPublish;

  const DraftPostCard({
    super.key,
    required this.title,
    required this.content,
    required this.category,
    required this.authorName,
    required this.timeAgo,
    required this.onEdit,
    required this.onDelete,
    required this.onPublish,
    this.attachmentUrls = const [],
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: PostCardHeader(
                    userName: authorName,
                    timeAgo: timeAgo,
                    category: category,
                  ),
                ),
                _DraftMoreMenuButton(onEdit: onEdit, onDelete: onDelete),
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
              content,
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
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: OutlinedButton.icon(
                onPressed: onPublish,
                icon: const Icon(Icons.publish_outlined, size: 16),
                label: Text(l10n.publish),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 6.h,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DraftMoreMenuButton extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _DraftMoreMenuButton({required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(minWidth: 32.w, minHeight: 32.h),
      iconSize: 18.sp,
      icon: Icon(Icons.more_vert, size: 18.sp),
      onSelected: (value) {
        if (value == 'edit') onEdit();
        if (value == 'delete') onDelete();
      },
      itemBuilder: (context) => [
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
        PopupMenuItem(
          value: 'delete',
          child: Row(
            children: [
              Icon(
                Icons.delete_outlined,
                size: 20,
                color: theme.colorScheme.error,
              ),
              SizedBox(width: 8.w),
              Text(
                l10n.delete,
                style: TextStyle(color: theme.colorScheme.error),
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
