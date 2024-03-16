import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:one_tap/core/admob/ad_manager.dart';
import 'package:one_tap/core/admob/ads_functions.dart';
import '../../../../core/functions/localization.dart';
import '../../../../core/functions/navigation.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                "Choose Language".tr(),
                style: CustomTextStyle.signikastyle28.copyWith(
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBtn(
                    onPressed: () {
                      Ads().showAd();
                      LocalizationChecker.changeLanguageToArabic(context);
                      customReplacementNavigate(context, "/");
                    },
                    text: "Arabic".tr(),
                  ),
                  CustomBtn(
                    onPressed: () {
                      Ads().showAd();
                      LocalizationChecker.changeLanguageToEnglish(context);
                      customReplacementNavigate(context, "/");
                    },
                    text: "English".tr(),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Container(
                child: nativeAdIsLoaded
                    ? ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 320, // minimum recommended width
                          minHeight: 320, // minimum recommended height
                          maxWidth: 400,
                          maxHeight: 400,
                        ),
                        child: AdWidget(ad: nativeAd!),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
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
        cornerRadius: 10.0,
        callToActionTextStyle: NativeTemplateTextStyle(
          textColor: Colors.black,
          backgroundColor: Colors.blue,
          style: NativeTemplateFontStyle.monospace,
          size: 16.0,
        ),
        primaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.red,
          backgroundColor: Colors.white,
          style: NativeTemplateFontStyle.italic,
          size: 16.0,
        ),
        secondaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.green,
          backgroundColor: Colors.black,
          style: NativeTemplateFontStyle.bold,
          size: 16.0,
        ),
        tertiaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.brown,
          backgroundColor: Colors.white,
          style: NativeTemplateFontStyle.normal,
          size: 16.0,
        ),
      ),
    )..load();
  }
}
