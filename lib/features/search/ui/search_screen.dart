import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/features/search/cubit/search_cubit.dart';
import 'package:gaza_tech/features/search/cubit/search_state.dart';
import 'widgets/search_app_bar.dart';
import 'widgets/active_filters_bar.dart';
import 'widgets/search_results_grid.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBar(),
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(Icons.error_outline, color: Colors.white),
                    SizedBox(width: 16.w),
                    Flexible(
                      child: Text(
                        state.errorMessage ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                duration: const Duration(seconds: 4),
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const ActiveFiltersBar(),
              Expanded(child: _buildBody(context, state)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, SearchState state) {
    if (state.isInitial) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search, size: 64.sp, color: Colors.grey),
            SizedBox(height: 16.h),
            Text(
              context.l10n.searchPrompt,
              style: MyTextStyle.body.l.copyWith(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    if (state.isSearching) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off, size: 64.sp, color: Colors.grey),
            SizedBox(height: 16.h),
            Text(
              context.l10n.noResultsFound,
              style: MyTextStyle.heading.h3,
            ),
            SizedBox(height: 8.h),
            Text(
              context.l10n.noResultsSubtitle,
              style: MyTextStyle.body.m.copyWith(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return const SearchResultsGrid();
  }
}
