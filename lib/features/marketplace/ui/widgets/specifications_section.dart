import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/marketplace/ui/widgets/labeled_field.dart';

class SpecificationEntry {
  final TextEditingController nameController;
  final TextEditingController valueController;

  SpecificationEntry()
    : nameController = TextEditingController(),
      valueController = TextEditingController();

  void dispose() {
    nameController.dispose();
    valueController.dispose();
  }
}

class SpecificationsDisplay extends StatelessWidget {
  final List<SpecificationEntry> specifications;
  final VoidCallback onAdd;
  final ValueChanged<int> onRemove;

  const SpecificationsDisplay({
    super.key,
    required this.specifications,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const LabeledField(label: 'Specifications', isRequired: false),

            GestureDetector(
              onTap: onAdd,
              child: Text(
                '+ Add Field',
                style: MyTextStyle.body.m.copyWith(
                  color: MyColors.highlight.darkest,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Text(
          'Add technical details to help buyers make informed decisions',
          style: MyTextStyle.body.s.copyWith(
            color: MyColors.neutral.dark.light,
          ),
        ),
        const VerticalSpace(12),
        ...List.generate(specifications.length, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _SpecificationCard(
              entry: specifications[index],
              onRemove: () => onRemove(index),
            ),
          );
        }),
      ],
    );
  }
}

class _SpecificationCard extends StatelessWidget {
  final SpecificationEntry entry;
  final VoidCallback onRemove;

  const _SpecificationCard({required this.entry, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: MyColors.neutral.dark.medium),
      ),
      child: Column(
        children: [
          MyTextFormField(
            controller: entry.nameController,
            hintText: 'e.g., Processor',
            textInputType: TextInputType.text,
          ),
          const VerticalSpace(8),
          MyTextFormField(
            controller: entry.valueController,
            hintText: 'e.g., Apple A16 Bionic',
            textInputType: TextInputType.text,
          ),
          const VerticalSpace(8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onRemove,
              label: Text('Remove', style: MyTextStyle.action.l),
              icon: const Icon(Icons.delete),
            ),
          ),
        ],
      ),
    );
  }
}
