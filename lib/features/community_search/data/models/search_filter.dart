import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaza_tech/features/community/data/models/community_sort.dart';

part 'search_filter.freezed.dart';

enum DateRange { today, thisWeek, thisMonth, thisYear }

extension DateRangeExtension on DateRange {
  DateTime get cutoffDate {
    final now = DateTime.now();
    switch (this) {
      case DateRange.today:
        return DateTime(now.year, now.month, now.day);
      case DateRange.thisWeek:
        return now.subtract(const Duration(days: 7));
      case DateRange.thisMonth:
        return DateTime(now.year, now.month, 1);
      case DateRange.thisYear:
        return DateTime(now.year, 1, 1);
    }
  }
}

enum EngagementLevel { likes100Plus, comments50Plus }

@freezed
abstract class SearchFilter with _$SearchFilter {
  const factory SearchFilter({
    @Default(<String>{}) Set<String> categories,
    DateRange? dateRange,
    @Default(<EngagementLevel>{}) Set<EngagementLevel> engagementLevels,
    @Default(CommunitySort.newest) CommunitySort sort,
  }) = _SearchFilter;

  const SearchFilter._();

  bool get hasActiveFilters =>
      categories.isNotEmpty ||
      dateRange != null ||
      engagementLevels.isNotEmpty ||
      sort != CommunitySort.newest;
}
