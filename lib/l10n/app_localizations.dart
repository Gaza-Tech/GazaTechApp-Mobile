import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Gaza Tech App'**
  String get appTitle;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @signInSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue to Gaza Tech'**
  String get signInSubtitle;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @createAccountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join us to get started!'**
  String get createAccountSubtitle;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailHint;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordHint;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @confirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Re-enter your password'**
  String get confirmPasswordHint;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @newPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get newPasswordHint;

  /// No description provided for @confirmNewPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Re-enter new password'**
  String get confirmNewPasswordHint;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @firstNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your first name'**
  String get firstNameHint;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @lastNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your last name'**
  String get lastNameHint;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @forgotPasswordLink.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPasswordLink;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAccount;

  /// No description provided for @agreeToTermsPrefix.
  ///
  /// In en, this message translates to:
  /// **'I agree to the '**
  String get agreeToTermsPrefix;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsAndConditions;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get and;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @verifyYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Verify Your Email'**
  String get verifyYourEmail;

  /// No description provided for @otpSentTo.
  ///
  /// In en, this message translates to:
  /// **'A 6-digit code was sent to'**
  String get otpSentTo;

  /// No description provided for @recoverySentTo.
  ///
  /// In en, this message translates to:
  /// **'A recovery code was sent to'**
  String get recoverySentTo;

  /// No description provided for @enterConfirmationCode.
  ///
  /// In en, this message translates to:
  /// **'Enter confirmation code'**
  String get enterConfirmationCode;

  /// No description provided for @enterRecoveryCode.
  ///
  /// In en, this message translates to:
  /// **'Enter recovery code'**
  String get enterRecoveryCode;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @didntReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code? '**
  String get didntReceiveCode;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendCode;

  /// No description provided for @resendingCode.
  ///
  /// In en, this message translates to:
  /// **'Resending code...'**
  String get resendingCode;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address and we\'ll send you a recovery code.'**
  String get forgotPasswordSubtitle;

  /// No description provided for @sendRecoveryCode.
  ///
  /// In en, this message translates to:
  /// **'Send Recovery Code'**
  String get sendRecoveryCode;

  /// No description provided for @resetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordTitle;

  /// No description provided for @resetPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create a new password for your account.'**
  String get resetPasswordSubtitle;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @welcomeHome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Gaza Tech App!'**
  String get welcomeHome;

  /// No description provided for @homeContent.
  ///
  /// In en, this message translates to:
  /// **'Home Screen Content Goes Here'**
  String get homeContent;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @signInCancelled.
  ///
  /// In en, this message translates to:
  /// **'Sign-in cancelled'**
  String get signInCancelled;

  /// No description provided for @passwordResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your password has been reset successfully. Please sign in with your new password.'**
  String get passwordResetSuccess;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalidEmail;

  /// No description provided for @minChars.
  ///
  /// In en, this message translates to:
  /// **'Min {count} chars'**
  String minChars(int count);

  /// No description provided for @minCharacters.
  ///
  /// In en, this message translates to:
  /// **'Min {count} characters'**
  String minCharacters(int count);

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @emailCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Email cannot be empty.'**
  String get emailCannotBeEmpty;

  /// No description provided for @enterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get enterValidEmail;

  /// No description provided for @passwordCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Password cannot be empty.'**
  String get passwordCannotBeEmpty;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least {count} characters long.'**
  String passwordMinLength(int count);

  /// No description provided for @passwordNeedsUppercase.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter.'**
  String get passwordNeedsUppercase;

  /// No description provided for @passwordNeedsLowercase.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one lowercase letter.'**
  String get passwordNeedsLowercase;

  /// No description provided for @passwordNeedsNumber.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one number.'**
  String get passwordNeedsNumber;

  /// No description provided for @passwordNeedsSpecialChar.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one special character (@\$!%*?&).'**
  String get passwordNeedsSpecialChar;

  /// No description provided for @uppercaseRequired.
  ///
  /// In en, this message translates to:
  /// **'An uppercase letter is required.'**
  String get uppercaseRequired;

  /// No description provided for @lowercaseRequired.
  ///
  /// In en, this message translates to:
  /// **'A lowercase letter is required.'**
  String get lowercaseRequired;

  /// No description provided for @numberRequired.
  ///
  /// In en, this message translates to:
  /// **'A number is required.'**
  String get numberRequired;

  /// No description provided for @specialCharRequired.
  ///
  /// In en, this message translates to:
  /// **'A special character (@\$!%*?&) is required.'**
  String get specialCharRequired;

  /// No description provided for @minLengthRequired.
  ///
  /// In en, this message translates to:
  /// **'Must be at least {count} characters long.'**
  String minLengthRequired(int count);

  /// No description provided for @fieldCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'{fieldName} cannot be empty.'**
  String fieldCannotBeEmpty(String fieldName);

  /// No description provided for @fieldMinLength.
  ///
  /// In en, this message translates to:
  /// **'{fieldName} must be at least {count} characters long.'**
  String fieldMinLength(String fieldName, int count);

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @marketplace.
  ///
  /// In en, this message translates to:
  /// **'Marketplace'**
  String get marketplace;

  /// No description provided for @addListing.
  ///
  /// In en, this message translates to:
  /// **'Add Listing'**
  String get addListing;

  /// No description provided for @community.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get community;

  /// No description provided for @marketplaceContent.
  ///
  /// In en, this message translates to:
  /// **'Browse products and services'**
  String get marketplaceContent;

  /// No description provided for @communityContent.
  ///
  /// In en, this message translates to:
  /// **'Connect with others'**
  String get communityContent;

  /// No description provided for @noListingsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No listings available'**
  String get noListingsAvailable;

  /// No description provided for @categoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get categoryAll;

  /// No description provided for @categoryElectronics.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get categoryElectronics;

  /// No description provided for @categoryClothing.
  ///
  /// In en, this message translates to:
  /// **'Clothing'**
  String get categoryClothing;

  /// No description provided for @categoryHomeGarden.
  ///
  /// In en, this message translates to:
  /// **'Home & Garden'**
  String get categoryHomeGarden;

  /// No description provided for @categoryFood.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get categoryFood;

  /// No description provided for @categoryServices.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get categoryServices;

  /// No description provided for @categoryVehicles.
  ///
  /// In en, this message translates to:
  /// **'Vehicles'**
  String get categoryVehicles;

  /// No description provided for @categoryBooks.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get categoryBooks;

  /// No description provided for @categorySports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get categorySports;

  /// No description provided for @categoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get categoryOther;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @sign_out.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get sign_out;

  /// No description provided for @saveDraft.
  ///
  /// In en, this message translates to:
  /// **'Save Draft'**
  String get saveDraft;

  /// No description provided for @productImagesMax.
  ///
  /// In en, this message translates to:
  /// **'Product Images (Max {count})'**
  String productImagesMax(int count);

  /// No description provided for @productImagesHelper.
  ///
  /// In en, this message translates to:
  /// **'Add clear photos of your product. First image will be the cover.'**
  String get productImagesHelper;

  /// No description provided for @productInformation.
  ///
  /// In en, this message translates to:
  /// **'Product Information'**
  String get productInformation;

  /// No description provided for @publishListing.
  ///
  /// In en, this message translates to:
  /// **'Publish Listing'**
  String get publishListing;

  /// No description provided for @titleLabel.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get titleLabel;

  /// No description provided for @titleHelper.
  ///
  /// In en, this message translates to:
  /// **'Be specific and descriptive'**
  String get titleHelper;

  /// No description provided for @titleHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., iPhone 14 Pro Max 256GB Purple'**
  String get titleHint;

  /// No description provided for @categoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get categoryLabel;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select category'**
  String get selectCategory;

  /// No description provided for @selectCategoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get selectCategoryTitle;

  /// No description provided for @conditionLabel.
  ///
  /// In en, this message translates to:
  /// **'Condition'**
  String get conditionLabel;

  /// No description provided for @conditionBrandNew.
  ///
  /// In en, this message translates to:
  /// **'Brand New'**
  String get conditionBrandNew;

  /// No description provided for @conditionUsedExcellent.
  ///
  /// In en, this message translates to:
  /// **'Used - Excellent'**
  String get conditionUsedExcellent;

  /// No description provided for @conditionUsedGood.
  ///
  /// In en, this message translates to:
  /// **'Used - Good'**
  String get conditionUsedGood;

  /// No description provided for @conditionForParts.
  ///
  /// In en, this message translates to:
  /// **'For Parts'**
  String get conditionForParts;

  /// No description provided for @priceLabel.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get priceLabel;

  /// No description provided for @priceHelper.
  ///
  /// In en, this message translates to:
  /// **'Set a competitive price to attract buyers'**
  String get priceHelper;

  /// No description provided for @priceHint.
  ///
  /// In en, this message translates to:
  /// **'0.00'**
  String get priceHint;

  /// No description provided for @currencyILS.
  ///
  /// In en, this message translates to:
  /// **'₪ ILS'**
  String get currencyILS;

  /// No description provided for @currencyUSD.
  ///
  /// In en, this message translates to:
  /// **'\$ USD'**
  String get currencyUSD;

  /// No description provided for @descriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get descriptionLabel;

  /// No description provided for @descriptionHelper.
  ///
  /// In en, this message translates to:
  /// **'Be honest and detailed'**
  String get descriptionHelper;

  /// No description provided for @descriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Describe your product...'**
  String get descriptionHint;

  /// No description provided for @specificationsLabel.
  ///
  /// In en, this message translates to:
  /// **'Specifications'**
  String get specificationsLabel;

  /// No description provided for @addField.
  ///
  /// In en, this message translates to:
  /// **'+ Add Field'**
  String get addField;

  /// No description provided for @specificationsHelper.
  ///
  /// In en, this message translates to:
  /// **'Add technical details to help buyers make informed decisions'**
  String get specificationsHelper;

  /// No description provided for @specNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Processor'**
  String get specNameHint;

  /// No description provided for @specValueHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Apple A16 Bionic'**
  String get specValueHint;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @locationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get locationLabel;

  /// No description provided for @selectLocation.
  ///
  /// In en, this message translates to:
  /// **'Select location'**
  String get selectLocation;

  /// No description provided for @selectLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Location'**
  String get selectLocationTitle;

  /// No description provided for @addMainImage.
  ///
  /// In en, this message translates to:
  /// **'Add Main Image'**
  String get addMainImage;

  /// No description provided for @locationGazaCity.
  ///
  /// In en, this message translates to:
  /// **'Gaza City'**
  String get locationGazaCity;

  /// No description provided for @locationJabalia.
  ///
  /// In en, this message translates to:
  /// **'Jabalia'**
  String get locationJabalia;

  /// No description provided for @locationAlBureij.
  ///
  /// In en, this message translates to:
  /// **'Al Bureij'**
  String get locationAlBureij;

  /// No description provided for @locationAlNusirat.
  ///
  /// In en, this message translates to:
  /// **'Al Nusirat'**
  String get locationAlNusirat;

  /// No description provided for @locationDeirAlBalah.
  ///
  /// In en, this message translates to:
  /// **'Deir Al Balah'**
  String get locationDeirAlBalah;

  /// No description provided for @locationKhanYunis.
  ///
  /// In en, this message translates to:
  /// **'Khan Yunis'**
  String get locationKhanYunis;

  /// No description provided for @sellerInformation.
  ///
  /// In en, this message translates to:
  /// **'SELLER INFORMATION'**
  String get sellerInformation;

  /// No description provided for @memberSince.
  ///
  /// In en, this message translates to:
  /// **'Member since {date}'**
  String memberSince(String date);

  /// No description provided for @contactSeller.
  ///
  /// In en, this message translates to:
  /// **'Contact Seller'**
  String get contactSeller;

  /// No description provided for @viewProfile.
  ///
  /// In en, this message translates to:
  /// **'View Profile'**
  String get viewProfile;

  /// No description provided for @descriptionSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'DESCRIPTION'**
  String get descriptionSectionTitle;

  /// No description provided for @specificationsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'SPECIFICATIONS'**
  String get specificationsSectionTitle;

  /// No description provided for @similarProducts.
  ///
  /// In en, this message translates to:
  /// **'Similar Products'**
  String get similarProducts;

  /// No description provided for @moreFromSeller.
  ///
  /// In en, this message translates to:
  /// **'More from {sellerName}'**
  String moreFromSeller(String sellerName);

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} days ago'**
  String daysAgo(int count);

  /// No description provided for @weekAgo.
  ///
  /// In en, this message translates to:
  /// **'1 week ago'**
  String get weekAgo;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get searchHint;

  /// No description provided for @searchPrompt.
  ///
  /// In en, this message translates to:
  /// **'Search for products'**
  String get searchPrompt;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @noResultsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Try different keywords or adjust your filters'**
  String get noResultsSubtitle;

  /// No description provided for @filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// No description provided for @applyFilters.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get applyFilters;

  /// No description provided for @sortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get sortBy;

  /// No description provided for @sortNewest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get sortNewest;

  /// No description provided for @sortPriceLowToHigh.
  ///
  /// In en, this message translates to:
  /// **'Price: Low to High'**
  String get sortPriceLowToHigh;

  /// No description provided for @sortPriceHighToLow.
  ///
  /// In en, this message translates to:
  /// **'Price: High to Low'**
  String get sortPriceHighToLow;

  /// No description provided for @priceRange.
  ///
  /// In en, this message translates to:
  /// **'Price Range'**
  String get priceRange;

  /// No description provided for @priceRangeUsd.
  ///
  /// In en, this message translates to:
  /// **'Price Range (USD)'**
  String get priceRangeUsd;

  /// No description provided for @priceRangeIls.
  ///
  /// In en, this message translates to:
  /// **'Price Range (ILS)'**
  String get priceRangeIls;

  /// No description provided for @priceMin.
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get priceMin;

  /// No description provided for @priceMax.
  ///
  /// In en, this message translates to:
  /// **'Max'**
  String get priceMax;

  /// No description provided for @conditionFilter.
  ///
  /// In en, this message translates to:
  /// **'Condition'**
  String get conditionFilter;

  /// No description provided for @searchMarketplace.
  ///
  /// In en, this message translates to:
  /// **'Search marketplace...'**
  String get searchMarketplace;

  /// No description provided for @searchCommunity.
  ///
  /// In en, this message translates to:
  /// **'Search community...'**
  String get searchCommunity;

  /// No description provided for @createPost.
  ///
  /// In en, this message translates to:
  /// **'Create Post'**
  String get createPost;

  /// No description provided for @recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// No description provided for @questions.
  ///
  /// In en, this message translates to:
  /// **'Questions'**
  String get questions;

  /// No description provided for @tips.
  ///
  /// In en, this message translates to:
  /// **'Tips'**
  String get tips;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news;

  /// No description provided for @troubleshooting.
  ///
  /// In en, this message translates to:
  /// **'Troubleshooting'**
  String get troubleshooting;

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} hours ago'**
  String hoursAgo(int count);

  /// No description provided for @dayAgo.
  ///
  /// In en, this message translates to:
  /// **'1 day ago'**
  String get dayAgo;

  /// No description provided for @question.
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get question;

  /// No description provided for @newPost.
  ///
  /// In en, this message translates to:
  /// **'New Post'**
  String get newPost;

  /// No description provided for @postTitle.
  ///
  /// In en, this message translates to:
  /// **'Post Title'**
  String get postTitle;

  /// No description provided for @enterPostTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter post title'**
  String get enterPostTitle;

  /// No description provided for @content.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get content;

  /// No description provided for @writeYourPostHere.
  ///
  /// In en, this message translates to:
  /// **'Write your post here...'**
  String get writeYourPostHere;

  /// No description provided for @attachments.
  ///
  /// In en, this message translates to:
  /// **'Attachments'**
  String get attachments;

  /// No description provided for @addImagesOrFiles.
  ///
  /// In en, this message translates to:
  /// **'Add images or files'**
  String get addImagesOrFiles;

  /// No description provided for @maxFileSize.
  ///
  /// In en, this message translates to:
  /// **'Max 5MB per file'**
  String get maxFileSize;

  /// No description provided for @publishPost.
  ///
  /// In en, this message translates to:
  /// **'Publish Post'**
  String get publishPost;

  /// No description provided for @postDetails.
  ///
  /// In en, this message translates to:
  /// **'Post Details'**
  String get postDetails;

  /// No description provided for @commentsCount.
  ///
  /// In en, this message translates to:
  /// **'Comments ({count})'**
  String commentsCount(int count);

  /// No description provided for @topSort.
  ///
  /// In en, this message translates to:
  /// **'Top'**
  String get topSort;

  /// No description provided for @reply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get reply;

  /// No description provided for @loadMoreComments.
  ///
  /// In en, this message translates to:
  /// **'Load More Comments'**
  String get loadMoreComments;

  /// No description provided for @relatedPosts.
  ///
  /// In en, this message translates to:
  /// **'Related Posts'**
  String get relatedPosts;

  /// No description provided for @addComment.
  ///
  /// In en, this message translates to:
  /// **'Add a comment...'**
  String get addComment;

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} min ago'**
  String minutesAgo(int count);

  /// No description provided for @gaming.
  ///
  /// In en, this message translates to:
  /// **'Gaming'**
  String get gaming;

  /// No description provided for @replyingTo.
  ///
  /// In en, this message translates to:
  /// **'Replying to @{userName}'**
  String replyingTo(String userName);

  /// No description provided for @postPublished.
  ///
  /// In en, this message translates to:
  /// **'Post published successfully'**
  String get postPublished;

  /// No description provided for @viewReplies.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{View 1 reply} other{View {count} replies}}'**
  String viewReplies(int count);

  /// No description provided for @hideReplies.
  ///
  /// In en, this message translates to:
  /// **'Hide replies'**
  String get hideReplies;

  /// No description provided for @recentSearches.
  ///
  /// In en, this message translates to:
  /// **'Recent searches'**
  String get recentSearches;

  /// No description provided for @clearRecentSearches.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clearRecentSearches;

  /// No description provided for @noCommunityResults.
  ///
  /// In en, this message translates to:
  /// **'No posts found'**
  String get noCommunityResults;

  /// No description provided for @noCommunityResultsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Try different keywords'**
  String get noCommunityResultsSubtitle;

  /// No description provided for @sortPosts.
  ///
  /// In en, this message translates to:
  /// **'Sort Posts'**
  String get sortPosts;

  /// No description provided for @timeBased.
  ///
  /// In en, this message translates to:
  /// **'Time-Based'**
  String get timeBased;

  /// No description provided for @popularity.
  ///
  /// In en, this message translates to:
  /// **'Popularity'**
  String get popularity;

  /// No description provided for @newest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get newest;

  /// No description provided for @oldest.
  ///
  /// In en, this message translates to:
  /// **'Oldest'**
  String get oldest;

  /// No description provided for @mostLiked.
  ///
  /// In en, this message translates to:
  /// **'Most Liked'**
  String get mostLiked;

  /// No description provided for @mostCommented.
  ///
  /// In en, this message translates to:
  /// **'Most Commented'**
  String get mostCommented;

  /// No description provided for @resetSort.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetSort;

  /// No description provided for @filterPosts.
  ///
  /// In en, this message translates to:
  /// **'Filter Posts'**
  String get filterPosts;

  /// No description provided for @categoryFilter.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get categoryFilter;

  /// No description provided for @dateRangeFilter.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get dateRangeFilter;

  /// No description provided for @engagementLevel.
  ///
  /// In en, this message translates to:
  /// **'Engagement Level'**
  String get engagementLevel;

  /// No description provided for @sortOrder.
  ///
  /// In en, this message translates to:
  /// **'Sort Order'**
  String get sortOrder;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// No description provided for @thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get thisMonth;

  /// No description provided for @thisYear.
  ///
  /// In en, this message translates to:
  /// **'This Year'**
  String get thisYear;

  /// No description provided for @likes100Plus.
  ///
  /// In en, this message translates to:
  /// **'100+ Likes'**
  String get likes100Plus;

  /// No description provided for @comments50Plus.
  ///
  /// In en, this message translates to:
  /// **'50+ Comments'**
  String get comments50Plus;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @bio.
  ///
  /// In en, this message translates to:
  /// **'Bio'**
  String get bio;

  /// No description provided for @bioHint.
  ///
  /// In en, this message translates to:
  /// **'Tell others about yourself...'**
  String get bioHint;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @whatsappNumber.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Number'**
  String get whatsappNumber;

  /// No description provided for @socialLinks.
  ///
  /// In en, this message translates to:
  /// **'Social Links'**
  String get socialLinks;

  /// No description provided for @facebookLink.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebookLink;

  /// No description provided for @instagramLink.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get instagramLink;

  /// No description provided for @twitterLink.
  ///
  /// In en, this message translates to:
  /// **'Twitter / X'**
  String get twitterLink;

  /// No description provided for @websiteLink.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get websiteLink;

  /// No description provided for @changeAvatar.
  ///
  /// In en, this message translates to:
  /// **'Change Photo'**
  String get changeAvatar;

  /// No description provided for @removeAvatar.
  ///
  /// In en, this message translates to:
  /// **'Remove Photo'**
  String get removeAvatar;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @profileUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profileUpdated;

  /// No description provided for @myPosts.
  ///
  /// In en, this message translates to:
  /// **'Posts'**
  String get myPosts;

  /// No description provided for @myListings.
  ///
  /// In en, this message translates to:
  /// **'Listings'**
  String get myListings;

  /// No description provided for @bookmarks.
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get bookmarks;

  /// No description provided for @noPostsYet.
  ///
  /// In en, this message translates to:
  /// **'No posts yet'**
  String get noPostsYet;

  /// No description provided for @noListingsYet.
  ///
  /// In en, this message translates to:
  /// **'No listings yet'**
  String get noListingsYet;

  /// No description provided for @noBookmarksYet.
  ///
  /// In en, this message translates to:
  /// **'No bookmarks yet'**
  String get noBookmarksYet;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get personalInfo;

  /// No description provided for @contactInfo.
  ///
  /// In en, this message translates to:
  /// **'Contact Info'**
  String get contactInfo;

  /// No description provided for @verified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get verified;

  /// No description provided for @avatarUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload photo'**
  String get avatarUploadFailed;

  /// No description provided for @contactUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Contact information is not available for this seller'**
  String get contactUnavailable;

  /// No description provided for @couldNotOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Could not open this link'**
  String get couldNotOpenLink;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @bookmarkedPosts.
  ///
  /// In en, this message translates to:
  /// **'Posts'**
  String get bookmarkedPosts;

  /// No description provided for @bookmarkedListings.
  ///
  /// In en, this message translates to:
  /// **'Listings'**
  String get bookmarkedListings;

  /// No description provided for @noBookmarkedListingsYet.
  ///
  /// In en, this message translates to:
  /// **'No bookmarked listings yet'**
  String get noBookmarkedListingsYet;

  /// No description provided for @getVerified.
  ///
  /// In en, this message translates to:
  /// **'Get Verified'**
  String get getVerified;

  /// No description provided for @verificationRequest.
  ///
  /// In en, this message translates to:
  /// **'Verification Request'**
  String get verificationRequest;

  /// No description provided for @verificationStatusTitle.
  ///
  /// In en, this message translates to:
  /// **'Verification Status'**
  String get verificationStatusTitle;

  /// No description provided for @verificationPending.
  ///
  /// In en, this message translates to:
  /// **'Verification Pending'**
  String get verificationPending;

  /// No description provided for @verificationApproved.
  ///
  /// In en, this message translates to:
  /// **'Verification Approved'**
  String get verificationApproved;

  /// No description provided for @verificationRejected.
  ///
  /// In en, this message translates to:
  /// **'Verification Rejected'**
  String get verificationRejected;

  /// No description provided for @verificationExpired.
  ///
  /// In en, this message translates to:
  /// **'Verification Expired'**
  String get verificationExpired;

  /// No description provided for @verificationSuspicious.
  ///
  /// In en, this message translates to:
  /// **'Under Manual Review'**
  String get verificationSuspicious;

  /// No description provided for @stepPersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get stepPersonalInfo;

  /// No description provided for @stepDocuments.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get stepDocuments;

  /// No description provided for @stepPhoneVerification.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get stepPhoneVerification;

  /// No description provided for @stepReview.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get stepReview;

  /// No description provided for @idFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name (as on ID)'**
  String get idFullName;

  /// No description provided for @idFullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name as it appears on your ID'**
  String get idFullNameHint;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @selectDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Select date of birth'**
  String get selectDateOfBirth;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @addressHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your current address'**
  String get addressHint;

  /// No description provided for @nationalIdNumber.
  ///
  /// In en, this message translates to:
  /// **'National ID Number'**
  String get nationalIdNumber;

  /// No description provided for @nationalIdNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your national ID number'**
  String get nationalIdNumberHint;

  /// No description provided for @documentType.
  ///
  /// In en, this message translates to:
  /// **'Document Type'**
  String get documentType;

  /// No description provided for @palestinianId.
  ///
  /// In en, this message translates to:
  /// **'Palestinian ID'**
  String get palestinianId;

  /// No description provided for @passport.
  ///
  /// In en, this message translates to:
  /// **'Passport'**
  String get passport;

  /// No description provided for @palestinianDrivingLicence.
  ///
  /// In en, this message translates to:
  /// **'Palestinian Driving Licence'**
  String get palestinianDrivingLicence;

  /// No description provided for @documentFront.
  ///
  /// In en, this message translates to:
  /// **'Front of Document'**
  String get documentFront;

  /// No description provided for @documentBack.
  ///
  /// In en, this message translates to:
  /// **'Back of Document'**
  String get documentBack;

  /// No description provided for @selfieWithId.
  ///
  /// In en, this message translates to:
  /// **'Selfie with ID'**
  String get selfieWithId;

  /// No description provided for @tapToUploadPhoto.
  ///
  /// In en, this message translates to:
  /// **'Tap to upload photo'**
  String get tapToUploadPhoto;

  /// No description provided for @changePhoto.
  ///
  /// In en, this message translates to:
  /// **'Change photo'**
  String get changePhoto;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @phoneVerification.
  ///
  /// In en, this message translates to:
  /// **'Phone Verification'**
  String get phoneVerification;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get enterPhoneNumber;

  /// No description provided for @phoneNumberHint.
  ///
  /// In en, this message translates to:
  /// **'+970xxxxxxxxx'**
  String get phoneNumberHint;

  /// No description provided for @sendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// No description provided for @verifyPhone.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verifyPhone;

  /// No description provided for @phoneVerifiedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Phone verified successfully'**
  String get phoneVerifiedSuccess;

  /// No description provided for @pleaseVerifyPhone.
  ///
  /// In en, this message translates to:
  /// **'Please verify your phone number to continue'**
  String get pleaseVerifyPhone;

  /// No description provided for @otpSentToPhone.
  ///
  /// In en, this message translates to:
  /// **'A verification code was sent to your phone'**
  String get otpSentToPhone;

  /// No description provided for @reviewYourData.
  ///
  /// In en, this message translates to:
  /// **'Review Your Data'**
  String get reviewYourData;

  /// No description provided for @reviewPersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get reviewPersonalInfo;

  /// No description provided for @reviewDocuments.
  ///
  /// In en, this message translates to:
  /// **'Uploaded Documents'**
  String get reviewDocuments;

  /// No description provided for @reviewPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone Verification'**
  String get reviewPhone;

  /// No description provided for @submitVerification.
  ///
  /// In en, this message translates to:
  /// **'Submit Verification Request'**
  String get submitVerification;

  /// No description provided for @submittingVerification.
  ///
  /// In en, this message translates to:
  /// **'Submitting...'**
  String get submittingVerification;

  /// No description provided for @verificationSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Verification request submitted successfully'**
  String get verificationSubmitted;

  /// No description provided for @verificationUnderReview.
  ///
  /// In en, this message translates to:
  /// **'Your request is under review. You will be notified once it is processed.'**
  String get verificationUnderReview;

  /// No description provided for @rejectionReason.
  ///
  /// In en, this message translates to:
  /// **'Rejection Reason'**
  String get rejectionReason;

  /// No description provided for @resubmitVerification.
  ///
  /// In en, this message translates to:
  /// **'Resubmit Verification'**
  String get resubmitVerification;

  /// No description provided for @submittedOn.
  ///
  /// In en, this message translates to:
  /// **'Submitted on {date}'**
  String submittedOn(String date);

  /// No description provided for @reviewedOn.
  ///
  /// In en, this message translates to:
  /// **'Reviewed on {date}'**
  String reviewedOn(String date);

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @pleaseSelectGender.
  ///
  /// In en, this message translates to:
  /// **'Please select a gender'**
  String get pleaseSelectGender;

  /// No description provided for @pleaseSelectDocumentType.
  ///
  /// In en, this message translates to:
  /// **'Please select a document type'**
  String get pleaseSelectDocumentType;

  /// No description provided for @pleaseUploadAllDocuments.
  ///
  /// In en, this message translates to:
  /// **'Please upload all required documents'**
  String get pleaseUploadAllDocuments;

  /// No description provided for @pleaseFillDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Please select your date of birth'**
  String get pleaseFillDateOfBirth;

  /// No description provided for @timelineSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Submitted'**
  String get timelineSubmitted;

  /// No description provided for @timelineUnderReview.
  ///
  /// In en, this message translates to:
  /// **'Under Review'**
  String get timelineUnderReview;

  /// No description provided for @timelineDecision.
  ///
  /// In en, this message translates to:
  /// **'Decision'**
  String get timelineDecision;

  /// No description provided for @editListing.
  ///
  /// In en, this message translates to:
  /// **'Edit Listing'**
  String get editListing;

  /// No description provided for @updateListing.
  ///
  /// In en, this message translates to:
  /// **'Update Listing'**
  String get updateListing;

  /// No description provided for @listingUpdated.
  ///
  /// In en, this message translates to:
  /// **'Listing updated successfully'**
  String get listingUpdated;

  /// No description provided for @deleteListing.
  ///
  /// In en, this message translates to:
  /// **'Delete Listing'**
  String get deleteListing;

  /// No description provided for @deleteListingConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Listing?'**
  String get deleteListingConfirmTitle;

  /// No description provided for @deleteListingConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this listing? This action cannot be undone.'**
  String get deleteListingConfirmBody;

  /// No description provided for @listingDeleted.
  ///
  /// In en, this message translates to:
  /// **'Listing deleted successfully'**
  String get listingDeleted;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @editPost.
  ///
  /// In en, this message translates to:
  /// **'Edit Post'**
  String get editPost;

  /// No description provided for @updatePost.
  ///
  /// In en, this message translates to:
  /// **'Update Post'**
  String get updatePost;

  /// No description provided for @postUpdated.
  ///
  /// In en, this message translates to:
  /// **'Post updated successfully'**
  String get postUpdated;

  /// No description provided for @deletePost.
  ///
  /// In en, this message translates to:
  /// **'Delete Post'**
  String get deletePost;

  /// No description provided for @deletePostConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Post?'**
  String get deletePostConfirmTitle;

  /// No description provided for @deletePostConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this post? This action cannot be undone.'**
  String get deletePostConfirmBody;

  /// No description provided for @postDeleted.
  ///
  /// In en, this message translates to:
  /// **'Post deleted successfully'**
  String get postDeleted;

  /// No description provided for @reportListing.
  ///
  /// In en, this message translates to:
  /// **'Report Listing'**
  String get reportListing;

  /// No description provided for @reportPost.
  ///
  /// In en, this message translates to:
  /// **'Report Post'**
  String get reportPost;

  /// No description provided for @reportUser.
  ///
  /// In en, this message translates to:
  /// **'Report User'**
  String get reportUser;

  /// No description provided for @reportComment.
  ///
  /// In en, this message translates to:
  /// **'Report Comment'**
  String get reportComment;

  /// No description provided for @reportSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Why are you reporting this?'**
  String get reportSubtitle;

  /// No description provided for @reportReasonSpam.
  ///
  /// In en, this message translates to:
  /// **'Spam'**
  String get reportReasonSpam;

  /// No description provided for @reportReasonInappropriateContent.
  ///
  /// In en, this message translates to:
  /// **'Inappropriate Content'**
  String get reportReasonInappropriateContent;

  /// No description provided for @reportReasonHarassment.
  ///
  /// In en, this message translates to:
  /// **'Harassment'**
  String get reportReasonHarassment;

  /// No description provided for @reportReasonMisleading.
  ///
  /// In en, this message translates to:
  /// **'Misleading'**
  String get reportReasonMisleading;

  /// No description provided for @reportReasonFraudScam.
  ///
  /// In en, this message translates to:
  /// **'Fraud / Scam'**
  String get reportReasonFraudScam;

  /// No description provided for @reportReasonHateSpeech.
  ///
  /// In en, this message translates to:
  /// **'Hate Speech'**
  String get reportReasonHateSpeech;

  /// No description provided for @reportReasonOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get reportReasonOther;

  /// No description provided for @reportDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Add more details (optional)'**
  String get reportDescriptionHint;

  /// No description provided for @reportSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit Report'**
  String get reportSubmit;

  /// No description provided for @reportSuccess.
  ///
  /// In en, this message translates to:
  /// **'Report submitted successfully. We will review it shortly.'**
  String get reportSuccess;

  /// No description provided for @reportFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit report. Please try again.'**
  String get reportFailure;

  /// No description provided for @reportAlreadySubmitted.
  ///
  /// In en, this message translates to:
  /// **'You have already reported this. We are reviewing it.'**
  String get reportAlreadySubmitted;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
