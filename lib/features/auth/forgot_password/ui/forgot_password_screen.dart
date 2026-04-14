import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/theme/my_themes.dart';
import 'package:gaza_tech/core/widgets/language_switcher.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/core/widgets/form_error_dismisser.dart';
import 'package:gaza_tech/core/widgets/status_bar_hider.dart';
import 'package:gaza_tech/features/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'widgets/forgot_password_bloc_listener.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // background Color matches the scaffold background theme color
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? MyThemes.darkTheme(const Locale('en')).scaffoldBackgroundColor
            : MyThemes.lightTheme(const Locale('en')).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: StatusBarHider(
        child: FormErrorDismisser(
          onDismiss: () =>
              context.read<ForgotPasswordCubit>().clearFormErrors(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Language Switcher
                  const LanguageSwitcher(),
                  const VerticalSpace(16),
                  Text(
                    context.l10n.forgotPasswordTitle,
                    style: MyTextStyle.heading.h1,
                  ),
                  const VerticalSpace(8),
                  Text(
                    context.l10n.forgotPasswordSubtitle,
                    style: MyTextStyle.body.s,
                  ),
                  const VerticalSpace(40),
                  Form(
                    key: context.read<ForgotPasswordCubit>().formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.email,
                          style: MyTextStyle.body.m.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const VerticalSpace(8),
                        MyTextFormField(
                          controller: context
                              .read<ForgotPasswordCubit>()
                              .emailController,
                          hintText: context.l10n.emailHint,
                          textInputType: TextInputType.emailAddress,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return context.l10n.required;
                            }
                            if (!v.contains('@')) {
                              return context.l10n.invalidEmail;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpace(40),
                  MyButton(
                    text: context.l10n.sendRecoveryCode,
                    onPressed: () => context
                        .read<ForgotPasswordCubit>()
                        .emitSendResetEmailState(),
                    height: 48.h,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),

                  const ForgotPasswordBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
