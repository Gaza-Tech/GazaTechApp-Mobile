import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/filter_sheet_shell.dart';
import 'package:gaza_tech/features/add_listing/data/models/location_model.dart';
import 'package:gaza_tech/features/marketplace/data/models/category_model.dart';
import 'package:gaza_tech/features/search/cubit/marketplace_search_cubit.dart';
import 'package:gaza_tech/features/search/data/models/marketplace_search_filters_model.dart';

void showFilterBottomSheet(BuildContext context) {
  final cubit = context.read<MarketplaceSearchCubit>();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.dg)),
    ),
    builder: (_) => BlocProvider.value(
      value: cubit,
      child: const _FilterBottomSheetContent(),
    ),
  );
}

class _FilterBottomSheetContent extends StatefulWidget {
  const _FilterBottomSheetContent();

  @override
  State<_FilterBottomSheetContent> createState() =>
      _FilterBottomSheetContentState();
}

class _FilterBottomSheetContentState extends State<_FilterBottomSheetContent> {
  late MarketplaceSearchFiltersModel _temp;
  late TextEditingController _priceMinUsd;
  late TextEditingController _priceMaxUsd;
  late TextEditingController _priceMinIls;
  late TextEditingController _priceMaxIls;
  late List<CategoryModel> _categories;
  late List<LocationModel> _locations;

  @override
  void initState() {
    super.initState();
    final state = context.read<MarketplaceSearchCubit>().state;
    _temp = state.filters;
    _categories = state.categories;
    _locations = state.locations;
    _priceMinUsd = TextEditingController(
      text: _temp.priceMinUsd?.toString() ?? '',
    );
    _priceMaxUsd = TextEditingController(
      text: _temp.priceMaxUsd?.toString() ?? '',
    );
    _priceMinIls = TextEditingController(
      text: _temp.priceMinIls?.toString() ?? '',
    );
    _priceMaxIls = TextEditingController(
      text: _temp.priceMaxIls?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _priceMinUsd.dispose();
    _priceMaxUsd.dispose();
    _priceMinIls.dispose();
    _priceMaxIls.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final cubit = context.read<MarketplaceSearchCubit>();
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: FilterSheetShell(
        title: l10n.filters,
        initialChildSize: 0.9,
        maxChildSize: 0.9,
        onApply: () {
          final finalFilter = _temp.copyWith(
            priceMinUsd: int.tryParse(_priceMinUsd.text),
            priceMaxUsd: int.tryParse(_priceMaxUsd.text),
            priceMinIls: int.tryParse(_priceMinIls.text),
            priceMaxIls: int.tryParse(_priceMaxIls.text),
          );
          cubit.updateFilter(finalFilter);
          Navigator.pop(context);
        },
        onClearAll: () => setState(() {
          _temp = const MarketplaceSearchFiltersModel();
          _priceMinUsd.clear();
          _priceMaxUsd.clear();
          _priceMinIls.clear();
          _priceMaxIls.clear();
        }),
        contentBuilder: (controller) => ListView(
          controller: controller,
          children: [
            Text(l10n.sortBy, style: MyTextStyle.heading.h4),
            const SizedBox(height: 8),
            ...SearchSortOption.values.map((option) {
              return RadioListTile<SearchSortOption>(
                title: Text(
                  _getSortLabel(l10n, option),
                  style: MyTextStyle.body.m,
                ),
                value: option,
                groupValue: _temp.sort,
                onChanged: (v) =>
                    setState(() => _temp = _temp.copyWith(sort: v!)),
                dense: true,
                contentPadding: EdgeInsets.zero,
              );
            }),
            const SizedBox(height: 16),
            Text(l10n.categoryLabel, style: MyTextStyle.heading.h4),
            const SizedBox(height: 8),
            DropdownButtonFormField<String?>(
              initialValue: _temp.categoryId,
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
                  child: Text(l10n.categoryAll, style: MyTextStyle.body.m),
                ),
                ..._categories.map((cat) {
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
                  setState(
                    () => _temp = _temp.copyWith(
                      categoryId: null,
                      categoryName: null,
                    ),
                  );
                } else {
                  final cat = _categories.firstWhere((c) => c.id == value);
                  final name = isArabic
                      ? (cat.nameAr?.isNotEmpty == true
                            ? cat.nameAr!
                            : cat.name)
                      : cat.name;
                  setState(
                    () => _temp = _temp.copyWith(
                      categoryId: value,
                      categoryName: name,
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            Text(l10n.locationLabel, style: MyTextStyle.heading.h4),
            const SizedBox(height: 8),
            DropdownButtonFormField<String?>(
              initialValue: _temp.locationId,
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
                  child: Text(l10n.categoryAll, style: MyTextStyle.body.m),
                ),
                ..._locations.map((loc) {
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
                  setState(
                    () => _temp = _temp.copyWith(
                      locationId: null,
                      locationName: null,
                    ),
                  );
                } else {
                  final loc = _locations.firstWhere(
                    (l) => l.locationId == value,
                  );
                  final name = isArabic
                      ? (loc.nameAr?.isNotEmpty == true
                            ? loc.nameAr!
                            : loc.name)
                      : loc.name;
                  setState(
                    () => _temp = _temp.copyWith(
                      locationId: value,
                      locationName: name,
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            Text(l10n.conditionFilter, style: MyTextStyle.heading.h4),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                _buildConditionChip('brand_new', l10n.conditionBrandNew),
                _buildConditionChip(
                  'used_excellent',
                  l10n.conditionUsedExcellent,
                ),
                _buildConditionChip('used_good', l10n.conditionUsedGood),
                _buildConditionChip('for_parts', l10n.conditionForParts),
              ],
            ),
            const SizedBox(height: 16),
            Text(l10n.priceRangeUsd, style: MyTextStyle.heading.h4),
            const SizedBox(height: 8),
            _buildPriceRangeRow(
              theme: theme,
              l10n: l10n,
              minController: _priceMinUsd,
              maxController: _priceMaxUsd,
            ),
            const SizedBox(height: 16),
            Text(l10n.priceRangeIls, style: MyTextStyle.heading.h4),
            const SizedBox(height: 8),
            _buildPriceRangeRow(
              theme: theme,
              l10n: l10n,
              minController: _priceMinIls,
              maxController: _priceMaxIls,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildConditionChip(String value, String label) {
    final isSelected = _temp.conditions.contains(value);
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      labelStyle: MyTextStyle.body.s,
      onSelected: (_) {
        final updated = List<String>.from(_temp.conditions);
        updated.contains(value) ? updated.remove(value) : updated.add(value);
        setState(() => _temp = _temp.copyWith(conditions: updated));
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

  String _getSortLabel(dynamic l10n, SearchSortOption option) {
    switch (option) {
      case SearchSortOption.newest:
        return l10n.sortNewest;
      case SearchSortOption.oldest:
        return l10n.oldest;
      case SearchSortOption.priceLowToHigh:
        return l10n.sortPriceLowToHigh;
      case SearchSortOption.priceHighToLow:
        return l10n.sortPriceHighToLow;
    }
  }
}
