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
  String get conditionNew => 'جديد';

  @override
  String get conditionUsed => 'مستعمل';

  @override
  String get conditionRefurbished => 'مُجدَّد';

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
}
