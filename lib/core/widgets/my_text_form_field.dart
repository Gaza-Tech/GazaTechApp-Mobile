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
    this.helperText,
    this.hintMaxLines,
    this.helperMaxLines,
    this.counterText,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.textInputAction,
    this.onFieldSubmitted,
    this.fillColor,
    this.autofocus = false,
  });

  final EdgeInsets? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? helperText;
  final String? counterText;
  final String hintText;
  final int? hintMaxLines;
  final int? helperMaxLines;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final Color? fillColor;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (PointerDownEvent event) {
        FocusScope.of(context).unfocus();
      },
      autofocus: autofocus,
      controller: controller,
      validator: validator,
      keyboardType: textInputType,
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? Theme.of(context).textTheme.bodyMedium,
      maxLines: maxLines,
      maxLength: maxLength,
      minLines: minLines,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
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

        helperText: helperText,
        // 4. Icon
        suffixIcon: suffixIcon,

        fillColor: fillColor,
      ),
    );
  }
}
