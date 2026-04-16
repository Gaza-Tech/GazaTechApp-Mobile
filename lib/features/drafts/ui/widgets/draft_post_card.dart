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
  final bool isVerified;
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
    this.isVerified = false,
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
            PostCardHeader(
              userName: authorName,
              timeAgo: timeAgo,
              category: category,
              isVerified: isVerified,
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
            Row(
              children: [
                _ActionButton(
                  icon: Icons.delete_outlined,
                  label: l10n.delete,
                  onTap: onDelete,
                  color: theme.colorScheme.error,
                ),
                SizedBox(width: 8.w),
                _ActionButton(
                  icon: Icons.edit_outlined,
                  label: l10n.edit,
                  onTap: onEdit,
                ),
                const Spacer(),
                OutlinedButton.icon(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = color ?? theme.colorScheme.onSurfaceVariant;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16.sp, color: effectiveColor),
            SizedBox(width: 4.w),
            Text(
              label,
              style: MyTextStyle.body.xs.copyWith(color: effectiveColor),
            ),
          ],
        ),
      ),
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
                  placeholder: (_, _) => Container(
                    color: theme.colorScheme.surfaceContainerHighest,
                  ),
                  errorWidget: (_, _, _) => Container(
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
