import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/localization/locale_cubit.dart';
import 'package:gaza_tech/core/localization/locale_state.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

/// Shows the language selection bottom sheet.
/// Requires [LocaleCubit] to be available in the widget tree.
void showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (_) => BlocProvider.value(
      value: context.read<LocaleCubit>(),
      child: const _LanguageSheet(),
    ),
  );
}

class _LanguageSheet extends StatelessWidget {
  const _LanguageSheet();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        final l10n = context.l10n;
        final theme = Theme.of(context);
        final currentCode = state.locale.languageCode;

        return Padding(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 32.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurfaceVariant.withValues(
                      alpha: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                l10n.language,
                style: MyTextStyle.body.l.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 8.h),
              Divider(height: 1.h),
              SizedBox(height: 8.h),
              _LanguageOption(
                label: l10n.english,
                selected: currentCode == 'en',
                onTap: () {
                  context.read<LocaleCubit>().changeLocale(const Locale('en'));
                  Navigator.pop(context);
                },
              ),
              _LanguageOption(
                label: l10n.arabic,
                selected: currentCode == 'ar',
                onTap: () {
                  context.read<LocaleCubit>().changeLocale(const Locale('ar'));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 4.w),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: MyTextStyle.body.m.copyWith(
                  color: selected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
            if (selected)
              Icon(
                Icons.check_rounded,
                size: 20.sp,
                color: theme.colorScheme.primary,
              ),
          ],
        ),
      ),
    );
  }
}
