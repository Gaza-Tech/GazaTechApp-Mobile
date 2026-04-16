import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  static const String _contactEmail = 'gaza.tect.app@gmail.com';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.privacyTitle)),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        children: [
          _LastUpdated(text: l10n.privacyLastUpdated, isDark: isDark),
          SizedBox(height: 12.h),
          _BodyText(text: l10n.privacyIntro, isDark: isDark),
          SizedBox(height: 24.h),
          _SectionTitle(text: l10n.privacyCollectionTitle, isDark: isDark),
          _BodyText(text: l10n.privacyCollectionBody, isDark: isDark),
          SizedBox(height: 20.h),
          _SectionTitle(text: l10n.privacyUseTitle, isDark: isDark),
          _BodyText(text: l10n.privacyUseBody, isDark: isDark),
          SizedBox(height: 20.h),
          _SectionTitle(text: l10n.privacyStorageTitle, isDark: isDark),
          _BodyText(text: l10n.privacyStorageBody, isDark: isDark),
          SizedBox(height: 20.h),
          _SectionTitle(text: l10n.privacySharingTitle, isDark: isDark),
          _BodyText(text: l10n.privacySharingBody, isDark: isDark),
          SizedBox(height: 20.h),
          _SectionTitle(text: l10n.privacyRightsTitle, isDark: isDark),
          _BodyText(text: l10n.privacyRightsBody, isDark: isDark),
          SizedBox(height: 20.h),
          _SectionTitle(text: l10n.privacyRetentionTitle, isDark: isDark),
          _BodyText(text: l10n.privacyRetentionBody, isDark: isDark),
          SizedBox(height: 20.h),
          _SectionTitle(text: l10n.privacyChildrenTitle, isDark: isDark),
          _BodyText(text: l10n.privacyChildrenBody, isDark: isDark),
          SizedBox(height: 20.h),
          _SectionTitle(text: l10n.privacyChangesTitle, isDark: isDark),
          _BodyText(text: l10n.privacyChangesBody, isDark: isDark),
          SizedBox(height: 20.h),
          _SectionTitle(text: l10n.privacyContactTitle, isDark: isDark),
          _BodyText(text: l10n.privacyContactBody, isDark: isDark),
          SizedBox(height: 4.h),
          _ContactEmail(email: _contactEmail, isDark: isDark),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}

class _LastUpdated extends StatelessWidget {
  final String text;
  final bool isDark;

  const _LastUpdated({required this.text, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: MyTextStyle.caption.m.copyWith(
        color: isDark
            ? MyColors.dark.textTertiary
            : MyColors.light.textTertiary,
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  final bool isDark;

  const _SectionTitle({required this.text, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: MyTextStyle.body.m.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _BodyText extends StatelessWidget {
  final String text;
  final bool isDark;

  const _BodyText({required this.text, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: MyTextStyle.body.s.copyWith(
        color: isDark
            ? MyColors.dark.textSecondary
            : MyColors.light.textSecondary,
        height: 1.6,
      ),
    );
  }
}

class _ContactEmail extends StatelessWidget {
  final String email;
  final bool isDark;

  const _ContactEmail({required this.email, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Text(
      email,
      style: MyTextStyle.body.s.copyWith(
        color: isDark ? MyColors.primary.onDark : MyColors.primary.base,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
