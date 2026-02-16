import 'package:flutter/material.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/features/marketplace/data/models/category_model.dart';

class CategoryTabBar extends StatelessWidget {
  final List<CategoryModel> categories;
  final int selectedIndex;
  final TabController tabController;
  final ValueChanged<int> onTabChanged;

  const CategoryTabBar({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.tabController,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    // 'All' tab + DB categories
    final tabCount = 1 + categories.length;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: List.generate(tabCount, (index) {
              final isSelected = selectedIndex == index;
              final label = index == 0
                  ? context.l10n.categoryAll
                  : (isArabic && categories[index - 1].nameAr != null
                      ? categories[index - 1].nameAr!
                      : categories[index - 1].name);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () => onTabChanged(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : (isDark
                              ? theme.colorScheme.surfaceContainerHighest
                              : theme.colorScheme.surfaceContainerHigh),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: isSelected
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
