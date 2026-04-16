import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
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
      hintText: context.l10n.priceHint,
      textInputType: const TextInputType.numberWithOptions(decimal: true),
      suffixIcon: Container(
        margin: EdgeInsets.only(right: 8.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _CurrencyChip(
              label: context.l10n.currencyILS,
              isSelected: isILS,
              onTap: () => onCurrencyChanged(true),
            ),
            SizedBox(width: 4.w),
            _CurrencyChip(
              label: context.l10n.currencyUSD,
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
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          label,
          style: MyTextStyle.body.s.copyWith(
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.textTheme.bodySmall?.color,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
