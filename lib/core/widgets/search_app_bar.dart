import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onSearch;
  final VoidCallback onClear;
  final List<Widget>? actions;
  final bool autofocus;
  final Color? fillColor;

  const SearchAppBar({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onClear,
    this.onSearch,
    this.actions,
    this.autofocus = false,
    this.fillColor,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final resolvedFillColor =
        fillColor ??
        (isDark
            ? theme.colorScheme.surfaceContainerHighest
            : theme.colorScheme.surfaceContainerHigh);

    return AppBar(
      titleSpacing: 0,
      actions: actions,
      title: MyTextFormField(
        
        controller: controller,
        hintText: hintText,
        textInputType: TextInputType.text,
        textInputAction: TextInputAction.search,
        autofocus: autofocus,
        onFieldSubmitted: onSearch != null ? (_) => onSearch!() : null,
        inputTextStyle: MyTextStyle.body.m,
        hintStyle: MyTextStyle.body.m.copyWith(
          color: theme.textTheme.bodySmall?.color,
        ),
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (context, value, _) {
            if (value.text.isEmpty) return const SizedBox.shrink();
            return IconButton(
              icon: const Icon(Icons.clear, size: 20),
              onPressed: onClear,
            );
          },
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
        fillColor: resolvedFillColor,
      ),
    );
  }
}
