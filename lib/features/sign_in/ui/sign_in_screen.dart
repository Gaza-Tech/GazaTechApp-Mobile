import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/theme/my_theme.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/sign_in/cubit/sign_in_cubit.dart';
import 'package:gaza_tech/features/sign_in/ui/widgets/account_action_row.dart';
import 'widgets/sign_in_bloc_listener.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late bool _obscurePassword;

  @override
  void initState() {
    super.initState();
    _obscurePassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Back
                Text("Welcome Back", style: MyTextStyle.heading.h1),
                const VerticalSpace(8),
                Text(
                  "Sign in to continue to Gaza Tech",
                  style: MyTextStyle.body.s,
                ),
                const VerticalSpace(40),

                // Sign In Form
                Form(
                  key: context.read<SignInCubit>().formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email Field
                      Text(
                        "Email",
                        style: MyTextStyle.body.m.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const VerticalSpace(8),
                      MyTextFormField(
                        controller: context.read<SignInCubit>().emailController,
                        validator: (v) => v!.isEmpty ? "Required" : null,
                        hintText: "Enter your email",
                        textInputType: TextInputType.emailAddress,
                      ),
                      const VerticalSpace(24),
                      // Password Field
                      Text(
                        "Password",
                        style: MyTextStyle.body.m.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const VerticalSpace(8),
                      MyTextFormField(
                        controller: context
                            .read<SignInCubit>()
                            .passwordController,
                        hintText: "Enter your password",
                        textInputType: TextInputType.text,
                        isObscureText: _obscurePassword,
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
                        validator: (v) => v!.length < 6 ? "Min 6 chars" : null,
                      ),
                    ],
                  ),
                ),
                const VerticalSpace(16),

                // Forgot Password
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(MyRoutes.forgotPassword);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: MyTextStyle.action.m.copyWith(
                        color: MyTheme.darkTheme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(24),

                // Sign In Button
                MyButton(
                  onPressed: () => context.read<SignInCubit>().emitLoginState(),
                  height: 48.h,
                  backgroundColor: MyTheme.darkTheme.colorScheme.primary,
                  text: "Sign in",
                  textStyle: MyTextStyle.action.l,
                ),
                const SignInBlocListener(),
                const VerticalSpace(24),

                // Don't have an account? Sign up
                AccountActionRow(
                  description: "Don't have an account? ",
                  actionText: "Sign up",
                  onTap: () => context.pushNamedAndRemoveUntil(
                    MyRoutes.signUp,
                    predicate: (route) => false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
