import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    required this.controller,
    this.validator,
    required this.textInputType,
  });

  final EdgeInsets? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: textInputType,
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? Theme.of(context).textTheme.bodyMedium,

      decoration: InputDecoration(
        isDense: true,

        // 1. Padding: Uses Theme defaults unless overridden here
        contentPadding: contentPadding,

        // 2. Borders: Theme handles default styles.
        // We only pass these if the parent widget explicitly provides a custom border.
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,

        // 3. Hint: Theme sets the color and style
        hintText: hintText,
        hintStyle:
            hintStyle ?? Theme.of(context).inputDecorationTheme.hintStyle,

        // 4. Icon
        suffixIcon: suffixIcon,

        // 5. Colors: 'filled' and 'fillColor' are removed; the Theme handles them.
      ),
    );
  }
}
