import 'package:gaza_tech/features/auth/sign_out/cubit/sign_out_cubit.dart';
import 'package:gaza_tech/features/auth/sign_out/data/repos/sign_out_repo.dart';
import 'package:gaza_tech/features/auth/sign_out/data/services/sign_out_api_service.dart';
import 'package:gaza_tech/features/search/cubit/marketplace_search_cubit.dart';
import 'package:gaza_tech/features/search/data/repos/marketplace_search_repo.dart';
import 'package:gaza_tech/features/search/data/services/search_api_service.dart';
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
import 'package:gaza_tech/features/marketplace/cubit/marketplace_cubit.dart';
import 'package:gaza_tech/features/marketplace/data/repos/marketplace_repo.dart';
import 'package:gaza_tech/features/marketplace/data/services/marketplace_api_service.dart';
import 'package:gaza_tech/features/add_listing/cubit/add_listing_cubit.dart';
import 'package:gaza_tech/features/add_listing/data/repos/add_listing_repo.dart';
import 'package:gaza_tech/features/add_listing/data/services/add_listing_api_service.dart';
import 'package:gaza_tech/features/listing_details/cubit/listing_details_cubit.dart';
import 'package:gaza_tech/features/listing_details/data/repos/listing_details_repo.dart';
import 'package:gaza_tech/features/listing_details/data/services/listing_details_api_service.dart';
import 'package:gaza_tech/features/community/cubit/community_cubit.dart';
import 'package:gaza_tech/features/community/cubit/post_details_cubit.dart';
import 'package:gaza_tech/features/community/data/repos/community_repo.dart';
import 'package:gaza_tech/features/community/data/services/community_api_service.dart';
import 'package:gaza_tech/features/add_post/cubit/add_post_cubit.dart';
import 'package:gaza_tech/features/community_search/cubit/community_search_cubit.dart';

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

  // 10. Marketplace
  getIt.registerLazySingleton<MarketplaceApiService>(
    () => MarketplaceApiService(getIt()),
  );
  getIt.registerLazySingleton<MarketplaceRepo>(() => MarketplaceRepo(getIt()));
  getIt.registerFactory<MarketplaceCubit>(() => MarketplaceCubit(getIt()));

  // 11. Add Listing
  getIt.registerLazySingleton<AddListingApiService>(
    () => AddListingApiService(getIt()),
  );
  getIt.registerLazySingleton<AddListingRepo>(() => AddListingRepo(getIt()));
  getIt.registerFactory<AddListingCubit>(() => AddListingCubit(getIt()));

  // 12. Listing Details
  getIt.registerLazySingleton<ListingDetailsApiService>(
    () => ListingDetailsApiService(getIt()),
  );
  getIt.registerLazySingleton<ListingDetailsRepo>(
    () => ListingDetailsRepo(getIt()),
  );
  getIt.registerFactoryParam<ListingDetailsCubit, String, void>(
    (listingId, _) => ListingDetailsCubit(getIt(), listingId),
  );

  // 13. Search
  getIt.registerLazySingleton<MarketplaceSearchApiService>(
    () => MarketplaceSearchApiService(getIt()),
  );
  getIt.registerLazySingleton<MarketplaceSearchRepo>(() => MarketplaceSearchRepo(getIt()));
  getIt.registerFactory<MarketplaceSearchCubit>(() => MarketplaceSearchCubit(getIt()));

  // 14. Community
  getIt.registerLazySingleton<CommunityApiService>(
    () => CommunityApiService(getIt()),
  );
  getIt.registerLazySingleton<CommunityRepo>(() => CommunityRepo(getIt()));
  getIt.registerFactory<CommunityCubit>(() => CommunityCubit(getIt()));
  getIt.registerFactoryParam<PostDetailsCubit, String, void>(
    (postId, _) => PostDetailsCubit(getIt(), postId),
  );
  getIt.registerFactory<AddPostCubit>(() => AddPostCubit(getIt()));

  // 15. Community Search
  getIt.registerFactory<CommunitySearchCubit>(
    () => CommunitySearchCubit(getIt()),
  );
}
