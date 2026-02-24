import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/search/cubit/search_cubit.dart';
import 'package:gaza_tech/features/search/cubit/search_state.dart';
import 'package:gaza_tech/features/search/data/models/search_filters_model.dart';

void showFilterBottomSheet(BuildContext context) {
  final cubit = context.read<SearchCubit>();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.dg)),
    ),
    builder: (_) {
      return BlocProvider.value(
        value: cubit,
        child: const _FilterBottomSheetContent(),
      );
    },
  );
}

class _FilterBottomSheetContent extends StatelessWidget {
  const _FilterBottomSheetContent();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();
        final filters = state.filters;
        final isArabic = Localizations.localeOf(context).languageCode == 'ar';

        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            initialChildSize: 0.9,
            maxChildSize: 0.9,
            minChildSize: 0.5,
            expand: false,
            builder: (context, scrollController) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    const VerticalSpace(12),
                    // Handle bar
                    Center(
                      child: Container(
                        width: 40.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: MyColors.light.icon,
                          borderRadius: BorderRadius.circular(2.dg),
                        ),
                      ),
                    ),
                    const VerticalSpace(16),

                    // Header (fixed)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.filters, style: MyTextStyle.heading.h2),
                        Row(
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  MyColors.primary.container,
                                ),
                              ),
                              onPressed: () {
                                cubit.applyFiltersAndSearch();
                                Navigator.pop(context);
                              },
                              child: Text(
                                l10n.applyFilters,
                                style: MyTextStyle.action.m.copyWith(
                                  color: MyColors.primary.base,
                                ),
                              ),
                            ),
                            const HorizontalSpace(8),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  MyColors.status.error.container,
                                ),
                              ),
                              onPressed: () => cubit.clearFilters(),
                              child: Text(
                                l10n.clearAll,
                                style: MyTextStyle.action.m.copyWith(
                                  color: MyColors.status.error.main,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const VerticalSpace(20),

                    // Scrollable content
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        children: [
                          // Sort section
                          Text(l10n.sortBy, style: MyTextStyle.heading.h4),
                          const VerticalSpace(8),
                          ...SearchSortOption.values.map((option) {
                            final isSelected = filters.sort == option;
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              leading: Radio<SearchSortOption>(
                                value: option,
                                groupValue: filters.sort,
                                activeColor: MyColors.primary.base,
                                onChanged: (value) {
                                  if (value != null) cubit.updateSort(value);
                                },
                              ),
                              title: Text(
                                _getSortLabel(l10n, option),
                                style: MyTextStyle.body.m.copyWith(
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                ),
                              ),
                              onTap: () => cubit.updateSort(option),
                            );
                          }),
                          const VerticalSpace(16),

                          // Category dropdown
                          Text(
                            l10n.categoryLabel,
                            style: MyTextStyle.heading.h4,
                          ),
                          const VerticalSpace(8),
                          DropdownButtonFormField<String?>(
                            initialValue: filters.categoryId,
                            isExpanded: true,
                            decoration: InputDecoration(
                              hintText: l10n.selectCategory,
                              hintStyle: MyTextStyle.body.m.copyWith(
                                color: theme.textTheme.bodySmall?.color,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 10.h,
                              ),
                            ),
                            items: [
                              DropdownMenuItem<String?>(
                                value: null,
                                child: Text(
                                  l10n.categoryAll,
                                  style: MyTextStyle.body.m,
                                ),
                              ),
                              ...state.categories.map((cat) {
                                final name = isArabic
                                    ? (cat.nameAr?.isNotEmpty == true
                                          ? cat.nameAr!
                                          : cat.name)
                                    : cat.name;
                                return DropdownMenuItem<String?>(
                                  value: cat.id,
                                  child: Text(name, style: MyTextStyle.body.m),
                                );
                              }),
                            ],
                            onChanged: (value) {
                              if (value == null) {
                                cubit.setCategory(null, null);
                              } else {
                                final cat = state.categories.firstWhere(
                                  (c) => c.id == value,
                                );
                                final name = isArabic
                                    ? (cat.nameAr?.isNotEmpty == true
                                          ? cat.nameAr!
                                          : cat.name)
                                    : cat.name;
                                cubit.setCategory(value, name);
                              }
                            },
                          ),
                          const VerticalSpace(16),

                          // Location dropdown
                          Text(
                            l10n.locationLabel,
                            style: MyTextStyle.heading.h4,
                          ),
                          const VerticalSpace(8),
                          DropdownButtonFormField<String?>(
                            initialValue: filters.locationId,
                            isExpanded: true,
                            decoration: InputDecoration(
                              hintText: l10n.selectLocation,
                              hintStyle: MyTextStyle.body.m.copyWith(
                                color: theme.textTheme.bodySmall?.color,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 10.h,
                              ),
                            ),
                            items: [
                              DropdownMenuItem<String?>(
                                value: null,
                                child: Text(
                                  l10n.categoryAll,
                                  style: MyTextStyle.body.m,
                                ),
                              ),
                              ...state.locations.map((loc) {
                                final name = isArabic
                                    ? (loc.nameAr?.isNotEmpty == true
                                          ? loc.nameAr!
                                          : loc.name)
                                    : loc.name;
                                return DropdownMenuItem<String?>(
                                  value: loc.locationId,
                                  child: Text(name, style: MyTextStyle.body.m),
                                );
                              }),
                            ],
                            onChanged: (value) {
                              if (value == null) {
                                cubit.setLocation(null, null);
                              } else {
                                final loc = state.locations.firstWhere(
                                  (l) => l.locationId == value,
                                );
                                final name = isArabic
                                    ? (loc.nameAr?.isNotEmpty == true
                                          ? loc.nameAr!
                                          : loc.name)
                                    : loc.name;
                                cubit.setLocation(value, name);
                              }
                            },
                          ),
                          const VerticalSpace(16),

                          // Condition chips
                          Text(
                            l10n.conditionFilter,
                            style: MyTextStyle.heading.h4,
                          ),
                          const VerticalSpace(8),
                          Wrap(
                            spacing: 8.w,
                            runSpacing: 8.h,
                            children: [
                              _buildConditionChip(
                                context,
                                'new',
                                l10n.conditionNew,
                                filters,
                              ),
                              _buildConditionChip(
                                context,
                                'like_new',
                                l10n.conditionLikeNew,
                                filters,
                              ),
                              _buildConditionChip(
                                context,
                                'refurbished',
                                l10n.conditionRefurbished,
                                filters,
                              ),
                              _buildConditionChip(
                                context,
                                'used',
                                l10n.conditionUsed,
                                filters,
                              ),
                            ],
                          ),
                          const VerticalSpace(16),

                          // Price range USD
                          Text(
                            l10n.priceRangeUsd,
                            style: MyTextStyle.heading.h4,
                          ),
                          const VerticalSpace(8),
                          _buildPriceRangeRow(
                            theme: theme,
                            l10n: l10n,
                            minController: cubit.priceMinUsdController,
                            maxController: cubit.priceMaxUsdController,
                          ),
                          const VerticalSpace(16),

                          // Price range ILS
                          Text(
                            l10n.priceRangeIls,
                            style: MyTextStyle.heading.h4,
                          ),
                          const VerticalSpace(8),
                          _buildPriceRangeRow(
                            theme: theme,
                            l10n: l10n,
                            minController: cubit.priceMinIlsController,
                            maxController: cubit.priceMaxIlsController,
                          ),
                          const VerticalSpace(12),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildPriceRangeRow({
    required ThemeData theme,
    required dynamic l10n,
    required TextEditingController minController,
    required TextEditingController maxController,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: minController,
            keyboardType: TextInputType.number,
            style: MyTextStyle.body.m,
            decoration: InputDecoration(
              hintText: l10n.priceMin,
              hintStyle: MyTextStyle.body.m.copyWith(
                color: theme.textTheme.bodySmall?.color,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 10.h,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text('–', style: MyTextStyle.body.l),
        ),
        Expanded(
          child: TextField(
            controller: maxController,
            keyboardType: TextInputType.number,
            style: MyTextStyle.body.m,
            decoration: InputDecoration(
              hintText: l10n.priceMax,
              hintStyle: MyTextStyle.body.m.copyWith(
                color: theme.textTheme.bodySmall?.color,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 10.h,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConditionChip(
    BuildContext context,
    String value,
    String label,
    SearchFiltersModel filters,
  ) {
    final isSelected = filters.conditions.contains(value);
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: MyColors.primary.soft,
      checkmarkColor: MyColors.primary.base,
      labelStyle: MyTextStyle.body.s.copyWith(
        color: isSelected ? MyColors.primary.base : null,
      ),
      onSelected: (_) => context.read<SearchCubit>().toggleCondition(value),
    );
  }

  String _getSortLabel(dynamic l10n, SearchSortOption option) {
    switch (option) {
      case SearchSortOption.newest:
        return l10n.sortNewest;
      case SearchSortOption.priceLowToHigh:
        return l10n.sortPriceLowToHigh;
      case SearchSortOption.priceHighToLow:
        return l10n.sortPriceHighToLow;
    }
  }
}
