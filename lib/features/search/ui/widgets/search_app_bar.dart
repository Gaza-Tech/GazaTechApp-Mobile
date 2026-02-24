import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/features/search/cubit/search_cubit.dart';
import 'package:gaza_tech/features/search/cubit/search_state.dart';
import 'filter_bottom_sheet.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<SearchCubit>();

    return AppBar(
      titleSpacing: 0,
      title: TextField(
        controller: cubit.searchController,
        style: MyTextStyle.body.m,
        textInputAction: TextInputAction.search,
        onSubmitted: (_) => cubit.search(),
        decoration: InputDecoration(
          hintText: context.l10n.searchHint,
          hintStyle: MyTextStyle.body.m.copyWith(
            color: theme.textTheme.bodySmall?.color,
          ),
          prefixIcon: const Icon(Icons.search, size: 22),
          suffixIcon: ValueListenableBuilder<TextEditingValue>(
            valueListenable: cubit.searchController,
            builder: (context, value, _) {
              if (value.text.isEmpty) return const SizedBox.shrink();
              return IconButton(
                icon: const Icon(Icons.clear, size: 20),
                onPressed: () {
                  cubit.searchController.clear();
                },
              );
            },
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
          filled: false,
        ),
      ),
      actions: [
        BlocBuilder<SearchCubit, SearchState>(
          buildWhen: (prev, curr) =>
              prev.filters.activeFilterCount != curr.filters.activeFilterCount,
          builder: (context, state) {
            final count = state.filters.activeFilterCount;
            return IconButton(
              icon: Badge(
                isLabelVisible: count > 0,
                label: Text(
                  count.toString(),
                  style: TextStyle(fontSize: 10.sp),
                ),
                backgroundColor: MyColors.primary.base,
                child: const Icon(Icons.filter_alt_outlined),
              ),
              onPressed: () => showFilterBottomSheet(context),
            );
          },
        ),
      ],
    );
  }
}
