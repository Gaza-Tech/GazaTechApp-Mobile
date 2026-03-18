import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/features/marketplace/cubit/marketplace_cubit.dart';
import 'package:gaza_tech/features/marketplace/cubit/marketplace_state.dart';
import 'package:gaza_tech/features/marketplace/data/models/marketplace_sort.dart';

void showMarketplaceSortSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (_) => BlocProvider.value(
      value: context.read<MarketplaceCubit>(),
      child: const _MarketplaceSortSheet(),
    ),
  );
}

class _MarketplaceSortSheet extends StatelessWidget {
  const _MarketplaceSortSheet();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketplaceCubit, MarketplaceState>(
      builder: (context, state) {
        final cubit = context.read<MarketplaceCubit>();
        final l10n = context.l10n;
        final theme = Theme.of(context);

        final options = [
          (MarketplaceSort.newest, l10n.sortNewest),
          (MarketplaceSort.oldest, l10n.oldest),
          (MarketplaceSort.priceLowToHigh, l10n.sortPriceLowToHigh),
          (MarketplaceSort.priceHighToLow, l10n.sortPriceHighToLow),
        ];

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
                    color: theme.colorScheme.onSurfaceVariant
                        .withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                l10n.sortBy,
                style: MyTextStyle.body.l.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8.h),
              Divider(height: 1.h),
              SizedBox(height: 8.h),
              ...options.map(
                (entry) => _SortOption(
                  label: entry.$2,
                  selected: state.activeSort == entry.$1,
                  onTap: () {
                    cubit.updateSort(entry.$1);
                    Navigator.pop(context);
                  },
                ),
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
                  fontWeight:
                      selected ? FontWeight.w600 : FontWeight.normal,
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
