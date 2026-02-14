import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/marketplace/add_listing/ui/widgets/labeled_field.dart';

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
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabeledField(label: context.l10n.specificationsLabel, isRequired: false),

            GestureDetector(
              onTap: onAdd,
              child: Text(
                context.l10n.addField,
                style: MyTextStyle.body.m.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Text(
          context.l10n.specificationsHelper,
          style: theme.textTheme.bodySmall,
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
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        children: [
          MyTextFormField(
            controller: entry.nameController,
            hintText: context.l10n.specNameHint,
            textInputType: TextInputType.text,
          ),
          const VerticalSpace(8),
          MyTextFormField(
            controller: entry.valueController,
            hintText: context.l10n.specValueHint,
            textInputType: TextInputType.text,
          ),
          const VerticalSpace(8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onRemove,
              label: Text(context.l10n.remove, style: MyTextStyle.action.l),
              icon: const Icon(Icons.delete),
            ),
          ),
        ],
      ),
    );
  }
}
