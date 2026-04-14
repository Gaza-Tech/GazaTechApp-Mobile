import 'package:flutter/material.dart';

class FormErrorDismisser extends StatelessWidget {
  const FormErrorDismisser({
    super.key,
    required this.onDismiss,
    required this.child,
  });

  final VoidCallback onDismiss;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
        onDismiss();
      },
      child: child,
    );
  }
}
