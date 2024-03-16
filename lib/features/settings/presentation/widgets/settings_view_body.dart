import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:one_tap/core/admob/ad_manager.dart';
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
      children: [
        const CustomLanguageListTile(),
        const Divider(endIndent: 15, indent: 15),
        const CustomAboutListTile(),
        const Divider(endIndent: 15, indent: 15),
        const CustomSupportListTile(),
        const Divider(endIndent: 15, indent: 15),
        const SizedBox(height: 25),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: nativeAdIsLoaded
              ? ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 320, // minimum recommended width
                    minHeight: 90, // minimum recommended height
                    maxWidth: 400,
                    maxHeight: 200,
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
