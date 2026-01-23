import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/theme/my_theme.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/forgot_password/cubit/forgot_password_cubit.dart';
import 'widgets/forgot_password_bloc_listener.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.darkTheme.scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: MyTheme.darkTheme.colorScheme.onSurface,
        ),
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
                  "Forgot Password",
                  style: MyTextStyle.heading.h1.copyWith(
                    color: MyTheme.darkTheme.colorScheme.onSurface,
                  ),
                ),
                const VerticalSpace(8),
                Text(
                  "Enter your email address and we'll send you a recovery code.",
                  style: MyTextStyle.body.s,
                ),
                const VerticalSpace(40),
                Form(
                  key: context.read<ForgotPasswordCubit>().formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: MyTextStyle.body.m.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const VerticalSpace(8),
                      MyTextFormField(
                        controller:
                            context.read<ForgotPasswordCubit>().emailController,
                        hintText: "Enter your email",
                        textInputType: TextInputType.emailAddress,
                        validator: (v) {
                          if (v == null || v.isEmpty) return "Required";
                          if (!v.contains('@')) return "Invalid email";
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const VerticalSpace(40),
                MyButton(
                  text: "Send Recovery Code",
                  onPressed: () => context
                      .read<ForgotPasswordCubit>()
                      .emitSendResetEmailState(),
                  height: 48.h,
                  backgroundColor: MyTheme.darkTheme.colorScheme.primary,
                ),
                const ForgotPasswordBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
