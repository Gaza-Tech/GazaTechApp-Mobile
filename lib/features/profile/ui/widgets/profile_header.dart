import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/profile/data/models/user_profile_model.dart';
import 'profile_social_links.dart';
import 'verification_badge_button.dart';

class ProfileHeader extends StatelessWidget {
  final UserProfileModel profile;
  final bool isOwnProfile;
  final String? verificationStatus;

  const ProfileHeader({
    super.key,
    required this.profile,
    this.isOwnProfile = false,
    this.verificationStatus,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildAvatar(theme),
          const VerticalSpace(12),
          _buildNameRow(context, theme),
          if (isOwnProfile && !profile.isVerified) ...[
            const VerticalSpace(8),
            VerificationBadgeButton(verificationStatus: verificationStatus),
          ],
          if (profile.bio != null && profile.bio!.isNotEmpty) ...[
            const VerticalSpace(8),
            Text(
              profile.bio!,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const VerticalSpace(8),
          Text(
            context.l10n.memberSince(_formatDate(profile.createdAt)),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          if (profile.hasSocialLinks) ...[
            const VerticalSpace(12),
            ProfileSocialLinks(profile: profile),
          ],
        ],
      ),
    );
  }

  Widget _buildAvatar(ThemeData theme) {
    return CircleAvatar(
      radius: 44.r,
      backgroundColor: theme.colorScheme.surfaceContainerHighest,
      child: ClipOval(
        child: profile.avatarUrl != null
            ? CachedNetworkImage(
                imageUrl: profile.avatarUrl!,
                width: 88.r,
                height: 88.r,
                fit: BoxFit.cover,
                placeholder: (_, _) => _buildInitials(theme),
                errorWidget: (_, _, _) => _buildInitials(theme),
              )
            : _buildInitials(theme),
      ),
    );
  }

  Widget _buildInitials(ThemeData theme) {
    final initials = profile.fullName.isNotEmpty
        ? profile.fullName[0].toUpperCase()
        : '?';
    return Container(
      width: 88.r,
      height: 88.r,
      color: theme.colorScheme.surfaceContainerHighest,
      child: Center(
        child: Text(
          initials,
          style: TextStyle(
            fontSize: 36.sp,
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildNameRow(BuildContext context, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          profile.fullName,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        if (profile.isVerified) ...[
          SizedBox(width: 6.w),
          Icon(Icons.verified, size: 20.sp, color: theme.colorScheme.primary),
        ],
      ],
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }
}
