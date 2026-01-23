import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/theme/my_theme.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reset Password",
                  style: MyTextStyle.heading.h1.copyWith(
                    color: MyTheme.darkTheme.colorScheme.onSurface,
                  ),
                ),
                const VerticalSpace(8),
                Text(
                  "Create a new password for your account.",
                  style: MyTextStyle.body.s,
                ),
                const VerticalSpace(40),
                Form(
                  key: context.read<ResetPasswordCubit>().formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New Password",
                        style: MyTextStyle.body.m.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const VerticalSpace(8),
                      MyTextFormField(
                        controller: context
                            .read<ResetPasswordCubit>()
                            .passwordController,
                        hintText: "Enter new password",
                        textInputType: TextInputType.text,
                        isObscureText: _obscurePassword,
                        validator: (v) {
                          if (v == null || v.isEmpty) return "Required";
                          if (v.length < 6) return "Min 6 characters";
                          return null;
                        },
                        suffixIcon: GestureDetector(
                          onTap: () => setState(
                              () => _obscurePassword = !_obscurePassword),
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
                        "Confirm Password",
                        style: MyTextStyle.body.m.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const VerticalSpace(8),
                      MyTextFormField(
                        controller: context
                            .read<ResetPasswordCubit>()
                            .confirmPasswordController,
                        hintText: "Re-enter new password",
                        textInputType: TextInputType.text,
                        isObscureText: _obscureConfirmPassword,
                        validator: (v) {
                          if (v == null || v.isEmpty) return "Required";
                          if (v !=
                              context
                                  .read<ResetPasswordCubit>()
                                  .passwordController
                                  .text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                        suffixIcon: GestureDetector(
                          onTap: () => setState(() =>
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword),
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
                  text: "Reset Password",
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
