import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../../core/admob/ad_manager.dart';
import 'custom_about_list_tile.dart';
import 'custom_language_list_tile.dart';
import 'custom_support_list_tile.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({super.key});

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
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
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const CustomLanguageListTile(),
        Divider(endIndent: 15.w, indent: 15.w),
        const CustomAboutListTile(),
        Divider(endIndent: 15.w, indent: 15.w),
        const CustomSupportListTile(),
        Divider(endIndent: 15.w, indent: 15.w),
        SizedBox(height: 15.h),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: nativeAdIsLoaded
              ? ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 320.w, // minimum recommended width
                    minHeight: 90.h, // minimum recommended height
                    maxWidth: 400.w,
                    maxHeight: 200.h,
                  ),
                  child: AdWidget(ad: nativeAd!),
                )
              : const SizedBox(),
        ),
      ],
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
        templateType: TemplateType.small,
        cornerRadius: 10.0.w,
        callToActionTextStyle: NativeTemplateTextStyle(
          textColor: Colors.black,
          backgroundColor: Colors.blue,
          style: NativeTemplateFontStyle.monospace,
          size: 16.0.sp,
        ),
        primaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.red,
          backgroundColor: Colors.white,
          style: NativeTemplateFontStyle.italic,
          size: 16.0.sp,
        ),
        secondaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.green,
          backgroundColor: Colors.black,
          style: NativeTemplateFontStyle.bold,
          size: 16.0.sp,
        ),
        tertiaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.brown,
          backgroundColor: Colors.white,
          style: NativeTemplateFontStyle.normal,
          size: 16.0.sp,
        ),
      ),
    )..load();
  }
}
