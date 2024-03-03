import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:via_whatsapp/core/functions/custom_toast.dart';
import 'package:via_whatsapp/core/utils/app_colors.dart';

class LocalizationChecker {
  static changeLanguageToEnglish(BuildContext context) {
    Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    if (currentLocal == const Locale("ar")) {
      EasyLocalization.of(context)!.setLocale(const Locale("en"));
    } else {
      showToast("You are on the same language".tr(), AppColors.primaryColor);
    }
  }

  static changeLanguageToArabic(BuildContext context) {
    Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    if (currentLocal == const Locale("en")) {
      EasyLocalization.of(context)!.setLocale(const Locale("ar"));
    } else {
      showToast("You are on the same language".tr(), AppColors.primaryColor);
    }
  }
}
