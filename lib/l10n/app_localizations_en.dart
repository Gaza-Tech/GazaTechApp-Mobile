// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Gaza Tech App';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get signInSubtitle => 'Sign in to continue to Gaza Tech';

  @override
  String get createAccount => 'Create Account';

  @override
  String get createAccountSubtitle => 'Join us to get started!';

  @override
  String get email => 'Email';

  @override
  String get emailHint => 'Enter your email';

  @override
  String get password => 'Password';

  @override
  String get passwordHint => 'Enter your password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get confirmPasswordHint => 'Re-enter your password';

  @override
  String get newPassword => 'New Password';

  @override
  String get newPasswordHint => 'Enter new password';

  @override
  String get confirmNewPasswordHint => 'Re-enter new password';

  @override
  String get firstName => 'First Name';

  @override
  String get firstNameHint => 'Enter your first name';

  @override
  String get lastName => 'Last Name';

  @override
  String get lastNameHint => 'Enter your last name';

  @override
  String get signIn => 'Sign in';

  @override
  String get signUp => 'Sign up';

  @override
  String get forgotPasswordLink => 'Forgot Password?';

  @override
  String get or => 'Or';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get dontHaveAccount => 'Don\'t have an account? ';

  @override
  String get alreadyHaveAccount => 'Already have an account? ';

  @override
  String get agreeToTermsPrefix => 'I agree to the ';

  @override
  String get termsAndConditions => 'Terms and Conditions';

  @override
  String get and => ' and ';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get verifyYourEmail => 'Verify Your Email';

  @override
  String get otpSentTo => 'A 6-digit code was sent to';

  @override
  String get recoverySentTo => 'A recovery code was sent to';

  @override
  String get enterConfirmationCode => 'Enter confirmation code';

  @override
  String get enterRecoveryCode => 'Enter recovery code';

  @override
  String get verify => 'Verify';

  @override
  String get didntReceiveCode => 'Didn\'t receive the code? ';

  @override
  String get resendCode => 'Resend Code';

  @override
  String get resendingCode => 'Resending code...';

  @override
  String get forgotPasswordTitle => 'Forgot Password';

  @override
  String get forgotPasswordSubtitle =>
      'Enter your email address and we\'ll send you a recovery code.';

  @override
  String get sendRecoveryCode => 'Send Recovery Code';

  @override
  String get resetPasswordTitle => 'Reset Password';

  @override
  String get resetPasswordSubtitle => 'Create a new password for your account.';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get welcomeHome => 'Welcome to Gaza Tech App!';

  @override
  String get homeContent => 'Home Screen Content Goes Here';

  @override
  String get error => 'Error';

  @override
  String get success => 'Success';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get signInCancelled => 'Sign-in cancelled';

  @override
  String get passwordResetSuccess =>
      'Your password has been reset successfully. Please sign in with your new password.';

  @override
  String get required => 'Required';

  @override
  String get invalidEmail => 'Invalid email';

  @override
  String minChars(int count) {
    return 'Min $count chars';
  }

  @override
  String minCharacters(int count) {
    return 'Min $count characters';
  }

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get emailCannotBeEmpty => 'Email cannot be empty.';

  @override
  String get enterValidEmail => 'Please enter a valid email address.';

  @override
  String get passwordCannotBeEmpty => 'Password cannot be empty.';

  @override
  String passwordMinLength(int count) {
    return 'Password must be at least $count characters long.';
  }

  @override
  String get passwordNeedsUppercase =>
      'Password must contain at least one uppercase letter.';

  @override
  String get passwordNeedsLowercase =>
      'Password must contain at least one lowercase letter.';

  @override
  String get passwordNeedsNumber =>
      'Password must contain at least one number.';

  @override
  String get passwordNeedsSpecialChar =>
      'Password must contain at least one special character (@\$!%*?&).';

  @override
  String get uppercaseRequired => 'An uppercase letter is required.';

  @override
  String get lowercaseRequired => 'A lowercase letter is required.';

  @override
  String get numberRequired => 'A number is required.';

  @override
  String get specialCharRequired =>
      'A special character (@\$!%*?&) is required.';

  @override
  String minLengthRequired(int count) {
    return 'Must be at least $count characters long.';
  }

  @override
  String fieldCannotBeEmpty(String fieldName) {
    return '$fieldName cannot be empty.';
  }

  @override
  String fieldMinLength(String fieldName, int count) {
    return '$fieldName must be at least $count characters long.';
  }

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';

  @override
  String get marketplace => 'Marketplace';

  @override
  String get addListing => 'Add Listing';

  @override
  String get community => 'Community';

  @override
  String get marketplaceContent => 'Browse products and services';

  @override
  String get communityContent => 'Connect with others';

  @override
  String get profile => 'Profile';

  @override
  String get about => 'About';

  @override
  String get help => 'Help';

  @override
  String get sign_out => 'Sign out';

  @override
  String get saveDraft => 'Save Draft';

  @override
  String productImagesMax(int count) {
    return 'Product Images (Max $count)';
  }

  @override
  String get productImagesHelper =>
      'Add clear photos of your product. First image will be the cover.';

  @override
  String get productInformation => 'Product Information';

  @override
  String get publishListing => 'Publish Listing';

  @override
  String get titleLabel => 'Title';

  @override
  String get titleHelper => 'Be specific and descriptive';

  @override
  String get titleHint => 'e.g., iPhone 14 Pro Max 256GB Purple';

  @override
  String get categoryLabel => 'Category';

  @override
  String get selectCategory => 'Select category';

  @override
  String get selectCategoryTitle => 'Select Category';

  @override
  String get conditionLabel => 'Condition';

  @override
  String get conditionNew => 'New';

  @override
  String get conditionUsed => 'Used';

  @override
  String get conditionRefurbished => 'Refurbished';

  @override
  String get priceLabel => 'Price';

  @override
  String get priceHelper => 'Set a competitive price to attract buyers';

  @override
  String get priceHint => '0.00';

  @override
  String get currencyILS => '₪ ILS';

  @override
  String get currencyUSD => '\$ USD';

  @override
  String get descriptionLabel => 'Description';

  @override
  String get descriptionHelper => 'Be honest and detailed';

  @override
  String get descriptionHint => 'Describe your product...';

  @override
  String get specificationsLabel => 'Specifications';

  @override
  String get addField => '+ Add Field';

  @override
  String get specificationsHelper =>
      'Add technical details to help buyers make informed decisions';

  @override
  String get specNameHint => 'e.g., Processor';

  @override
  String get specValueHint => 'e.g., Apple A16 Bionic';

  @override
  String get remove => 'Remove';

  @override
  String get locationLabel => 'Location';

  @override
  String get selectLocation => 'Select location';

  @override
  String get selectLocationTitle => 'Select Location';

  @override
  String get addMainImage => 'Add Main Image';

  @override
  String get categoryElectronics => 'Electronics';

  @override
  String get categoryClothing => 'Clothing';

  @override
  String get categoryHomeGarden => 'Home & Garden';

  @override
  String get categoryFood => 'Food';

  @override
  String get categoryServices => 'Services';

  @override
  String get categoryVehicles => 'Vehicles';

  @override
  String get categoryBooks => 'Books';

  @override
  String get categorySports => 'Sports';

  @override
  String get categoryOther => 'Other';

  @override
  String get locationGazaCity => 'Gaza City';

  @override
  String get locationJabalia => 'Jabalia';

  @override
  String get locationAlBureij => 'Al Bureij';

  @override
  String get locationAlNusirat => 'Al Nusirat';

  @override
  String get locationDeirAlBalah => 'Deir Al Balah';

  @override
  String get locationKhanYunis => 'Khan Yunis';
}
