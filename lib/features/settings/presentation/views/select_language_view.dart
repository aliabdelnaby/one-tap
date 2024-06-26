import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/admob/ad_manager.dart';
import '../../../../core/admob/ads_functions.dart';
import '../../../../core/functions/localization.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../home/presentation/widgets/custom_btn.dart';

class SelectLanguageView extends StatefulWidget {
  const SelectLanguageView({super.key});

  @override
  State<SelectLanguageView> createState() => _SelectLanguageViewState();
}

class _SelectLanguageViewState extends State<SelectLanguageView> {
  NativeAd? nativeAd;
  bool nativeAdIsLoaded = false;

  @override
  void initState() {
    loadNativeAd();
    super.initState();
  }

  @override
  void dispose() {
    if (nativeAdIsLoaded) {
      nativeAd!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Align(
              child: Text(
                "Choose Language".tr(),
                style: CustomTextStyle.signikastyle28.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBtn(
                  height: MediaQuery.of(context).size.height * .065,
                  width: MediaQuery.of(context).size.width * .45,
                  onPressed: () {
                    Ads().showAd();
                    LocalizationChecker.changeLanguageToArabic(context);
                    customReplacementNavigate(context, "/homeView");
                  },
                  text: "Arabic".tr(),
                ),
                CustomBtn(
                  height: MediaQuery.of(context).size.height * .065,
                  width: MediaQuery.of(context).size.width * .45,
                  onPressed: () {
                    Ads().showAd();
                    LocalizationChecker.changeLanguageToEnglish(context);
                    customReplacementNavigate(context, "/homeView");
                  },
                  text: "English".tr(),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            Container(
              child: nativeAdIsLoaded
                  ? ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 320.w, // minimum recommended width
                        minHeight: 320.h, // minimum recommended height
                        maxWidth: 400.w,
                        maxHeight: 400.h,
                      ),
                      child: AdWidget(ad: nativeAd!),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  void loadNativeAd() {
    nativeAd = NativeAd(
      adUnitId: AdManager.nativeAd,
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            nativeAdIsLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          if (kDebugMode) {
            print(error);
          }
        },
      ),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.medium,
        cornerRadius: 10.0.w, // Scaling corner radius based on screen width
        callToActionTextStyle: NativeTemplateTextStyle(
          textColor: Colors.black,
          backgroundColor: Colors.blue,
          style: NativeTemplateFontStyle.monospace,
          size: 16.0.sp, // Scaling text size based on screen width
        ),
        primaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.red,
          backgroundColor: Colors.white,
          style: NativeTemplateFontStyle.italic,
          size: 16.0.sp, // Scaling text size based on screen width
        ),
        secondaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.green,
          backgroundColor: Colors.black,
          style: NativeTemplateFontStyle.bold,
          size: 16.0.sp, // Scaling text size based on screen width
        ),
        tertiaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.brown,
          backgroundColor: Colors.white,
          style: NativeTemplateFontStyle.normal,
          size: 16.0.sp, // Scaling text size based on screen width
        ),
      ),
    )..load();
  }
}
