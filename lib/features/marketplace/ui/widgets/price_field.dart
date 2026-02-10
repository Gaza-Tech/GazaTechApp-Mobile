import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';

class PriceField extends StatelessWidget {
  final TextEditingController controller;
  final bool isILS;
  final ValueChanged<bool> onCurrencyChanged;

  const PriceField({
    super.key,
    required this.controller,
    required this.isILS,
    required this.onCurrencyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return MyTextFormField(
      controller: controller,
      hintText: '0.00',
      textInputType: const TextInputType.numberWithOptions(decimal: true),
      suffixIcon: Container(
        margin: EdgeInsets.only(right: 8.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _CurrencyChip(
              label: '₪ ILS',
              isSelected: isILS,
              onTap: () => onCurrencyChanged(true),
            ),
            SizedBox(width: 4.w),
            _CurrencyChip(
              label: '\$ USD',
              isSelected: !isILS,
              onTap: () => onCurrencyChanged(false),
            ),
          ],
        ),
      ),
    );
  }
}

class _CurrencyChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CurrencyChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? MyColors.highlight.darkest : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          label,
          style: MyTextStyle.body.s.copyWith(
            color: isSelected
                ? MyColors.neutral.dark.darkest
                : MyColors.neutral.dark.light,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
