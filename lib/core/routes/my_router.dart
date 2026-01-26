import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/di/injection.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/home/ui/home_screen.dart';
import 'package:gaza_tech/features/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:gaza_tech/features/auth/sign_in/ui/sign_in_screen.dart';
import 'package:gaza_tech/features/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:gaza_tech/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:gaza_tech/features/auth/verify_otp/cubit/verify_otp_cubit.dart';
import 'package:gaza_tech/features/auth/verify_otp/ui/verify_otp_screen.dart';
import 'package:gaza_tech/features/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:gaza_tech/features/auth/forgot_password/ui/forgot_password_screen.dart';
import 'package:gaza_tech/features/auth/reset_password/cubit/reset_password_cubit.dart';
import 'package:gaza_tech/features/auth/reset_password/ui/verify_recovery_otp_screen.dart';
import 'package:gaza_tech/features/auth/reset_password/ui/reset_password_screen.dart';
import 'package:gaza_tech/features/auth/google_auth/cubit/google_auth_cubit.dart';
import 'package:gaza_tech/features/auth/sign_out/cubit/sign_out_cubit.dart';

class MyRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.signIn:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<SignInCubit>()),
              BlocProvider(create: (context) => getIt<GoogleAuthCubit>()),
            ],
            child: const SignInScreen(),
          ),
        );
      case MyRoutes.signUp:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<SignUpCubit>()),
              BlocProvider(create: (context) => getIt<GoogleAuthCubit>()),
            ],
            child: const SignUpScreen(),
          ),
        );
      case MyRoutes.verifyOtp:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VerifyOtpCubit>(param1: email),
            child: VerifyOtpScreen(email: email),
          ),
        );
      case MyRoutes.home:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<SignOutCubit>()),
            ],
            child: const HomeScreen(),
          ),
        );
      case MyRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ForgotPasswordCubit>(),
            child: const ForgotPasswordScreen(),
          ),
        );
      case MyRoutes.verifyRecoveryOtp:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(param1: email),
            child: VerifyRecoveryOtpScreen(email: email),
          ),
        );
      case MyRoutes.resetPassword:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(param1: email),
            child: ResetPasswordScreen(email: email),
          ),
        );
      default:
        return null;
    }
  }
}
