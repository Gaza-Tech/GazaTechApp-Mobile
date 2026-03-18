import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/filter_sheet_shell.dart';
import 'package:gaza_tech/features/community/data/models/community_sort.dart';
import 'package:gaza_tech/features/community_search/cubit/community_search_cubit.dart';
import 'package:gaza_tech/features/community_search/data/models/search_filter.dart';

void showSearchFilterSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (_) => BlocProvider.value(
      value: context.read<CommunitySearchCubit>(),
      child: const _SearchFilterSheet(),
    ),
  );
}

class _SearchFilterSheet extends StatefulWidget {
  const _SearchFilterSheet();

  @override
  State<_SearchFilterSheet> createState() => _SearchFilterSheetState();
}

class _SearchFilterSheetState extends State<_SearchFilterSheet> {
  late SearchFilter _temp;

  @override
  void initState() {
    super.initState();
    _temp = context.read<CommunitySearchCubit>().state.filter;
  }

  void _toggleCategory(String cat) {
    final updated = Set<String>.from(_temp.categories);
    updated.contains(cat) ? updated.remove(cat) : updated.add(cat);
    setState(() => _temp = _temp.copyWith(categories: updated));
  }

  void _toggleEngagement(EngagementLevel level) {
    final updated = Set<EngagementLevel>.from(_temp.engagementLevels);
    updated.contains(level) ? updated.remove(level) : updated.add(level);
    setState(() => _temp = _temp.copyWith(engagementLevels: updated));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<CommunitySearchCubit>();

    final categories = [
      ('questions', l10n.questions),
      ('tips', l10n.tips),
      ('news', l10n.news),
      ('troubleshooting', l10n.troubleshooting),
    ];
    final dateRanges = [
      (DateRange.today, l10n.today),
      (DateRange.thisWeek, l10n.thisWeek),
      (DateRange.thisMonth, l10n.thisMonth),
      (DateRange.thisYear, l10n.thisYear),
    ];
    final engagements = [
      (EngagementLevel.likes100Plus, l10n.likes100Plus),
      (EngagementLevel.comments50Plus, l10n.comments50Plus),
    ];
    final sorts = [
      (CommunitySort.newest, l10n.newest),
      (CommunitySort.oldest, l10n.oldest),
      (CommunitySort.mostLiked, l10n.mostLiked),
      (CommunitySort.mostCommented, l10n.mostCommented),
    ];

    return FilterSheetShell(
      title: l10n.filterPosts,
      onApply: () {
        cubit.updateFilter(_temp);
        Navigator.pop(context);
      },
      onClearAll: () => setState(() => _temp = const SearchFilter()),
      contentBuilder: (controller) => ListView(
        controller: controller,
        children: [
          _SectionHeader(l10n.categoryFilter),
          ...categories.map(
            (e) => CheckboxListTile(
              title: Text(e.$2, style: MyTextStyle.body.m),
              value: _temp.categories.contains(e.$1),
              onChanged: (_) => _toggleCategory(e.$1),
              dense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
          _SectionHeader(l10n.dateRangeFilter),
          ...dateRanges.map(
            (e) => RadioListTile<DateRange?>(
              title: Text(e.$2, style: MyTextStyle.body.m),
              value: e.$1,
              groupValue: _temp.dateRange,
              onChanged: (v) =>
                  setState(() => _temp = _temp.copyWith(dateRange: v)),
              dense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
          _SectionHeader(l10n.engagementLevel),
          ...engagements.map(
            (e) => CheckboxListTile(
              title: Text(e.$2, style: MyTextStyle.body.m),
              value: _temp.engagementLevels.contains(e.$1),
              onChanged: (_) => _toggleEngagement(e.$1),
              dense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
          _SectionHeader(l10n.sortOrder),
          ...sorts.map(
            (e) => RadioListTile<CommunitySort>(
              title: Text(e.$2, style: MyTextStyle.body.m),
              value: e.$1,
              groupValue: _temp.sort,
              onChanged: (v) =>
                  setState(() => _temp = _temp.copyWith(sort: v!)),
              dense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 4.h),
      child: Text(
        title,
        style: MyTextStyle.body.m.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
