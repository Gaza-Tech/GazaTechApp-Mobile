import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/helpers/url_launcher_helper.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  static const String _supportEmail = 'support@gazatech.app';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.help)),
      body: ListView(
        padding: EdgeInsets.only(bottom: 24.h),
        children: [
          _SectionHeader(title: l10n.faq, isDark: isDark),
          _FaqTile(
            question: l10n.helpFaqBuyingTitle,
            answer: l10n.helpFaqBuyingBody,
          ),
          _FaqTile(
            question: l10n.helpFaqSellingTitle,
            answer: l10n.helpFaqSellingBody,
          ),
          _FaqTile(
            question: l10n.helpFaqVerificationTitle,
            answer: l10n.helpFaqVerificationBody,
          ),
          _FaqTile(
            question: l10n.helpFaqPostingTitle,
            answer: l10n.helpFaqPostingBody,
          ),
          const Divider(),
          _SectionHeader(title: l10n.communityGuidelines, isDark: isDark),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Text(
              l10n.helpGuidelinesBody,
              style: MyTextStyle.body.m.copyWith(
                color: isDark
                    ? MyColors.dark.textSecondary
                    : MyColors.light.textSecondary,
                height: 1.5,
              ),
            ),
          ),
          const Divider(),
          _SectionHeader(title: l10n.contactSupport, isDark: isDark),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            child: Text(
              l10n.helpContactDescription,
              style: MyTextStyle.body.m.copyWith(
                color: isDark
                    ? MyColors.dark.textSecondary
                    : MyColors.light.textSecondary,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.email_outlined),
            title: Text(l10n.emailSupport, style: MyTextStyle.body.m),
            subtitle: Text(
              _supportEmail,
              style: MyTextStyle.body.s.copyWith(
                color: isDark
                    ? MyColors.dark.textTertiary
                    : MyColors.light.textTertiary,
              ),
            ),
            trailing: const Icon(Icons.open_in_new, size: 18),
            onTap: () => UrlLauncherHelper.launchExternalUrl(
              'mailto:$_supportEmail?subject=Support%20Request',
            ),
          ),
          ListTile(
            leading: const Icon(Icons.bug_report_outlined),
            title: Text(l10n.reportBug, style: MyTextStyle.body.m),
            subtitle: Text(
              _supportEmail,
              style: MyTextStyle.body.s.copyWith(
                color: isDark
                    ? MyColors.dark.textTertiary
                    : MyColors.light.textTertiary,
              ),
            ),
            trailing: const Icon(Icons.open_in_new, size: 18),
            onTap: () => UrlLauncherHelper.launchExternalUrl(
              'mailto:$_supportEmail?subject=Bug%20Report',
            ),
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

class _FaqTile extends StatelessWidget {
  final String question;
  final String answer;

  const _FaqTile({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ExpansionTile(
      tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
      childrenPadding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
      title: Text(
        question,
        style: MyTextStyle.body.m.copyWith(fontWeight: FontWeight.w500),
      ),
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            answer,
            style: MyTextStyle.body.s.copyWith(
              color: isDark
                  ? MyColors.dark.textSecondary
                  : MyColors.light.textSecondary,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
