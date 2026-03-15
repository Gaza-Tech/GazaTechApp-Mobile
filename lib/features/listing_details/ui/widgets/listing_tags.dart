import 'package:flutter/material.dart';
import 'package:gaza_tech/core/widgets/condition_tag.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/category_tag.dart';

class ListingTags extends StatelessWidget {
  final String condition;
  final String category;

  const ListingTags({
    super.key,
    required this.condition,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConditionTag(condition: condition),
        const HorizontalSpace(8),
        CategoryTag(category: category),
      ],
    );
  }
}
