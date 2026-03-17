import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
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

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      maxChildSize: 0.92,
      builder: (_, controller) => Padding(
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurfaceVariant
                      .withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              l10n.filterPosts,
              style: MyTextStyle.body.l.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 8.h),
            Divider(height: 1.h),
            Expanded(
              child: ListView(
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
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () =>
                        setState(() => _temp = const SearchFilter()),
                    child: Text(l10n.clearAll),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      cubit.updateFilter(_temp);
                      Navigator.pop(context);
                    },
                    child: Text(l10n.applyFilters),
                  ),
                ),
              ],
            ),
          ],
        ),
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
