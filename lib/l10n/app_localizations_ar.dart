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
  String get continueAsGuest => 'المتابعة كضيف';

  @override
  String get signUpPromptTitle => 'أنشئ حسابًا';

  @override
  String get signUpPromptMessage =>
      'أنشئ حسابًا لاستخدام هذه الميزة والحصول على التجربة الكاملة.';

  @override
  String get signUpPromptSignUp => 'إنشاء حساب';

  @override
  String get signUpPromptSignIn => 'لدي حساب بالفعل';

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
  String get unknownError => 'خطأ غير معروف';

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
  String get signOutConfirmTitle => 'تسجيل الخروج؟';

  @override
  String get signOutConfirmBody =>
      'ستحتاج إلى تسجيل الدخول مرة أخرى للوصول إلى حسابك.';

  @override
  String get signOutConfirmButton => 'تسجيل الخروج';

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
  String get addPhoto => 'إضافة صورة';

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
  String imageLimitReached(int max) {
    return 'يمكنك إرفاق حتى $max صور';
  }

  @override
  String get uploadingImages => 'جارٍ رفع الصور...';

  @override
  String get imageUploadFailed => 'فشل رفع الصور';

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
  String get draftSaved => 'تم حفظ المسودة';

  @override
  String get myDrafts => 'المسودات';

  @override
  String get draft => 'مسودة';

  @override
  String get noDraftsYet => 'لا توجد مسودات بعد';

  @override
  String get draftPosts => 'المنشورات';

  @override
  String get draftListings => 'الإعلانات';

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

  @override
  String get aiChatStopped => '(تم الإيقاف)';

  @override
  String get editComment => 'تعديل التعليق';

  @override
  String get deleteComment => 'حذف التعليق';

  @override
  String get deleteCommentConfirmTitle => 'حذف التعليق؟';

  @override
  String get deleteCommentConfirmBody =>
      'هل أنت متأكد من حذف هذا التعليق؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get commentDeleted => 'تم حذف التعليق بنجاح';

  @override
  String get commentUpdated => 'تم تحديث التعليق بنجاح';

  @override
  String get editingComment => 'تعديل التعليق';

  @override
  String get edited => '(معدّل)';

  @override
  String get saveEdit => 'حفظ التعديل';

  @override
  String get publish => 'نشر';

  @override
  String get publishConfirmTitle => 'نشر؟';

  @override
  String get publishConfirmBody => 'ستتم نشر هذه المسودة وستكون مرئية للجميع.';

  @override
  String get published => 'تم النشر بنجاح';

  @override
  String get notificationPreferences => 'تفضيلات الإشعارات';

  @override
  String get notifyNewComments => 'تعليقات جديدة على منشوراتي';

  @override
  String get notifyNewLikes => 'إعجابات على محتواي';

  @override
  String get notifyListingInquiries => 'استفسارات على قوائمي';

  @override
  String get notifyVerificationUpdates => 'تحديثات حالة التحقق';

  @override
  String get accountSettings => 'الحساب';

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get deleteAccount => 'حذف الحساب';

  @override
  String get deleteAccountTitle => 'حذف الحساب؟';

  @override
  String get deleteAccountBody =>
      'سيؤدي هذا إلى إلغاء تنشيط حسابك بشكل دائم. ستتم إزالة إعلاناتك وسيظهر اسمك كـ\"حساب محذوف\" في كل مكان. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get deleteAccountConfirmButton => 'حذف حسابي';

  @override
  String get deleteAccountTypeToConfirm => 'اكتب حذف للتأكيد';

  @override
  String get deleteConfirmWord => 'حذف';

  @override
  String get deletedUser => 'حساب محذوف';

  @override
  String get deletedAccountProfile => 'تم حذف هذا الحساب.';

  @override
  String get faq => 'الأسئلة الشائعة';

  @override
  String get helpFaqBuyingTitle => 'كيف أشتري شيئًا؟';

  @override
  String get helpFaqBuyingBody =>
      'تصفح السوق، ابحث عن قائمة تعجبك، وتواصل مع البائع مباشرة من خلال ملفه الشخصي.';

  @override
  String get helpFaqSellingTitle => 'كيف أبيع شيئًا؟';

  @override
  String get helpFaqSellingBody =>
      'اضغط على زر + لإنشاء قائمة. أدخل التفاصيل، أضف صورًا، حدد سعرًا، وانشر.';

  @override
  String get helpFaqVerificationTitle => 'كيف أحصل على التحقق؟';

  @override
  String get helpFaqVerificationBody =>
      'انتقل إلى ملفك الشخصي واضغط على \'احصل على التحقق\'. أكمل نموذج التحقق من الهوية باستخدام وثائق هويتك.';

  @override
  String get helpFaqPostingTitle => 'كيف أنشر في المجتمع؟';

  @override
  String get helpFaqPostingBody =>
      'انتقل إلى تبويب المجتمع واضغط على زر الكتابة. اختر فئة، اكتب منشورك، وانشر.';

  @override
  String get communityGuidelines => 'إرشادات المجتمع';

  @override
  String get helpGuidelinesBody =>
      'كن محترمًا ولطيفًا. لا للرسائل المزعجة أو التحرش أو المحتوى غير اللائق. أبلغ عن الانتهاكات للمساعدة في الحفاظ على سلامة مجتمعنا.';

  @override
  String get contactSupport => 'تواصل مع الدعم';

  @override
  String get helpContactDescription =>
      'تواجه مشكلة؟ تواصل مع فريق الدعم لدينا.';

  @override
  String get emailSupport => 'الدعم عبر البريد الإلكتروني';

  @override
  String get reportBug => 'الإبلاغ عن خطأ';

  @override
  String get appVersion => 'إصدار التطبيق';

  @override
  String get aboutDescription =>
      'غزة تك منصة تربط أبناء غزة للشراء والبيع والتفاعل مع مجتمعهم.';

  @override
  String get ourMission => 'مهمتنا';

  @override
  String get missionDescription =>
      'تمكين مجتمع غزة من خلال التكنولوجيا — تمكين التجارة ومشاركة المعرفة والتواصل المحلي.';

  @override
  String get shareApp => 'مشاركة التطبيق';

  @override
  String get rateApp => 'تقييم التطبيق';

  @override
  String get openSourceLicenses => 'تراخيص المصدر المفتوح';

  @override
  String get termsOfService => 'شروط الخدمة';

  @override
  String get madeWithLove => 'صُنع بكل محبة لغزة';

  @override
  String get signUpEmailBanned =>
      'هذا البريد الإلكتروني مرتبط بحساب محظور أو معطّل ولا يمكن استخدامه للتسجيل.';

  @override
  String get signUpEmailTaken =>
      'هذا البريد الإلكتروني مستخدم بالفعل. يرجى تسجيل الدخول أو استخدام بريد إلكتروني آخر.';

  @override
  String get signInAccountBanned =>
      'تم حظر هذا الحساب أو تعطيله. لا يمكنك تسجيل الدخول.';

  @override
  String get termsTitle => 'الشروط والأحكام';

  @override
  String get termsLastUpdated => 'آخر تحديث: أبريل 2026';

  @override
  String get termsIntro =>
      'مرحباً بك في تطبيق غزة تك. بإنشاء حساب أو استخدام خدماتنا، فإنك توافق على الالتزام بهذه الشروط والأحكام. يرجى قراءتها بعناية قبل استخدام التطبيق.';

  @override
  String get termsAccountTitle => '1. تسجيل الحساب';

  @override
  String get termsAccountBody =>
      'يجب عليك تقديم معلومات دقيقة وكاملة عند إنشاء حساب. أنت مسؤول عن الحفاظ على سرية بيانات تسجيل الدخول الخاصة بك وعن جميع الأنشطة التي تتم من خلال حسابك. يجب أن يكون عمرك 15 عاماً على الأقل لاستخدام هذا التطبيق. يحتفظ تطبيق غزة تك بالحق في تعليق أو إنهاء الحسابات التي تنتهك هذه الشروط.';

  @override
  String get termsMarketplaceTitle => '2. السوق';

  @override
  String get termsMarketplaceBody =>
      'يوفر تطبيق غزة تك منصة للمستخدمين لعرض واكتشاف المنتجات. نحن لا نشارك في أي معاملات بين البائعين والمشترين ولا نضمنها. جميع المعاملات تتم على مسؤولية الأطراف المعنية فقط. يجب على المستخدمين إدراج المنتجات بدقة وأمانة. يُمنع منعاً باتاً إدراج المنتجات غير القانونية أو المقلدة أو المسروقة أو المحظورة.';

  @override
  String get termsCommunityTitle => '3. المجتمع';

  @override
  String get termsCommunityBody =>
      'يمكن للمستخدمين نشر محتوى وتعليقات والمشاركة في النقاشات المجتمعية. تحتفظ بملكية المحتوى الخاص بك ولكنك تمنح تطبيق غزة تك ترخيصاً غير حصري لعرضه داخل المنصة. توافق على عدم نشر محتوى مسيء أو ضار أو مضلل أو يشوه السمعة أو ينتهك أي قوانين معمول بها. يحتفظ تطبيق غزة تك بالحق في إزالة أي محتوى ينتهك هذه الإرشادات.';

  @override
  String get termsContentTitle => '4. محتوى المستخدم والسلوك';

  @override
  String get termsContentBody =>
      'أنت المسؤول الوحيد عن كل المحتوى الذي تنشئه أو ترفعه أو تشاركه على المنصة. يجب ألا تنتحل شخصية الآخرين أو ترسل رسائل مزعجة أو تضايق مستخدمين آخرين أو تشارك في أي نشاط احتيالي. يحق لتطبيق غزة تك الإشراف على المحتوى أو الحسابات أو إزالتها أو تقييدها وفقاً لتقديره للحفاظ على بيئة آمنة ومحترمة.';

  @override
  String get termsVerificationTitle => '5. التحقق من الهوية';

  @override
  String get termsVerificationBody =>
      'قد تتطلب بعض الميزات التحقق من الهوية. بتقديم مستندات التحقق (مثل بطاقة الهوية الوطنية)، فإنك تؤكد أن المستندات أصلية وتخصك. تتم معالجة مستندات التحقق بشكل آمن وفقاً لسياسة الخصوصية الخاصة بنا.';

  @override
  String get termsIntellectualTitle => '6. الملكية الفكرية';

  @override
  String get termsIntellectualBody =>
      'اسم تطبيق غزة تك وشعاره وتصميمه وجميع التقنيات الأساسية هي ملكية فكرية لتطبيق غزة تك. لا يجوز لك نسخ أو تعديل أو توزيع أو عكس هندسة أي جزء من التطبيق دون موافقة كتابية مسبقة.';

  @override
  String get termsLiabilityTitle => '7. تحديد المسؤولية';

  @override
  String get termsLiabilityBody =>
      'يُقدم تطبيق غزة تك \"كما هو\" دون أي ضمانات من أي نوع. لسنا مسؤولين عن أي أضرار مباشرة أو غير مباشرة أو عرضية أو تبعية ناتجة عن استخدامك للمنصة، بما في ذلك على سبيل المثال لا الحصر الخسائر من معاملات السوق أو فقدان البيانات أو انقطاع الخدمة.';

  @override
  String get termsChangesTitle => '8. التغييرات على الشروط';

  @override
  String get termsChangesBody =>
      'قد نقوم بتحديث هذه الشروط والأحكام من وقت لآخر. يُعتبر استمرار استخدام التطبيق بعد التغييرات موافقة على الشروط المحدثة. سنقوم بإخطار المستخدمين بالتغييرات الجوهرية من خلال التطبيق.';

  @override
  String get termsContactTitle => '9. تواصل معنا';

  @override
  String get termsContactBody =>
      'إذا كانت لديك أي أسئلة حول هذه الشروط والأحكام، يرجى التواصل معنا على:';

  @override
  String get privacyTitle => 'سياسة الخصوصية';

  @override
  String get privacyLastUpdated => 'آخر تحديث: أبريل 2026';

  @override
  String get privacyIntro =>
      'يلتزم تطبيق غزة تك بحماية خصوصيتك. توضح سياسة الخصوصية هذه كيفية جمع واستخدام وتخزين وحماية معلوماتك الشخصية عند استخدام تطبيقنا.';

  @override
  String get privacyCollectionTitle => '1. المعلومات التي نجمعها';

  @override
  String get privacyCollectionBody =>
      'نجمع الأنواع التالية من المعلومات:\n\n• معلومات الحساب: الاسم والبريد الإلكتروني وكلمة المرور عند التسجيل.\n• معلومات الملف الشخصي: السيرة الذاتية ورقم الهاتف وروابط وسائل التواصل الاجتماعي والصورة الشخصية التي تختار تقديمها.\n• المحتوى: الإعلانات والمنشورات والتعليقات والمفضلات والصور التي تنشئها أو ترفعها.\n• مستندات التحقق: بطاقة الهوية الوطنية وتاريخ الميلاد والعنوان عند التقدم للتحقق من الهوية.\n• بيانات الاستخدام: تحليلات مجهولة وتقارير الأعطال لتحسين أداء التطبيق واستقراره.';

  @override
  String get privacyUseTitle => '2. كيف نستخدم معلوماتك';

  @override
  String get privacyUseBody =>
      'نستخدم معلوماتك من أجل:\n\n• تقديم خدمات تطبيق غزة تك وصيانتها وتحسينها.\n• إنشاء وإدارة حسابك.\n• عرض إعلاناتك ومنشوراتك للمستخدمين الآخرين.\n• معالجة طلبات التحقق من الهوية.\n• إرسال إشعارات الخدمة المهمة.\n• تحليل استخدام التطبيق لإصلاح الأخطاء وتحسين تجربة المستخدم.\n• تطبيق الشروط والأحكام وحماية سلامة المستخدمين.';

  @override
  String get privacyStorageTitle => '3. تخزين البيانات والأمان';

  @override
  String get privacyStorageBody =>
      'يتم تخزين بياناتك بشكل آمن باستخدام Supabase، مزود البنية التحتية السحابية الموثوق. نطبق معايير الأمان الصناعية بما في ذلك التشفير أثناء النقل وفي حالة السكون وبروتوكولات المصادقة الآمنة وضوابط الوصول. بينما نتخذ خطوات معقولة لحماية بياناتك، لا يوجد نظام آمن تماماً ولا يمكننا ضمان الأمان المطلق.';

  @override
  String get privacySharingTitle => '4. مشاركة المعلومات';

  @override
  String get privacySharingBody =>
      'نحن لا نبيع معلوماتك الشخصية. قد تتم مشاركة بياناتك في الحالات التالية:\n\n• معلومات الملف الشخصي العامة والإعلانات والمنشورات مرئية للمستخدمين الآخرين كجزء من وظائف المنصة.\n• مع مزودي الخدمة (Supabase، Google Analytics) الذين يساعدوننا في تشغيل التطبيق، بموجب اتفاقيات صارمة لمعالجة البيانات.\n• عندما يقتضي القانون ذلك أو لحماية حقوق وسلامة مستخدمينا ومنصتنا.';

  @override
  String get privacyRightsTitle => '5. حقوقك';

  @override
  String get privacyRightsBody =>
      'لديك الحق في:\n\n• الوصول إلى معلوماتك الشخصية وتحديثها من خلال إعدادات ملفك الشخصي.\n• حذف حسابك والبيانات المرتبطة به عن طريق التواصل معنا أو استخدام ميزة حذف الحساب.\n• طلب نسخة من البيانات التي نحتفظ بها عنك.\n• سحب الموافقة على معالجة البيانات الاختيارية في أي وقت.';

  @override
  String get privacyRetentionTitle => '6. الاحتفاظ بالبيانات';

  @override
  String get privacyRetentionBody =>
      'نحتفظ ببياناتك طالما كان حسابك نشطاً أو حسب الحاجة لتقديم الخدمات. عند حذف حسابك، ستتم إزالة بياناتك الشخصية خلال 30 يوماً، باستثناء الحالات التي يلزمنا فيها القانون بالاحتفاظ بمعلومات معينة.';

  @override
  String get privacyChildrenTitle => '7. خصوصية الأطفال';

  @override
  String get privacyChildrenBody =>
      'تطبيق غزة تك غير مخصص للأطفال دون سن 15 عاماً. نحن لا نجمع معلومات شخصية من الأطفال عن عمد. إذا علمنا أننا جمعنا بيانات من طفل دون 15 عاماً، سنتخذ خطوات لحذف تلك المعلومات فوراً.';

  @override
  String get privacyChangesTitle => '8. التغييرات على هذه السياسة';

  @override
  String get privacyChangesBody =>
      'قد نقوم بتحديث سياسة الخصوصية هذه من وقت لآخر. سنقوم بإخطارك بالتغييرات الجوهرية من خلال التطبيق. يُعتبر استمرار استخدام التطبيق بعد التغييرات موافقة على السياسة المحدثة.';

  @override
  String get privacyContactTitle => '9. تواصل معنا';

  @override
  String get privacyContactBody =>
      'إذا كانت لديك أي أسئلة حول سياسة الخصوصية هذه أو ترغب في ممارسة حقوقك المتعلقة ببياناتك، يرجى التواصل معنا على:';
}
