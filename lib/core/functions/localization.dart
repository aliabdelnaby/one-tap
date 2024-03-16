import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'custom_snack_bar.dart';
import '../utils/app_colors.dart';

class LocalizationChecker {
  static changeLanguageToEnglish(BuildContext context) {
    try {
      Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
      if (currentLocal == const Locale("ar")) {
        EasyLocalization.of(context)!.setLocale(const Locale("en"));
        customSnackBar(
          context,
          "The language has been changed",
          AppColors.green,
        );
      } else {
        customSnackBar(
          context,
          "You are on the same language".tr(),
          AppColors.primaryColor,
        );
      }
    } catch (e) {
      customSnackBar(
        context,
        e.toString().tr(),
        AppColors.primaryColor,
      );
    }
  }

  static changeLanguageToArabic(BuildContext context) {
    try {
      Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
      if (currentLocal == const Locale("en")) {
        EasyLocalization.of(context)!.setLocale(const Locale("ar"));
        customSnackBar(
          context,
          "تم تغيير اللغة",
          AppColors.green,
        );
      } else {
        customSnackBar(
          context,
          "You are on the same language".tr(),
          AppColors.primaryColor,
        );
      }
    } catch (e) {
      customSnackBar(
        context,
        e.toString().tr(),
        AppColors.primaryColor,
      );
    }
  }
}
