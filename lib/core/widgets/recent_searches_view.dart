import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class RecentSearchesView extends StatelessWidget {
  final List<String> recentSearches;
  final ValueChanged<String> onSearchTap;
  final ValueChanged<String> onRemoveTap;
  final VoidCallback onClearAll;

  const RecentSearchesView({
    super.key,
    required this.recentSearches,
    required this.onSearchTap,
    required this.onRemoveTap,
    required this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    if (recentSearches.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.recentSearches,
                style: MyTextStyle.body.m.copyWith(fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: onClearAll,
                child: Text(
                  context.l10n.clearRecentSearches,
                  style: MyTextStyle.body.s.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: recentSearches.length,
            itemBuilder: (context, index) {
              final query = recentSearches[index];
              return ListTile(
                leading: Icon(
                  Icons.history,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                title: Text(query, style: MyTextStyle.body.m),
                trailing: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 18,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  onPressed: () => onRemoveTap(query),
                ),
                onTap: () => onSearchTap(query),
              );
            },
          ),
        ),
      ],
    );
  }
}
