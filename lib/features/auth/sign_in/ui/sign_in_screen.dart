import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/theme/my_themes.dart';
import 'package:gaza_tech/core/widgets/language_switcher.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/core/widgets/status_bar_hider.dart';
import 'package:gaza_tech/features/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:gaza_tech/features/auth/sign_in/ui/widgets/account_action_row.dart';
import 'package:gaza_tech/core/widgets/google_sign_in_button.dart';
import 'package:gaza_tech/features/auth/google_auth/cubit/google_auth_cubit.dart';
import 'package:gaza_tech/features/auth/google_auth/cubit/google_auth_state.dart';
import 'package:gaza_tech/features/auth/google_auth/ui/widgets/google_auth_bloc_listener.dart';
import 'package:gaza_tech/features/auth/guest_auth/cubit/guest_auth_cubit.dart';
import 'package:gaza_tech/features/auth/guest_auth/cubit/guest_auth_state.dart';
import 'package:gaza_tech/features/auth/guest_auth/ui/widgets/guest_auth_bloc_listener.dart';
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
      body: StatusBarHider(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Language Switcher
                const LanguageSwitcher(),
                const VerticalSpace(16),
                // Welcome Back
                Text(context.l10n.welcomeBack, style: MyTextStyle.heading.h1),
                const VerticalSpace(8),
                Text(context.l10n.signInSubtitle, style: MyTextStyle.body.s),
                const VerticalSpace(40),

                // Sign In Form
                Form(
                  key: context.read<SignInCubit>().formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email Field
                      Text(
                        context.l10n.email,
                        style: MyTextStyle.body.m.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const VerticalSpace(8),
                      MyTextFormField(
                        controller: context.read<SignInCubit>().emailController,
                        validator: (v) =>
                            v!.isEmpty ? context.l10n.required : null,
                        hintText: context.l10n.emailHint,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const VerticalSpace(24),
                      // Password Field
                      Text(
                        context.l10n.password,
                        style: MyTextStyle.body.m.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const VerticalSpace(8),
                      MyTextFormField(
                        controller: context
                            .read<SignInCubit>()
                            .passwordController,
                        hintText: context.l10n.passwordHint,
                        textInputType: TextInputType.text,
                        isObscureText: _obscurePassword,
                        maxLines: 1,
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
                        validator: (v) =>
                            v!.length < 6 ? context.l10n.minChars(6) : null,
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
                      context.l10n.forgotPasswordLink,
                      style: MyTextStyle.action.m.copyWith(
                        color: MyThemes.darkTheme(
                          const Locale('en'),
                        ).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(24),

                // Sign In Button
                MyButton(
                  onPressed: () =>
                      context.read<SignInCubit>().emitSignInState(),
                  height: 48.h,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  text: context.l10n.signIn,
                  textStyle: MyTextStyle.action.l,
                ),
                const SignInBlocListener(),
                const VerticalSpace(24),

                // Or divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[300])),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(context.l10n.or, style: MyTextStyle.body.s),
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
                const VerticalSpace(16),

                // Continue as Guest Button
                BlocBuilder<GuestAuthCubit, GuestAuthState>(
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );
                    return SizedBox(
                      width: double.infinity,
                      height: 48.h,
                      child: OutlinedButton(
                        onPressed: isLoading
                            ? null
                            : () => context
                                  .read<GuestAuthCubit>()
                                  .continueAsGuest(),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey[400]!),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.dg),
                          ),
                          foregroundColor: Theme.of(
                            context,
                          ).colorScheme.onSurface,
                        ),
                        child: isLoading
                            ? SizedBox(
                                width: 20.w,
                                height: 20.w,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                              )
                            : Text(
                                context.l10n.continueAsGuest,
                                style: MyTextStyle.action.l,
                              ),
                      ),
                    );
                  },
                ),
                const GuestAuthBlocListener(),
                const VerticalSpace(24),

                // Don't have an account? Sign up
                AccountActionRow(
                  description: context.l10n.dontHaveAccount,
                  actionText: context.l10n.signUp,
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
