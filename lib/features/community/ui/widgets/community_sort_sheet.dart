import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/features/community/cubit/community_cubit.dart';
import 'package:gaza_tech/features/community/cubit/community_state.dart';
import 'package:gaza_tech/features/community/data/models/community_sort.dart';

void showCommunitySortSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (_) => BlocProvider.value(
      value: context.read<CommunityCubit>(),
      child: const _CommunitySortSheet(),
    ),
  );
}

class _CommunitySortSheet extends StatelessWidget {
  const _CommunitySortSheet();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityCubit, CommunityState>(
      builder: (context, state) {
        final cubit = context.read<CommunityCubit>();
        final l10n = context.l10n;
        final theme = Theme.of(context);

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
                    color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.sortPosts,
                    style: MyTextStyle.body.l.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      cubit.updateTimeSort(CommunityTimeSort.newest);
                      if (state.popularitySort != null) {
                        cubit.updatePopularitySort(state.popularitySort!);
                      }
                    },
                    child: Text(l10n.resetSort),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Divider(height: 1.h),
              SizedBox(height: 12.h),
              Text(
                l10n.timeBased.toUpperCase(),
                style: MyTextStyle.body.s.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  letterSpacing: 0.8,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  _SortOption(
                    label: l10n.newest,
                    selected: state.timeSort == CommunityTimeSort.newest,
                    onTap: () => cubit.updateTimeSort(CommunityTimeSort.newest),
                  ),
                  SizedBox(width: 12.w),
                  _SortOption(
                    label: l10n.oldest,
                    selected: state.timeSort == CommunityTimeSort.oldest,
                    onTap: () => cubit.updateTimeSort(CommunityTimeSort.oldest),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Divider(height: 1.h),
              SizedBox(height: 12.h),
              Text(
                l10n.popularity.toUpperCase(),
                style: MyTextStyle.body.s.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  letterSpacing: 0.8,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  _SortOption(
                    label: l10n.mostLiked,
                    selected:
                        state.popularitySort == CommunityPopularitySort.mostLiked,
                    onTap: () => cubit
                        .updatePopularitySort(CommunityPopularitySort.mostLiked),
                  ),
                  SizedBox(width: 12.w),
                  _SortOption(
                    label: l10n.mostCommented,
                    selected: state.popularitySort ==
                        CommunityPopularitySort.mostCommented,
                    onTap: () => cubit.updatePopularitySort(
                        CommunityPopularitySort.mostCommented),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SortOption extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _SortOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selected
              ? theme.colorScheme.primary.withValues(alpha: 0.12)
              : theme.colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: selected
                ? theme.colorScheme.primary
                : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (selected) ...[
              Icon(
                Icons.check_circle_rounded,
                size: 16.sp,
                color: theme.colorScheme.primary,
              ),
              SizedBox(width: 4.w),
            ],
            Text(
              label,
              style: MyTextStyle.body.m.copyWith(
                color: selected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurface,
                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
