import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import 'onboarding_image.dart';

List<PageViewModel>? pages = [
  PageViewModel(
    title: 'titleOnboarding1'.tr(),
    body: 'bodyOnboarding1'.tr(),
    image: const OnBoradingImage(
      imagePath: Assets.imagesOnboarding1,
    ),
    decoration: getPageDecoration(),
  ),
  PageViewModel(
    title: 'titleOnboarding2'.tr(),
    body: 'bodyOnboarding2'.tr(),
    image: const OnBoradingImage(
      imagePath: Assets.imagesOnboarding2,
    ),
    decoration: getPageDecoration(),
  ),
  PageViewModel(
    title: 'titleOnboarding3'.tr(),
    body: 'bodyOnboarding3'.tr(),
    image: const OnBoradingImage(
      imagePath: Assets.imagesOnboarding3,
    ),
    decoration: getPageDecoration(),
  ),
  PageViewModel(
    title: 'titleOnboarding4'.tr(),
    body: 'bodyOnboarding4'.tr(),
    image: const OnBoradingImage(
      imagePath: Assets.imagesOnboarding4,
    ),
    decoration: getPageDecoration(),
  ),
];

PageDecoration getPageDecoration() {
  return PageDecoration(
    imagePadding: EdgeInsets.only(top: 120.h),
    pageColor: Colors.white,
    bodyPadding: EdgeInsets.only(top: 8.h, left: 20.w, right: 20.w),
    titlePadding: EdgeInsets.only(top: 50.h),
    titleTextStyle: CustomTextStyle.signikastyle24,
    bodyTextStyle: CustomTextStyle.signikastyle15black54,
  );
}
