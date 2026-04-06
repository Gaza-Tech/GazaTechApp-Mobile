// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تطبيق غزة تك';

  @override
  String get welcomeBack => 'مرحباً بعودتك';

  @override
  String get signInSubtitle => 'سجّل الدخول للمتابعة إلى غزة تك';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get createAccountSubtitle => 'انضم إلينا للبدء!';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get emailHint => 'أدخل بريدك الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get passwordHint => 'أدخل كلمة المرور';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get confirmPasswordHint => 'أعد إدخال كلمة المرور';

  @override
  String get newPassword => 'كلمة المرور الجديدة';

  @override
  String get newPasswordHint => 'أدخل كلمة المرور الجديدة';

  @override
  String get confirmNewPasswordHint => 'أعد إدخال كلمة المرور الجديدة';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get firstNameHint => 'أدخل اسمك الأول';

  @override
  String get lastName => 'اسم العائلة';

  @override
  String get lastNameHint => 'أدخل اسم عائلتك';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get forgotPasswordLink => 'نسيت كلمة المرور؟';

  @override
  String get or => 'أو';

  @override
  String get continueWithGoogle => 'المتابعة مع جوجل';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟ ';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل؟ ';

  @override
  String get agreeToTermsPrefix => 'أوافق على ';

  @override
  String get termsAndConditions => 'الشروط والأحكام';

  @override
  String get and => ' و ';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get verifyYourEmail => 'تأكيد بريدك الإلكتروني';

  @override
  String get otpSentTo => 'تم إرسال رمز مكون من 6 أرقام إلى';

  @override
  String get recoverySentTo => 'تم إرسال رمز الاسترداد إلى';

  @override
  String get enterConfirmationCode => 'أدخل رمز التأكيد';

  @override
  String get enterRecoveryCode => 'أدخل رمز الاسترداد';

  @override
  String get verify => 'تأكيد';

  @override
  String get didntReceiveCode => 'لم تستلم الرمز؟ ';

  @override
  String get resendCode => 'إعادة إرسال الرمز';

  @override
  String get resendingCode => 'جارٍ إعادة إرسال الرمز...';

  @override
  String get forgotPasswordTitle => 'نسيت كلمة المرور';

  @override
  String get forgotPasswordSubtitle =>
      'أدخل بريدك الإلكتروني وسنرسل لك رمز الاسترداد.';

  @override
  String get sendRecoveryCode => 'إرسال رمز الاسترداد';

  @override
  String get resetPasswordTitle => 'إعادة تعيين كلمة المرور';

  @override
  String get resetPasswordSubtitle => 'أنشئ كلمة مرور جديدة لحسابك.';

  @override
  String get resetPassword => 'إعادة تعيين كلمة المرور';

  @override
  String get welcomeHome => 'مرحباً بك في تطبيق غزة تك!';

  @override
  String get homeContent => 'محتوى الشاشة الرئيسية هنا';

  @override
  String get error => 'خطأ';

  @override
  String get success => 'نجاح';

  @override
  String get ok => 'حسناً';

  @override
  String get cancel => 'إلغاء';

  @override
  String get signInCancelled => 'تم إلغاء تسجيل الدخول';

  @override
  String get passwordResetSuccess =>
      'تم إعادة تعيين كلمة المرور بنجاح. يرجى تسجيل الدخول بكلمة المرور الجديدة.';

  @override
  String get required => 'مطلوب';

  @override
  String get invalidEmail => 'بريد إلكتروني غير صالح';

  @override
  String minChars(int count) {
    return 'الحد الأدنى $count أحرف';
  }

  @override
  String minCharacters(int count) {
    return 'الحد الأدنى $count أحرف';
  }

  @override
  String get passwordsDoNotMatch => 'كلمات المرور غير متطابقة';

  @override
  String get emailCannotBeEmpty => 'البريد الإلكتروني لا يمكن أن يكون فارغاً.';

  @override
  String get enterValidEmail => 'يرجى إدخال عنوان بريد إلكتروني صالح.';

  @override
  String get passwordCannotBeEmpty => 'كلمة المرور لا يمكن أن تكون فارغة.';

  @override
  String passwordMinLength(int count) {
    return 'يجب أن تتكون كلمة المرور من $count أحرف على الأقل.';
  }

  @override
  String get passwordNeedsUppercase =>
      'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل.';

  @override
  String get passwordNeedsLowercase =>
      'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل.';

  @override
  String get passwordNeedsNumber =>
      'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل.';

  @override
  String get passwordNeedsSpecialChar =>
      'يجب أن تحتوي كلمة المرور على رمز خاص واحد على الأقل (@\$!%*?&).';

  @override
  String get uppercaseRequired => 'حرف كبير مطلوب.';

  @override
  String get lowercaseRequired => 'حرف صغير مطلوب.';

  @override
  String get numberRequired => 'رقم مطلوب.';

  @override
  String get specialCharRequired => 'رمز خاص (@\$!%*?&) مطلوب.';

  @override
  String minLengthRequired(int count) {
    return 'يجب أن يكون $count أحرف على الأقل.';
  }

  @override
  String fieldCannotBeEmpty(String fieldName) {
    return '$fieldName لا يمكن أن يكون فارغاً.';
  }

  @override
  String fieldMinLength(String fieldName, int count) {
    return 'يجب أن يتكون $fieldName من $count أحرف على الأقل.';
  }

  @override
  String get settings => 'الإعدادات';

  @override
  String get language => 'اللغة';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';

  @override
  String get marketplace => 'السوق';

  @override
  String get addListing => 'إضافة إعلان';

  @override
  String get community => 'المجتمع';

  @override
  String get marketplaceContent => 'تصفح المنتجات والخدمات';

  @override
  String get communityContent => 'تواصل مع الآخرين';

  @override
  String get noListingsAvailable => 'لا توجد إعلانات متاحة';

  @override
  String get categoryAll => 'الكل';

  @override
  String get categoryElectronics => 'إلكترونيات';

  @override
  String get categoryClothing => 'ملابس';

  @override
  String get categoryHomeGarden => 'المنزل والحديقة';

  @override
  String get categoryFood => 'طعام';

  @override
  String get categoryServices => 'خدمات';

  @override
  String get categoryVehicles => 'مركبات';

  @override
  String get categoryBooks => 'كتب';

  @override
  String get categorySports => 'رياضة';

  @override
  String get categoryOther => 'أخرى';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get about => 'حول';

  @override
  String get help => 'المساعدة';

  @override
  String get sign_out => 'تسجيل الخروج';

  @override
  String get saveDraft => 'حفظ المسودة';

  @override
  String productImagesMax(int count) {
    return 'صور المنتج (الحد الأقصى $count)';
  }

  @override
  String get productImagesHelper =>
      'أضف صوراً واضحة لمنتجك. الصورة الأولى ستكون صورة الغلاف.';

  @override
  String get productInformation => 'معلومات المنتج';

  @override
  String get publishListing => 'نشر الإعلان';

  @override
  String get titleLabel => 'العنوان';

  @override
  String get titleHelper => 'كن محدداً ووصفياً';

  @override
  String get titleHint => 'مثال: آيفون 14 برو ماكس 256 جيجابايت بنفسجي';

  @override
  String get categoryLabel => 'الفئة';

  @override
  String get selectCategory => 'اختر الفئة';

  @override
  String get selectCategoryTitle => 'اختر الفئة';

  @override
  String get conditionLabel => 'الحالة';

  @override
  String get conditionBrandNew => 'جديد تماماً';

  @override
  String get conditionUsedExcellent => 'مستعمل - ممتاز';

  @override
  String get conditionUsedGood => 'مستعمل - جيد';

  @override
  String get conditionForParts => 'للقطع';

  @override
  String get priceLabel => 'السعر';

  @override
  String get priceHelper => 'حدد سعراً تنافسياً لجذب المشترين';

  @override
  String get priceHint => '0.00';

  @override
  String get currencyILS => '₪ شيكل';

  @override
  String get currencyUSD => '\$ دولار';

  @override
  String get descriptionLabel => 'الوصف';

  @override
  String get descriptionHelper => 'كن صادقاً ومفصلاً';

  @override
  String get descriptionHint => 'صف منتجك...';

  @override
  String get specificationsLabel => 'المواصفات';

  @override
  String get addField => '+ إضافة حقل';

  @override
  String get specificationsHelper =>
      'أضف تفاصيل تقنية لمساعدة المشترين على اتخاذ قرارات مدروسة';

  @override
  String get specNameHint => 'مثال: المعالج';

  @override
  String get specValueHint => 'مثال: Apple A16 Bionic';

  @override
  String get remove => 'حذف';

  @override
  String get locationLabel => 'الموقع';

  @override
  String get selectLocation => 'اختر الموقع';

  @override
  String get selectLocationTitle => 'اختر الموقع';

  @override
  String get addMainImage => 'إضافة صورة رئيسية';

  @override
  String get locationGazaCity => 'مدينة غزة';

  @override
  String get locationJabalia => 'جباليا';

  @override
  String get locationAlBureij => 'البريج';

  @override
  String get locationAlNusirat => 'النصيرات';

  @override
  String get locationDeirAlBalah => 'دير البلح';

  @override
  String get locationKhanYunis => 'خان يونس';

  @override
  String get sellerInformation => 'معلومات البائع';

  @override
  String memberSince(String date) {
    return 'عضو منذ $date';
  }

  @override
  String get contactSeller => 'تواصل مع البائع';

  @override
  String get viewProfile => 'عرض الملف الشخصي';

  @override
  String get descriptionSectionTitle => 'الوصف';

  @override
  String get specificationsSectionTitle => 'المواصفات';

  @override
  String get similarProducts => 'منتجات مشابهة';

  @override
  String moreFromSeller(String sellerName) {
    return 'المزيد من $sellerName';
  }

  @override
  String daysAgo(int count) {
    return 'منذ $count أيام';
  }

  @override
  String get weekAgo => 'منذ أسبوع';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get searchHint => 'ابحث عن منتجات...';

  @override
  String get searchPrompt => 'ابحث عن منتجات';

  @override
  String get noResultsFound => 'لا توجد نتائج';

  @override
  String get noResultsSubtitle => 'جرّب كلمات مختلفة أو عدّل الفلاتر';

  @override
  String get filters => 'الفلاتر';

  @override
  String get clearAll => 'مسح الكل';

  @override
  String get applyFilters => 'تطبيق الفلاتر';

  @override
  String get sortBy => 'ترتيب حسب';

  @override
  String get sortNewest => 'الأحدث';

  @override
  String get sortPriceLowToHigh => 'السعر: من الأقل للأعلى';

  @override
  String get sortPriceHighToLow => 'السعر: من الأعلى للأقل';

  @override
  String get priceRange => 'نطاق السعر';

  @override
  String get priceRangeUsd => 'نطاق السعر (دولار)';

  @override
  String get priceRangeIls => 'نطاق السعر (شيكل)';

  @override
  String get priceMin => 'الحد الأدنى';

  @override
  String get priceMax => 'الحد الأقصى';

  @override
  String get conditionFilter => 'الحالة';

  @override
  String get searchMarketplace => 'ابحث في السوق...';

  @override
  String get searchCommunity => 'ابحث في المجتمع...';

  @override
  String get createPost => 'إنشاء منشور';

  @override
  String get recent => 'الأحدث';

  @override
  String get questions => 'أسئلة';

  @override
  String get tips => 'نصائح';

  @override
  String get news => 'أخبار';

  @override
  String get troubleshooting => 'حلول المشاكل';

  @override
  String hoursAgo(int count) {
    return 'منذ $count ساعات';
  }

  @override
  String get dayAgo => 'منذ يوم';

  @override
  String get question => 'سؤال';

  @override
  String get newPost => 'منشور جديد';

  @override
  String get postTitle => 'عنوان المنشور';

  @override
  String get enterPostTitle => 'أدخل عنوان المنشور';

  @override
  String get content => 'المحتوى';

  @override
  String get writeYourPostHere => 'اكتب منشورك هنا...';

  @override
  String get attachments => 'المرفقات';

  @override
  String get addImagesOrFiles => 'أضف صوراً أو ملفات';

  @override
  String get maxFileSize => 'الحد الأقصى 5 ميجابايت لكل ملف';

  @override
  String get publishPost => 'نشر المنشور';

  @override
  String get postDetails => 'تفاصيل المنشور';

  @override
  String commentsCount(int count) {
    return 'التعليقات ($count)';
  }

  @override
  String get topSort => 'الأعلى';

  @override
  String get reply => 'رد';

  @override
  String get loadMoreComments => 'تحميل المزيد من التعليقات';

  @override
  String get relatedPosts => 'منشورات ذات صلة';

  @override
  String get addComment => 'أضف تعليقاً...';

  @override
  String minutesAgo(int count) {
    return 'منذ $count دقيقة';
  }

  @override
  String get gaming => 'ألعاب';

  @override
  String replyingTo(String userName) {
    return 'ردّاً على @$userName';
  }

  @override
  String get postPublished => 'تم نشر المنشور بنجاح';

  @override
  String viewReplies(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'عرض $count ردّ',
      few: 'عرض $count ردود',
      two: 'عرض ردّين',
      one: 'عرض رد واحد',
    );
    return '$_temp0';
  }

  @override
  String get hideReplies => 'إخفاء الردود';

  @override
  String get recentSearches => 'عمليات بحث سابقة';

  @override
  String get clearRecentSearches => 'مسح';

  @override
  String get noCommunityResults => 'لم يتم العثور على منشورات';

  @override
  String get noCommunityResultsSubtitle => 'جرّب كلمات مختلفة';

  @override
  String get sortPosts => 'ترتيب المنشورات';

  @override
  String get timeBased => 'حسب الوقت';

  @override
  String get popularity => 'حسب الشعبية';

  @override
  String get newest => 'الأحدث';

  @override
  String get oldest => 'الأقدم';

  @override
  String get mostLiked => 'الأكثر إعجاباً';

  @override
  String get mostCommented => 'الأكثر تعليقاً';

  @override
  String get resetSort => 'إعادة تعيين';

  @override
  String get filterPosts => 'تصفية المنشورات';

  @override
  String get categoryFilter => 'التصنيف';

  @override
  String get dateRangeFilter => 'النطاق الزمني';

  @override
  String get engagementLevel => 'مستوى التفاعل';

  @override
  String get sortOrder => 'ترتيب العرض';

  @override
  String get today => 'اليوم';

  @override
  String get thisWeek => 'هذا الأسبوع';

  @override
  String get thisMonth => 'هذا الشهر';

  @override
  String get thisYear => 'هذه السنة';

  @override
  String get likes100Plus => '+100 إعجاب';

  @override
  String get comments50Plus => '+50 تعليق';

  @override
  String get editProfile => 'تعديل الملف الشخصي';

  @override
  String get bio => 'نبذة عني';

  @override
  String get bioHint => 'أخبر الآخرين عن نفسك...';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get whatsappNumber => 'رقم واتساب';

  @override
  String get socialLinks => 'روابط التواصل';

  @override
  String get facebookLink => 'فيسبوك';

  @override
  String get instagramLink => 'إنستغرام';

  @override
  String get twitterLink => 'تويتر / X';

  @override
  String get websiteLink => 'الموقع الإلكتروني';

  @override
  String get changeAvatar => 'تغيير الصورة';

  @override
  String get removeAvatar => 'حذف الصورة';

  @override
  String get saveChanges => 'حفظ التغييرات';

  @override
  String get profileUpdated => 'تم تحديث الملف الشخصي بنجاح';

  @override
  String get myPosts => 'المنشورات';

  @override
  String get myListings => 'إعلاناتي';

  @override
  String get bookmarks => 'المحفوظات';

  @override
  String get noPostsYet => 'لا توجد منشورات بعد';

  @override
  String get noListingsYet => 'لا توجد إعلانات بعد';

  @override
  String get noBookmarksYet => 'لا توجد محفوظات بعد';

  @override
  String get personalInfo => 'المعلومات الشخصية';

  @override
  String get contactInfo => 'معلومات التواصل';

  @override
  String get verified => 'موثق';

  @override
  String get avatarUploadFailed => 'فشل رفع الصورة';

  @override
  String get contactUnavailable => 'معلومات التواصل غير متوفرة لهذا البائع';

  @override
  String get couldNotOpenLink => 'تعذر فتح هذا الرابط';

  @override
  String get website => 'الموقع';

  @override
  String get bookmarkedPosts => 'المنشورات';

  @override
  String get bookmarkedListings => 'الإعلانات';

  @override
  String get noBookmarkedListingsYet => 'لا توجد إعلانات محفوظة بعد';

  @override
  String get getVerified => 'توثيق الحساب';

  @override
  String get verificationRequest => 'طلب التوثيق';

  @override
  String get verificationStatusTitle => 'حالة التوثيق';

  @override
  String get verificationPending => 'التوثيق قيد المراجعة';

  @override
  String get verificationApproved => 'تم التوثيق';

  @override
  String get verificationRejected => 'تم رفض التوثيق';

  @override
  String get verificationExpired => 'انتهت صلاحية التوثيق';

  @override
  String get verificationSuspicious => 'قيد المراجعة اليدوية';

  @override
  String get stepPersonalInfo => 'المعلومات الشخصية';

  @override
  String get stepDocuments => 'المستندات';

  @override
  String get stepPhoneVerification => 'الهاتف';

  @override
  String get stepReview => 'مراجعة';

  @override
  String get idFullName => 'الاسم الكامل (كما في الهوية)';

  @override
  String get idFullNameHint => 'أدخل اسمك الكامل كما يظهر في هويتك';

  @override
  String get dateOfBirth => 'تاريخ الميلاد';

  @override
  String get selectDateOfBirth => 'اختر تاريخ الميلاد';

  @override
  String get gender => 'الجنس';

  @override
  String get genderMale => 'ذكر';

  @override
  String get genderFemale => 'أنثى';

  @override
  String get address => 'العنوان';

  @override
  String get addressHint => 'أدخل عنوانك الحالي';

  @override
  String get nationalIdNumber => 'رقم الهوية الوطنية';

  @override
  String get nationalIdNumberHint => 'أدخل رقم هويتك الوطنية';

  @override
  String get documentType => 'نوع المستند';

  @override
  String get palestinianId => 'هوية فلسطينية';

  @override
  String get passport => 'جواز سفر';

  @override
  String get palestinianDrivingLicence => 'رخصة قيادة فلسطينية';

  @override
  String get documentFront => 'الوجه الأمامي للمستند';

  @override
  String get documentBack => 'الوجه الخلفي للمستند';

  @override
  String get selfieWithId => 'صورة شخصية مع الهوية';

  @override
  String get tapToUploadPhoto => 'انقر لرفع صورة';

  @override
  String get changePhoto => 'تغيير الصورة';

  @override
  String get gallery => 'معرض الصور';

  @override
  String get camera => 'الكاميرا';

  @override
  String get phoneVerification => 'توثيق رقم الهاتف';

  @override
  String get enterPhoneNumber => 'رقم الهاتف';

  @override
  String get phoneNumberHint => '+970xxxxxxxxx';

  @override
  String get sendOtp => 'إرسال رمز التحقق';

  @override
  String get verifyPhone => 'تحقق';

  @override
  String get phoneVerifiedSuccess => 'تم التحقق من رقم الهاتف بنجاح';

  @override
  String get pleaseVerifyPhone => 'يرجى التحقق من رقم هاتفك للمتابعة';

  @override
  String get otpSentToPhone => 'تم إرسال رمز التحقق إلى هاتفك';

  @override
  String get reviewYourData => 'مراجعة بياناتك';

  @override
  String get reviewPersonalInfo => 'المعلومات الشخصية';

  @override
  String get reviewDocuments => 'المستندات المرفوعة';

  @override
  String get reviewPhone => 'التحقق من الهاتف';

  @override
  String get submitVerification => 'إرسال طلب التوثيق';

  @override
  String get submittingVerification => 'جارٍ الإرسال...';

  @override
  String get verificationSubmitted => 'تم إرسال طلب التوثيق بنجاح';

  @override
  String get verificationUnderReview =>
      'طلبك قيد المراجعة. سنقوم بإعلامك فور معالجته.';

  @override
  String get rejectionReason => 'سبب الرفض';

  @override
  String get resubmitVerification => 'إعادة تقديم طلب التوثيق';

  @override
  String submittedOn(String date) {
    return 'تم الإرسال في $date';
  }

  @override
  String reviewedOn(String date) {
    return 'تمت المراجعة في $date';
  }

  @override
  String get back => 'رجوع';

  @override
  String get next => 'التالي';

  @override
  String get pleaseSelectGender => 'يرجى اختيار الجنس';

  @override
  String get pleaseSelectDocumentType => 'يرجى اختيار نوع المستند';

  @override
  String get pleaseUploadAllDocuments => 'يرجى رفع جميع المستندات المطلوبة';

  @override
  String get pleaseFillDateOfBirth => 'يرجى اختيار تاريخ ميلادك';

  @override
  String get timelineSubmitted => 'تم الإرسال';

  @override
  String get timelineUnderReview => 'قيد المراجعة';

  @override
  String get timelineDecision => 'القرار';

  @override
  String get editListing => 'تعديل الإعلان';

  @override
  String get updateListing => 'تحديث الإعلان';

  @override
  String get listingUpdated => 'تم تحديث الإعلان بنجاح';

  @override
  String get deleteListing => 'حذف الإعلان';

  @override
  String get deleteListingConfirmTitle => 'حذف الإعلان؟';

  @override
  String get deleteListingConfirmBody =>
      'هل أنت متأكد من حذف هذا الإعلان؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get listingDeleted => 'تم حذف الإعلان بنجاح';

  @override
  String get delete => 'حذف';

  @override
  String get edit => 'تعديل';

  @override
  String get editPost => 'تعديل المنشور';

  @override
  String get updatePost => 'تحديث المنشور';

  @override
  String get postUpdated => 'تم تحديث المنشور بنجاح';

  @override
  String get deletePost => 'حذف المنشور';

  @override
  String get deletePostConfirmTitle => 'حذف المنشور؟';

  @override
  String get deletePostConfirmBody =>
      'هل أنت متأكد من حذف هذا المنشور؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get postDeleted => 'تم حذف المنشور بنجاح';

  @override
  String get reportListing => 'الإبلاغ عن الإعلان';

  @override
  String get reportPost => 'الإبلاغ عن المنشور';

  @override
  String get reportUser => 'الإبلاغ عن المستخدم';

  @override
  String get reportComment => 'الإبلاغ عن التعليق';

  @override
  String get reportSubtitle => 'لماذا تريد الإبلاغ عن هذا؟';

  @override
  String get reportReasonSpam => 'محتوى مزعج';

  @override
  String get reportReasonInappropriateContent => 'محتوى غير لائق';

  @override
  String get reportReasonHarassment => 'تحرش';

  @override
  String get reportReasonMisleading => 'مضلل';

  @override
  String get reportReasonFraudScam => 'احتيال';

  @override
  String get reportReasonHateSpeech => 'خطاب كراهية';

  @override
  String get reportReasonOther => 'أخرى';

  @override
  String get reportDescriptionHint => 'أضف المزيد من التفاصيل (اختياري)';

  @override
  String get reportSubmit => 'إرسال البلاغ';

  @override
  String get reportSuccess => 'تم إرسال البلاغ بنجاح. سنراجعه قريباً.';

  @override
  String get reportFailure => 'فشل إرسال البلاغ. يرجى المحاولة مرة أخرى.';

  @override
  String get reportAlreadySubmitted => 'لقد أبلغت عن هذا مسبقاً. نحن نراجعه.';

  @override
  String get aiChat => 'المساعد الذكي';

  @override
  String get aiChatHint => 'اسأل عن المنتجات...';

  @override
  String get aiChatEmptyTitle => 'مساعد السوق الذكي';

  @override
  String get aiChatEmptySubtitle => 'اسألني أي شيء عن المنتجات في السوق';

  @override
  String get clearChat => 'مسح المحادثة';

  @override
  String get clearChatConfirm => 'هل أنت متأكد أنك تريد مسح كل سجل المحادثة؟';

  @override
  String get aiChatError => 'حدث خطأ ما. يرجى المحاولة مرة أخرى.';
}
