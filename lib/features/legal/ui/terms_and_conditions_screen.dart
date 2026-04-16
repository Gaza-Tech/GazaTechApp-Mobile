import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  static const String _contactEmail = 'gaza.tect.app@gmail.com';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.termsTitle)),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        children: [
          _LastUpdated(text: l10n.termsLastUpdated, isDark: isDark),
          SizedBox(height: 12.h),
          _BodyText(text: l10n.termsIntro, isDark: isDark),
          SizedBox(height: 24.h),
          _SectionTitle(text: l10n.termsAccountTitle, isDark: isDark),
          _BodyText(text: l10n.termsAccountBody, isDark: isDark),
          SizedBox(height: 20.h),
          _SectionTitle(text: l10n.termsMarketplaceTitle, isDark: isDark),
          _BodyText(text: l10n.termsMarketplaceBody, isDark: isDark),
          SizedBox(height: 20.h),
          _SectionTitle(text: l10n.termsCommunityTitle, isDark: isDark),
          _BodyText(text: l10n.termsCommunityBody, isDark: isDark),
          SizedBox(height: 20.h),
          _SectionTitle(text: l10n.termsContentTitle, isDark: isDark),
          _BodyText(text: l10n.termsContentBody, isDark: isDark),
          SizedBox(height: 20.h),
          _SectionTitle(text: l10n.termsVerificationTitle, isDark: isDark),
          _BodyText(text: l10n.termsVerificationBody, isDark: isDark),
          SizedBox(height: 20.h),
          _SectionTitle(text: l10n.termsIntellectualTitle, isDark: isDark),
          _BodyText(text: l10n.termsIntellectualBody, isDark: isDark),
          SizedBox(height: 20.h),
          _SectionTitle(text: l10n.termsLiabilityTitle, isDark: isDark),
          _BodyText(text: l10n.termsLiabilityBody, isDark: isDark),
          SizedBox(height: 20.h),
          _SectionTitle(text: l10n.termsChangesTitle, isDark: isDark),
          _BodyText(text: l10n.termsChangesBody, isDark: isDark),
          SizedBox(height: 20.h),
          _SectionTitle(text: l10n.termsContactTitle, isDark: isDark),
          _BodyText(text: l10n.termsContactBody, isDark: isDark),
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
