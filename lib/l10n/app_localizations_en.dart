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
  String get noListingsAvailable => 'No listings available';

  @override
  String get categoryAll => 'All';

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
  String get conditionBrandNew => 'Brand New';

  @override
  String get conditionUsedExcellent => 'Used - Excellent';

  @override
  String get conditionUsedGood => 'Used - Good';

  @override
  String get conditionForParts => 'For Parts';

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

  @override
  String get sellerInformation => 'SELLER INFORMATION';

  @override
  String memberSince(String date) {
    return 'Member since $date';
  }

  @override
  String get contactSeller => 'Contact Seller';

  @override
  String get viewProfile => 'View Profile';

  @override
  String get descriptionSectionTitle => 'DESCRIPTION';

  @override
  String get specificationsSectionTitle => 'SPECIFICATIONS';

  @override
  String get similarProducts => 'Similar Products';

  @override
  String moreFromSeller(String sellerName) {
    return 'More from $sellerName';
  }

  @override
  String daysAgo(int count) {
    return '$count days ago';
  }

  @override
  String get weekAgo => '1 week ago';

  @override
  String get retry => 'Retry';

  @override
  String get searchHint => 'Search products...';

  @override
  String get searchPrompt => 'Search for products';

  @override
  String get noResultsFound => 'No results found';

  @override
  String get noResultsSubtitle =>
      'Try different keywords or adjust your filters';

  @override
  String get filters => 'Filters';

  @override
  String get clearAll => 'Clear All';

  @override
  String get applyFilters => 'Apply Filters';

  @override
  String get sortBy => 'Sort By';

  @override
  String get sortNewest => 'Newest';

  @override
  String get sortPriceLowToHigh => 'Price: Low to High';

  @override
  String get sortPriceHighToLow => 'Price: High to Low';

  @override
  String get priceRange => 'Price Range';

  @override
  String get priceRangeUsd => 'Price Range (USD)';

  @override
  String get priceRangeIls => 'Price Range (ILS)';

  @override
  String get priceMin => 'Min';

  @override
  String get priceMax => 'Max';

  @override
  String get conditionFilter => 'Condition';

  @override
  String get searchMarketplace => 'Search marketplace...';

  @override
  String get searchCommunity => 'Search community...';

  @override
  String get createPost => 'Create Post';

  @override
  String get recent => 'Recent';

  @override
  String get questions => 'Questions';

  @override
  String get tips => 'Tips';

  @override
  String get news => 'News';

  @override
  String get troubleshooting => 'Troubleshooting';

  @override
  String hoursAgo(int count) {
    return '$count hours ago';
  }

  @override
  String get dayAgo => '1 day ago';

  @override
  String get question => 'Question';

  @override
  String get newPost => 'New Post';

  @override
  String get postTitle => 'Post Title';

  @override
  String get enterPostTitle => 'Enter post title';

  @override
  String get content => 'Content';

  @override
  String get writeYourPostHere => 'Write your post here...';

  @override
  String get attachments => 'Attachments';

  @override
  String get addImagesOrFiles => 'Add images or files';

  @override
  String get maxFileSize => 'Max 5MB per file';

  @override
  String get publishPost => 'Publish Post';

  @override
  String get postDetails => 'Post Details';

  @override
  String commentsCount(int count) {
    return 'Comments ($count)';
  }

  @override
  String get topSort => 'Top';

  @override
  String get reply => 'Reply';

  @override
  String get loadMoreComments => 'Load More Comments';

  @override
  String get relatedPosts => 'Related Posts';

  @override
  String get addComment => 'Add a comment...';

  @override
  String minutesAgo(int count) {
    return '$count min ago';
  }

  @override
  String get gaming => 'Gaming';

  @override
  String replyingTo(String userName) {
    return 'Replying to @$userName';
  }

  @override
  String get postPublished => 'Post published successfully';

  @override
  String viewReplies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'View $count replies',
      one: 'View 1 reply',
    );
    return '$_temp0';
  }

  @override
  String get hideReplies => 'Hide replies';

  @override
  String get recentSearches => 'Recent searches';

  @override
  String get clearRecentSearches => 'Clear';

  @override
  String get noCommunityResults => 'No posts found';

  @override
  String get noCommunityResultsSubtitle => 'Try different keywords';

  @override
  String get sortPosts => 'Sort Posts';

  @override
  String get timeBased => 'Time-Based';

  @override
  String get popularity => 'Popularity';

  @override
  String get newest => 'Newest';

  @override
  String get oldest => 'Oldest';

  @override
  String get mostLiked => 'Most Liked';

  @override
  String get mostCommented => 'Most Commented';

  @override
  String get resetSort => 'Reset';

  @override
  String get filterPosts => 'Filter Posts';

  @override
  String get categoryFilter => 'Category';

  @override
  String get dateRangeFilter => 'Date Range';

  @override
  String get engagementLevel => 'Engagement Level';

  @override
  String get sortOrder => 'Sort Order';

  @override
  String get today => 'Today';

  @override
  String get thisWeek => 'This Week';

  @override
  String get thisMonth => 'This Month';

  @override
  String get thisYear => 'This Year';

  @override
  String get likes100Plus => '100+ Likes';

  @override
  String get comments50Plus => '50+ Comments';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get bio => 'Bio';

  @override
  String get bioHint => 'Tell others about yourself...';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get whatsappNumber => 'WhatsApp Number';

  @override
  String get socialLinks => 'Social Links';

  @override
  String get facebookLink => 'Facebook';

  @override
  String get instagramLink => 'Instagram';

  @override
  String get twitterLink => 'Twitter / X';

  @override
  String get websiteLink => 'Website';

  @override
  String get changeAvatar => 'Change Photo';

  @override
  String get removeAvatar => 'Remove Photo';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get profileUpdated => 'Profile updated successfully';

  @override
  String get myPosts => 'Posts';

  @override
  String get myListings => 'Listings';

  @override
  String get bookmarks => 'Bookmarks';

  @override
  String get noPostsYet => 'No posts yet';

  @override
  String get noListingsYet => 'No listings yet';

  @override
  String get noBookmarksYet => 'No bookmarks yet';

  @override
  String get personalInfo => 'Personal Info';

  @override
  String get contactInfo => 'Contact Info';

  @override
  String get verified => 'Verified';

  @override
  String get avatarUploadFailed => 'Failed to upload photo';

  @override
  String get contactUnavailable =>
      'Contact information is not available for this seller';

  @override
  String get couldNotOpenLink => 'Could not open this link';

  @override
  String get website => 'Website';

  @override
  String get bookmarkedPosts => 'Posts';

  @override
  String get bookmarkedListings => 'Listings';

  @override
  String get noBookmarkedListingsYet => 'No bookmarked listings yet';

  @override
  String get getVerified => 'Get Verified';

  @override
  String get verificationRequest => 'Verification Request';

  @override
  String get verificationStatusTitle => 'Verification Status';

  @override
  String get verificationPending => 'Verification Pending';

  @override
  String get verificationApproved => 'Verification Approved';

  @override
  String get verificationRejected => 'Verification Rejected';

  @override
  String get verificationExpired => 'Verification Expired';

  @override
  String get verificationSuspicious => 'Under Manual Review';

  @override
  String get stepPersonalInfo => 'Personal Info';

  @override
  String get stepDocuments => 'Documents';

  @override
  String get stepPhoneVerification => 'Phone';

  @override
  String get stepReview => 'Review';

  @override
  String get idFullName => 'Full Name (as on ID)';

  @override
  String get idFullNameHint => 'Enter your full name as it appears on your ID';

  @override
  String get dateOfBirth => 'Date of Birth';

  @override
  String get selectDateOfBirth => 'Select date of birth';

  @override
  String get gender => 'Gender';

  @override
  String get genderMale => 'Male';

  @override
  String get genderFemale => 'Female';

  @override
  String get address => 'Address';

  @override
  String get addressHint => 'Enter your current address';

  @override
  String get nationalIdNumber => 'National ID Number';

  @override
  String get nationalIdNumberHint => 'Enter your national ID number';

  @override
  String get documentType => 'Document Type';

  @override
  String get palestinianId => 'Palestinian ID';

  @override
  String get passport => 'Passport';

  @override
  String get palestinianDrivingLicence => 'Palestinian Driving Licence';

  @override
  String get documentFront => 'Front of Document';

  @override
  String get documentBack => 'Back of Document';

  @override
  String get selfieWithId => 'Selfie with ID';

  @override
  String get tapToUploadPhoto => 'Tap to upload photo';

  @override
  String get changePhoto => 'Change photo';

  @override
  String get gallery => 'Gallery';

  @override
  String get camera => 'Camera';

  @override
  String get phoneVerification => 'Phone Verification';

  @override
  String get enterPhoneNumber => 'Phone Number';

  @override
  String get phoneNumberHint => '+970xxxxxxxxx';

  @override
  String get sendOtp => 'Send OTP';

  @override
  String get verifyPhone => 'Verify';

  @override
  String get phoneVerifiedSuccess => 'Phone verified successfully';

  @override
  String get pleaseVerifyPhone => 'Please verify your phone number to continue';

  @override
  String get otpSentToPhone => 'A verification code was sent to your phone';

  @override
  String get reviewYourData => 'Review Your Data';

  @override
  String get reviewPersonalInfo => 'Personal Information';

  @override
  String get reviewDocuments => 'Uploaded Documents';

  @override
  String get reviewPhone => 'Phone Verification';

  @override
  String get submitVerification => 'Submit Verification Request';

  @override
  String get submittingVerification => 'Submitting...';

  @override
  String get verificationSubmitted =>
      'Verification request submitted successfully';

  @override
  String get verificationUnderReview =>
      'Your request is under review. You will be notified once it is processed.';

  @override
  String get rejectionReason => 'Rejection Reason';

  @override
  String get resubmitVerification => 'Resubmit Verification';

  @override
  String submittedOn(String date) {
    return 'Submitted on $date';
  }

  @override
  String reviewedOn(String date) {
    return 'Reviewed on $date';
  }

  @override
  String get back => 'Back';

  @override
  String get next => 'Next';

  @override
  String get pleaseSelectGender => 'Please select a gender';

  @override
  String get pleaseSelectDocumentType => 'Please select a document type';

  @override
  String get pleaseUploadAllDocuments => 'Please upload all required documents';

  @override
  String get pleaseFillDateOfBirth => 'Please select your date of birth';

  @override
  String get timelineSubmitted => 'Submitted';

  @override
  String get timelineUnderReview => 'Under Review';

  @override
  String get timelineDecision => 'Decision';

  @override
  String get editListing => 'Edit Listing';

  @override
  String get updateListing => 'Update Listing';

  @override
  String get listingUpdated => 'Listing updated successfully';

  @override
  String get deleteListing => 'Delete Listing';

  @override
  String get deleteListingConfirmTitle => 'Delete Listing?';

  @override
  String get deleteListingConfirmBody =>
      'Are you sure you want to delete this listing? This action cannot be undone.';

  @override
  String get listingDeleted => 'Listing deleted successfully';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get editPost => 'Edit Post';

  @override
  String get updatePost => 'Update Post';

  @override
  String get postUpdated => 'Post updated successfully';

  @override
  String get deletePost => 'Delete Post';

  @override
  String get deletePostConfirmTitle => 'Delete Post?';

  @override
  String get deletePostConfirmBody =>
      'Are you sure you want to delete this post? This action cannot be undone.';

  @override
  String get postDeleted => 'Post deleted successfully';
}
