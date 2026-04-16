import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/listing_details/cubit/listing_details_cubit.dart';

class ListingDetailsErrorView extends StatelessWidget {
  final String message;

  const ListingDetailsErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
            const VerticalSpace(16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const VerticalSpace(16),
            ElevatedButton(
              onPressed: () =>
                  context.read<ListingDetailsCubit>().loadListing(),
              child: Text(context.l10n.retry),
            ),
          ],
        ),
      ),
    );
  }
}
