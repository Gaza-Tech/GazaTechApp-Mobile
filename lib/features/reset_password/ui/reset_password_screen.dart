import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/theme/my_theme.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/core/widgets/status_bar_hider.dart';
import 'package:gaza_tech/features/reset_password/cubit/reset_password_cubit.dart';
import 'widgets/reset_password_bloc_listener.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  const ResetPasswordScreen({super.key, required this.email});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late bool _obscurePassword;
  late bool _obscureConfirmPassword;

  @override
  void initState() {
    super.initState();
    _obscurePassword = true;
    _obscureConfirmPassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.darkTheme.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: MyTheme.darkTheme.colorScheme.onSurface,
        ),
        automaticallyImplyLeading: false,
      ),
      body: StatusBarHider(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.resetPasswordTitle,
                  style: MyTextStyle.heading.h1.copyWith(
                    color: MyTheme.darkTheme.colorScheme.onSurface,
                  ),
                ),
                const VerticalSpace(8),
                Text(
                  context.l10n.resetPasswordSubtitle,
                  style: MyTextStyle.body.s,
                ),
                const VerticalSpace(40),
                Form(
                  key: context.read<ResetPasswordCubit>().formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.newPassword,
                        style: MyTextStyle.body.m.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const VerticalSpace(8),
                      MyTextFormField(
                        controller: context
                            .read<ResetPasswordCubit>()
                            .passwordController,
                        hintText: context.l10n.newPasswordHint,
                        textInputType: TextInputType.text,
                        isObscureText: _obscurePassword,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return context.l10n.required;
                          }
                          if (v.length < 6) {
                            return context.l10n.minCharacters(6);
                          }
                          return null;
                        },
                        suffixIcon: GestureDetector(
                          onTap: () => setState(
                            () => _obscurePassword = !_obscurePassword,
                          ),
                          child: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      const VerticalSpace(24),
                      Text(
                        context.l10n.confirmPassword,
                        style: MyTextStyle.body.m.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const VerticalSpace(8),
                      MyTextFormField(
                        controller: context
                            .read<ResetPasswordCubit>()
                            .confirmPasswordController,
                        hintText: context.l10n.confirmNewPasswordHint,
                        textInputType: TextInputType.text,
                        isObscureText: _obscureConfirmPassword,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return context.l10n.required;
                          }
                          if (v !=
                              context
                                  .read<ResetPasswordCubit>()
                                  .passwordController
                                  .text) {
                            return context.l10n.passwordsDoNotMatch;
                          }
                          return null;
                        },
                        suffixIcon: GestureDetector(
                          onTap: () => setState(
                            () => _obscureConfirmPassword =
                                !_obscureConfirmPassword,
                          ),
                          child: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpace(40),
                MyButton(
                  text: context.l10n.resetPassword,
                  onPressed: () => context
                      .read<ResetPasswordCubit>()
                      .emitResetPasswordState(),
                  height: 48.h,
                  backgroundColor: MyTheme.darkTheme.colorScheme.primary,
                ),
                const ResetPasswordBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
