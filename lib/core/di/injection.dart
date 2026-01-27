import 'package:gaza_tech/features/auth/sign_out/cubit/sign_out_cubit.dart';
import 'package:gaza_tech/features/auth/sign_out/data/repos/sign_out_repo.dart';
import 'package:gaza_tech/features/auth/sign_out/data/services/sign_out_api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gaza_tech/core/localization/locale_cubit.dart';
import 'package:gaza_tech/core/localization/locale_persistence.dart';
import 'package:gaza_tech/features/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:gaza_tech/features/auth/sign_in/data/repos/sign_in_repo.dart';
import 'package:gaza_tech/features/auth/sign_in/data/services/sign_in_api_service.dart';
import 'package:gaza_tech/features/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:gaza_tech/features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:gaza_tech/features/auth/sign_up/data/services/sign_up_api_service.dart';
import 'package:gaza_tech/features/auth/google_auth/cubit/google_auth_cubit.dart';
import 'package:gaza_tech/features/auth/google_auth/data/repos/google_auth_repo.dart';
import 'package:gaza_tech/features/auth/google_auth/data/services/google_auth_api_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Feature Imports

import 'package:gaza_tech/features/auth/verify_otp/cubit/verify_otp_cubit.dart';
import 'package:gaza_tech/features/auth/verify_otp/data/repos/verify_otp_repo.dart';
import 'package:gaza_tech/features/auth/verify_otp/data/services/verify_otp_api_service.dart';
import 'package:gaza_tech/features/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:gaza_tech/features/auth/forgot_password/data/repos/forgot_password_repo.dart';
import 'package:gaza_tech/features/auth/forgot_password/data/services/forgot_password_api_service.dart';
import 'package:gaza_tech/features/auth/reset_password/cubit/reset_password_cubit.dart';
import 'package:gaza_tech/features/auth/reset_password/data/repos/reset_password_repo.dart';
import 'package:gaza_tech/features/auth/reset_password/data/services/reset_password_api_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // 0. Shared Preferences (for locale persistence)
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // 0.5 Locale Management
  getIt.registerLazySingleton<LocalePersistence>(() => LocalePersistence());
  getIt.registerLazySingleton<LocaleCubit>(() => LocaleCubit(getIt()));

  // 1. External Services (Supabase)
  final supabase = Supabase.instance.client;
  getIt.registerLazySingleton<SupabaseClient>(() => supabase);

  // 2. Auth - Login
  getIt.registerLazySingleton<SignInApiService>(
    () => SignInApiService(getIt()),
  );
  getIt.registerLazySingleton<SignInRepo>(() => SignInRepo(getIt()));
  getIt.registerFactory<SignInCubit>(() => SignInCubit(getIt()));

  // 3. Auth - Signup
  getIt.registerLazySingleton<SignUpApiService>(
    () => SignUpApiService(getIt()),
  );
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  // 4. Auth - Verify OTP (Added)
  getIt.registerLazySingleton<VerifyOtpApiService>(
    () => VerifyOtpApiService(getIt()),
  );
  getIt.registerLazySingleton<VerifyOtpRepo>(() => VerifyOtpRepo(getIt()));
  getIt.registerFactoryParam<VerifyOtpCubit, String, void>(
    (email, _) => VerifyOtpCubit(getIt(), email),
  );

  // 5. Auth - Forgot Password
  getIt.registerLazySingleton<ForgotPasswordApiService>(
    () => ForgotPasswordApiService(getIt()),
  );
  getIt.registerLazySingleton<ForgotPasswordRepo>(
    () => ForgotPasswordRepo(getIt()),
  );
  getIt.registerFactory<ForgotPasswordCubit>(
    () => ForgotPasswordCubit(getIt()),
  );

  // 6. Auth - Reset Password
  getIt.registerLazySingleton<ResetPasswordApiService>(
    () => ResetPasswordApiService(getIt()),
  );
  getIt.registerLazySingleton<ResetPasswordRepo>(
    () => ResetPasswordRepo(getIt()),
  );
  getIt.registerFactoryParam<ResetPasswordCubit, String, void>(
    (email, _) => ResetPasswordCubit(getIt(), email),
  );

  // 7. Home

  // 8. Google Auth
  getIt.registerLazySingleton<GoogleAuthApiService>(
    () => GoogleAuthApiService(getIt()),
  );
  getIt.registerLazySingleton<GoogleAuthRepo>(() => GoogleAuthRepo(getIt()));
  getIt.registerFactory<GoogleAuthCubit>(() => GoogleAuthCubit(getIt()));

  // 9. SignOut
  getIt.registerLazySingleton<SignOutApiService>(
    () => SignOutApiService(getIt()),
  );
  getIt.registerLazySingleton<SignOutRepo>(() => SignOutRepo(getIt()));
  getIt.registerFactory<SignOutCubit>(() => SignOutCubit(getIt()));
}
