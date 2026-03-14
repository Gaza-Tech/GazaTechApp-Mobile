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
                  case 'brand_new':
                    return l10n.conditionBrandNew;
                  case 'used_excellent':
                    return l10n.conditionUsedExcellent;
                  case 'used_good':
                    return l10n.conditionUsedGood;
                  case 'for_parts':
                    return l10n.conditionForParts;
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

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Wrap(spacing: 8.w, runSpacing: 8.h, children: chips),
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
    );
  }
}
