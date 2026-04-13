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
import 'package:gaza_tech/features/auth/guest_auth/cubit/guest_auth_cubit.dart';
import 'package:gaza_tech/features/auth/sign_out/cubit/sign_out_cubit.dart';
import 'package:gaza_tech/features/add_listing/cubit/add_listing_cubit.dart';
import 'package:gaza_tech/features/add_listing/ui/add_listing_screen.dart';
import 'package:gaza_tech/features/listing_details/cubit/listing_details_cubit.dart';
import 'package:gaza_tech/features/listing_details/data/models/listing_detail_model.dart';
import 'package:gaza_tech/features/listing_details/ui/listing_details_screen.dart';
import 'package:gaza_tech/features/marketplace/cubit/marketplace_cubit.dart';
import 'package:gaza_tech/features/add_post/cubit/add_post_cubit.dart';
import 'package:gaza_tech/features/add_post/ui/add_post_screen.dart';
import 'package:gaza_tech/features/community/data/models/post_model.dart';
import 'package:gaza_tech/features/community/cubit/community_cubit.dart';
import 'package:gaza_tech/features/community/cubit/post_details_cubit.dart';
import 'package:gaza_tech/features/community/ui/post_details_screen.dart';
import 'package:gaza_tech/features/community_search/cubit/community_search_cubit.dart';
import 'package:gaza_tech/features/community_search/ui/community_search_screen.dart';
import 'package:gaza_tech/features/marketplace_search/cubit/marketplace_search_cubit.dart';
import 'package:gaza_tech/features/marketplace_search/ui/marketplace_search_screen.dart';
import 'package:gaza_tech/features/profile/cubit/profile_cubit.dart';
import 'package:gaza_tech/features/profile/ui/profile_screen.dart';
import 'package:gaza_tech/features/profile/data/models/user_profile_model.dart';
import 'package:gaza_tech/features/bookmarks/cubit/bookmarks_cubit.dart';
import 'package:gaza_tech/features/bookmarks/ui/bookmarks_screen.dart';
import 'package:gaza_tech/features/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:gaza_tech/features/edit_profile/ui/edit_profile_screen.dart';
import 'package:gaza_tech/features/verification/cubit/verification_cubit.dart';
import 'package:gaza_tech/features/verification/ui/verification_form_screen.dart';
import 'package:gaza_tech/features/verification/ui/verification_status_screen.dart';
import 'package:gaza_tech/features/ai_chat/cubit/ai_chat_cubit.dart';
import 'package:gaza_tech/features/ai_chat/ui/ai_chat_screen.dart';
import 'package:gaza_tech/features/drafts/cubit/drafts_cubit.dart';
import 'package:gaza_tech/features/drafts/ui/drafts_screen.dart';
import 'package:gaza_tech/features/settings/ui/settings_screen.dart';
import 'package:gaza_tech/features/help/ui/help_screen.dart';
import 'package:gaza_tech/features/about/ui/about_screen.dart';

class MyRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.signIn:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<SignInCubit>()),
              BlocProvider(create: (context) => getIt<GoogleAuthCubit>()),
              BlocProvider(create: (context) => getIt<GuestAuthCubit>()),
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
              BlocProvider(create: (context) => getIt<MarketplaceCubit>()),
              BlocProvider(create: (context) => getIt<CommunityCubit>()),
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
      case MyRoutes.addListing:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<AddListingCubit>(param1: null)..loadFormData(),
            child: const AddListingScreen(),
          ),
        );
      case MyRoutes.editListing:
        final listing = settings.arguments as ListingDetailModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<AddListingCubit>(param1: listing)..loadFormData(),
            child: const AddListingScreen(),
          ),
        );
      case MyRoutes.listingDetails:
        final listingId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<ListingDetailsCubit>(param1: listingId)..loadListing(),
            child: const ListingDetailsScreen(),
          ),
        );
      case MyRoutes.search:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<MarketplaceSearchCubit>()
              ..loadFilterData()
              ..loadRecentSearches(),
            child: const MarketpalceSearchScreen(),
          ),
        );
      case MyRoutes.createPost:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AddPostCubit>(param1: null),
            child: const AddPostScreen(),
          ),
        );
      case MyRoutes.editPost:
        final post = settings.arguments as PostModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AddPostCubit>(param1: post),
            child: const AddPostScreen(),
          ),
        );
      case MyRoutes.postDetails:
        final postId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PostDetailsCubit>(param1: postId)
              ..loadPost()
              ..loadComments(),
            child: const PostDetailsScreen(),
          ),
        );
      case MyRoutes.communitySearch:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<CommunitySearchCubit>()..loadRecentSearches(),
            child: const CommunitySearchScreen(),
          ),
        );
      case MyRoutes.profile:
        final args = settings.arguments as Map<String, dynamic>;
        final userId = args['userId'] as String;
        final isOwnProfile = args['isOwnProfile'] as bool? ?? false;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = getIt<ProfileCubit>(
                param1: userId,
                param2: isOwnProfile,
              );
              cubit.loadProfile();
              cubit.fetchPosts();
              cubit.fetchListings();
              return cubit;
            },
            child: const ProfileScreen(),
          ),
        );
      case MyRoutes.bookmarks:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<BookmarksCubit>(),
            child: const BookmarksScreen(),
          ),
        );
      case MyRoutes.editProfile:
        final profile = settings.arguments as UserProfileModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<EditProfileCubit>(param1: profile),
            child: const EditProfileScreen(),
          ),
        );
      case MyRoutes.verificationForm:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VerificationCubit>(),
            child: const VerificationFormScreen(),
          ),
        );
      case MyRoutes.verificationStatus:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<VerificationCubit>()..loadExistingRequest(),
            child: const VerificationStatusScreen(),
          ),
        );
      case MyRoutes.aiChat:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AiChatCubit>()..loadHistory(),
            child: const AiChatScreen(),
          ),
        );
      case MyRoutes.drafts:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<DraftsCubit>()
              ..fetchPostDrafts()
              ..fetchListingDrafts(),
            child: const DraftsScreen(),
          ),
        );
      case MyRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case MyRoutes.help:
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      case MyRoutes.about:
        return MaterialPageRoute(builder: (_) => const AboutScreen());
      default:
        return null;
    }
  }
}
