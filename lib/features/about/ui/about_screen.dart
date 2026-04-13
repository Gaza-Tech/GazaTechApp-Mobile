import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/helpers/url_launcher_helper.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const String _appVersion = '1.0.0';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.about)),
      body: ListView(
        padding: EdgeInsets.only(bottom: 32.h),
        children: [
          _AppInfoHeader(
            isDark: isDark,
            version: _appVersion,
            appTitle: l10n.appTitle,
          ),
          const Divider(),
          _SectionHeader(title: l10n.ourMission, isDark: isDark),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Text(
              l10n.missionDescription,
              style: MyTextStyle.body.m.copyWith(
                color: isDark
                    ? MyColors.dark.textSecondary
                    : MyColors.light.textSecondary,
                height: 1.6,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: Text(l10n.termsOfService, style: MyTextStyle.body.m),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => UrlLauncherHelper.launchExternalUrl(
              'https://gazatech.app/terms',
            ),
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: Text(l10n.privacyPolicy, style: MyTextStyle.body.m),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => UrlLauncherHelper.launchExternalUrl(
              'https://gazatech.app/privacy',
            ),
          ),
          ListTile(
            leading: const Icon(Icons.source_outlined),
            title: Text(l10n.openSourceLicenses, style: MyTextStyle.body.m),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => showLicensePage(
              context: context,
              applicationName: l10n.appTitle,
              applicationVersion: _appVersion,
            ),
          ),
          SizedBox(height: 32.h),
          Center(
            child: Text(
              l10n.madeWithLove,
              style: MyTextStyle.body.s.copyWith(
                color: isDark
                    ? MyColors.dark.textTertiary
                    : MyColors.light.textTertiary,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Center(
            child: Text(
              '${l10n.appVersion} $_appVersion',
              style: MyTextStyle.body.s.copyWith(
                color: isDark
                    ? MyColors.dark.textDisabled
                    : MyColors.light.textDisabled,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppInfoHeader extends StatelessWidget {
  final bool isDark;
  final String version;
  final String appTitle;

  const _AppInfoHeader({
    required this.isDark,
    required this.version,
    required this.appTitle,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundColor: theme.colorScheme.primaryContainer,
            child: Icon(
              Icons.devices_rounded,
              size: 40.sp,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            appTitle,
            style: MyTextStyle.heading.h2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            l10n.aboutDescription,
            style: MyTextStyle.body.m.copyWith(
              color: isDark
                  ? MyColors.dark.textSecondary
                  : MyColors.light.textSecondary,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final bool isDark;

  const _SectionHeader({required this.title, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 4.h),
      child: Text(
        title.toUpperCase(),
        style: MyTextStyle.caption.m.copyWith(
          color: isDark ? MyColors.primary.onDark : MyColors.primary.base,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
