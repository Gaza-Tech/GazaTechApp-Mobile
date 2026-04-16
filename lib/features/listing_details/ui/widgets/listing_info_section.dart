import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';

class ListingInfoSection extends StatelessWidget {
  final String title;
  final String price;
  final String location;
  final String timeAgo;

  const ListingInfoSection({
    super.key,
    required this.title,
    required this.price,
    required this.location,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MyTextStyle.heading.h1.copyWith(
            color: theme.textTheme.titleMedium?.color,
          ),
        ),
        const VerticalSpace(8),
        Text(
          price,
          style: MyTextStyle.heading.h2.copyWith(color: MyColors.primary.base),
        ),
        const VerticalSpace(12),
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 16.sp,
              color: theme.textTheme.bodySmall?.color,
            ),
            const HorizontalSpace(4),
            Text(location, style: theme.textTheme.bodySmall),
            const HorizontalSpace(16),
            Icon(
              Icons.access_time_rounded,
              size: 16.sp,
              color: theme.textTheme.bodySmall?.color,
            ),
            const HorizontalSpace(4),
            Text(timeAgo, style: theme.textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}
