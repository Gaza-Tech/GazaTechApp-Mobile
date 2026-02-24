import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/features/search/cubit/search_cubit.dart';
import 'package:gaza_tech/features/search/cubit/search_state.dart';

class ActiveFiltersBar extends StatelessWidget {
  const ActiveFiltersBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (prev, curr) => prev.filters != curr.filters,
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();
        final filters = state.filters;
        final chips = <Widget>[];

        if (filters.categoryId != null && filters.categoryName != null) {
          chips.add(
            _buildChip(
              context,
              filters.categoryName!,
              () => cubit.clearFilter('category'),
            ),
          );
        }

        if (filters.locationId != null && filters.locationName != null) {
          chips.add(
            _buildChip(
              context,
              filters.locationName!,
              () => cubit.clearFilter('location'),
            ),
          );
        }

        if (filters.conditions.isNotEmpty) {
          final l10n = context.l10n;
          final labels = filters.conditions
              .map((c) {
                switch (c) {
                  case 'new':
                    return l10n.conditionNew;
                  case 'like_new':
                    return l10n.conditionLikeNew;
                  case 'refurbished':
                    return l10n.conditionRefurbished;
                  case 'used':
                    return l10n.conditionUsed;
                  default:
                    return c;
                }
              })
              .join(', ');
          chips.add(
            _buildChip(context, labels, () => cubit.clearFilter('condition')),
          );
        }

        if (filters.priceMinUsd != null || filters.priceMaxUsd != null) {
          final min = filters.priceMinUsd?.toString() ?? '0';
          final max = filters.priceMaxUsd?.toString() ?? '∞';
          chips.add(
            _buildChip(
              context,
              '\$$min – \$$max',
              () => cubit.clearFilter('price'),
            ),
          );
        }

        if (filters.priceMinIls != null || filters.priceMaxIls != null) {
          final min = filters.priceMinIls?.toString() ?? '0';
          final max = filters.priceMaxIls?.toString() ?? '∞';
          chips.add(
            _buildChip(
              context,
              '₪$min – ₪$max',
              () => cubit.clearFilter('price'),
            ),
          );
        }

        if (chips.isEmpty) return const SizedBox.shrink();

        return SizedBox(
          height: 44.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            itemCount: chips.length,
            separatorBuilder: (_, _) => SizedBox(width: 8.w),
            itemBuilder: (_, index) => chips[index],
          ),
        );
      },
    );
  }

  Widget _buildChip(BuildContext context, String label, VoidCallback onDelete) {
    return Chip(
      label: Text(label, style: MyTextStyle.body.xs),
      deleteIcon: const Icon(Icons.close),
      onDeleted: onDelete,
      backgroundColor: Theme.of(context).hoverColor,
    );
  }
}
