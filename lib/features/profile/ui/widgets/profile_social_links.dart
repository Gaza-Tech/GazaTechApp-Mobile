import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/helpers/url_launcher_helper.dart';
import 'package:gaza_tech/features/profile/data/models/user_profile_model.dart';
import 'package:gaza_tech/l10n/app_localizations.dart';

class ProfileSocialLinks extends StatelessWidget {
  final UserProfileModel profile;

  const ProfileSocialLinks({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    final links = <_SocialLink>[
      if (profile.phoneNumber != null)
        _SocialLink(
          icon: Icons.phone_outlined,
          label: l10n.phoneNumber,
          onTap: () => _launchAndHandle(
            context,
            l10n,
            UrlLauncherHelper.launchPhoneDialer(profile.phoneNumber!),
          ),
        ),
      if (profile.whatsappNumber != null)
        _SocialLink(
          icon: Icons.chat_outlined,
          label: l10n.whatsappNumber,
          onTap: () => _launchAndHandle(
            context,
            l10n,
            UrlLauncherHelper.launchWhatsApp(profile.whatsappNumber!),
          ),
        ),
      if (profile.facebookLinkUrl != null)
        _SocialLink(
          icon: Icons.facebook,
          label: l10n.facebookLink,
          onTap: () => _launchAndHandle(
            context,
            l10n,
            UrlLauncherHelper.launchExternalUrl(profile.facebookLinkUrl!),
          ),
        ),
      if (profile.instagramLinkUrl != null)
        _SocialLink(
          icon: Icons.camera_alt_outlined,
          label: l10n.instagramLink,
          onTap: () => _launchAndHandle(
            context,
            l10n,
            UrlLauncherHelper.launchExternalUrl(profile.instagramLinkUrl!),
          ),
        ),
      if (profile.twitterLinkUrl != null)
        _SocialLink(
          icon: Icons.alternate_email,
          label: l10n.twitterLink,
          onTap: () => _launchAndHandle(
            context,
            l10n,
            UrlLauncherHelper.launchExternalUrl(profile.twitterLinkUrl!),
          ),
        ),
      if (profile.websiteUrl != null)
        _SocialLink(
          icon: Icons.language,
          label: l10n.website,
          onTap: () => _launchAndHandle(
            context,
            l10n,
            UrlLauncherHelper.launchExternalUrl(profile.websiteUrl!),
          ),
        ),
    ];

    if (links.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 8.w,
      runSpacing: 4.h,
      children: links
          .map(
            (link) => ActionChip(
              avatar: Icon(
                link.icon,
                size: 16.sp,
                color: theme.colorScheme.primary,
              ),
              label: Text(link.label, style: theme.textTheme.bodySmall),
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              side: BorderSide.none,
              onPressed: link.onTap,
            ),
          )
          .toList(),
    );
  }

  void _launchAndHandle(
    BuildContext context,
    AppLocalizations l10n,
    Future<bool> future,
  ) async {
    final success = await future;
    if (!success && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.couldNotOpenLink)));
    }
  }
}

class _SocialLink {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  _SocialLink({required this.icon, required this.label, required this.onTap});
}
