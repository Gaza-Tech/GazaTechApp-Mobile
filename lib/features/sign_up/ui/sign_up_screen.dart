import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/sign_in/ui/widgets/account_action_row.dart';
import 'package:gaza_tech/features/sign_up/cubit/sign_up_cubit.dart';
import 'package:gaza_tech/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:gaza_tech/features/sign_up/ui/widgets/terms_agrement_row.dart';
import 'package:gaza_tech/core/widgets/google_sign_in_button.dart';
import 'package:gaza_tech/features/google_auth/cubit/google_auth_cubit.dart';
import 'package:gaza_tech/features/google_auth/cubit/google_auth_state.dart';
import 'package:gaza_tech/features/google_auth/ui/widgets/google_auth_bloc_listener.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late bool _obscurePassword;
  late bool _obscureConfirmPassword;
  late bool _isAgreed;

  @override
  void initState() {
    super.initState();
    _obscurePassword = true;
    _obscureConfirmPassword = true;
    _isAgreed = false;
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
                // Create Account
                Text("Create Account", style: MyTextStyle.heading.h1),
                const VerticalSpace(8),
                Text("Join us to get started!", style: MyTextStyle.body.s),
                const VerticalSpace(24),

                // Sign Up Form
                Form(
                  key: context.read<SignUpCubit>().formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email Field
                      Text(
                        "First Name",
                        style: MyTextStyle.body.m.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const VerticalSpace(8),
                      MyTextFormField(
                        controller: context
                            .read<SignUpCubit>()
                            .firstNameController,
                        textInputType: TextInputType.name,
                        hintText: "Enter your  first name",
                        validator: (v) => v!.isEmpty ? "Required" : null,
                      ),
                      const VerticalSpace(16),

                      // Last Name Fields
                      Text(
                        "Last Name",
                        style: MyTextStyle.body.m.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const VerticalSpace(8),
                      MyTextFormField(
                        controller: context
                            .read<SignUpCubit>()
                            .lastNameController,
                        textInputType: TextInputType.name,
                        hintText: "Enter your last name",
                        validator: (v) => v!.isEmpty ? "Required" : null,
                      ),
                      const VerticalSpace(16),

                      // Email Field
                      Text(
                        "Email",
                        style: MyTextStyle.body.m.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const VerticalSpace(8),
                      MyTextFormField(
                        controller: context.read<SignUpCubit>().emailController,
                        textInputType: TextInputType.emailAddress,
                        hintText: "Enter your email",
                        validator: (v) => v!.isEmpty ? "Required" : null,
                      ),
                      const VerticalSpace(16),

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
                            .read<SignUpCubit>()
                            .passwordController,
                        textInputType: TextInputType.text,
                        hintText: "Enter your password",
                        validator: (v) => v!.length < 6 ? "Min 6 chars" : null,
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
                      ),
                      const VerticalSpace(16),

                      // Confirm Password Field
                      Text(
                        "Confirm Password",
                        style: MyTextStyle.body.m.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const VerticalSpace(8),
                      MyTextFormField(
                        controller: context
                            .read<SignUpCubit>()
                            .confirmPasswordController,
                        textInputType: TextInputType.text,
                        hintText: "Re-enter your password",
                        // validator must be same as password field
                        validator: (v) {
                          if (v!.isEmpty) return "Required";
                          if (v !=
                              context
                                  .read<SignUpCubit>()
                                  .passwordController
                                  .text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                        isObscureText: _obscureConfirmPassword,
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
                const VerticalSpace(24),

                //  Checkbox for agreeing to terms and conditions and privacy policy
                TermsAgreementRow(
                  isAgreed: _isAgreed,
                  onChanged: (bool value) => setState(() => _isAgreed = value),
                ),
                const VerticalSpace(24),

                // Sign Up Button
                MyButton(
                  onPressed: _isAgreed
                      ? () => context.read<SignUpCubit>().emitSignUpState()
                      : null,
                  text: "Sign up",
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                const SignUpBlocListener(),
                const VerticalSpace(24),

                // Or divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[300])),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text('Or', style: MyTextStyle.body.s),
                    ),
                    Expanded(child: Divider(color: Colors.grey[300])),
                  ],
                ),
                const VerticalSpace(24),

                // Google Sign In Button
                BlocBuilder<GoogleAuthCubit, GoogleAuthState>(
                  builder: (context, state) {
                    return GoogleSignInButton(
                      isLoading: state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      ),
                      onPressed: () =>
                          context.read<GoogleAuthCubit>().signInWithGoogle(),
                    );
                  },
                ),
                const GoogleAuthBlocListener(),
                const VerticalSpace(24),

                // Already have an account? Sign in
                AccountActionRow(
                  description: 'Already have an account? ',
                  actionText: 'Sign in',
                  onTap: () => context.pushNamedAndRemoveUntil(
                    MyRoutes.signIn,
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
