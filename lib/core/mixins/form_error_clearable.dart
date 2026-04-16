import 'package:flutter/material.dart';

mixin FormErrorClearable {
  GlobalKey<FormState> get formKey;
  List<TextEditingController> get formControllers;

  void clearFormErrors() {
    final formState = formKey.currentState;
    if (formState == null) return;

    final savedTexts = formControllers.map((c) => c.text).toList();
    formState.reset();
    for (var i = 0; i < formControllers.length; i++) {
      formControllers[i].text = savedTexts[i];
    }
  }
}
