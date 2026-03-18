import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/sort_button.dart';
import 'package:gaza_tech/core/widgets/tappable_search_bar.dart';

class CommunitySearchBar extends StatelessWidget {
  final VoidCallback? onSortTap;
  final VoidCallback? onSearchTap;
  final String sortLabel;

  const CommunitySearchBar({
    super.key,
    this.onSortTap,
    this.onSearchTap,
    required this.sortLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TappableSearchBar(
            onTap: onSearchTap,
            hintText: context.l10n.searchCommunity,
          ),
        ),
        SizedBox(width: 8.w),
        SortButton(onTap: onSortTap, label: sortLabel),
      ],
    );
  }
}
