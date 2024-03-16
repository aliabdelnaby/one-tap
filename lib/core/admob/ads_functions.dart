import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_manager.dart';

class Ads {
  InterstitialAd? _interstitialAd;
  AppOpenAd? _appOpenAd;
  void showAd() {
    InterstitialAd.load(
      adUnitId: AdManager.interstitialHome,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          if (_interstitialAd != null) {
            _interstitialAd!.show();
          }
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
            },
          );
        },
        onAdFailedToLoad: (error) {
          if (kDebugMode) {
            print(error);
          }
        },
      ),
    );
  }

  void appOPenAd() {
    AppOpenAd.load(
      adUnitId: AdManager.appOpenAd,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
          if (_appOpenAd != null) {
            _appOpenAd!.show();
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                ad.dispose();
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                ad.dispose();
                if (kDebugMode) {
                  print(error);
                }
              },
            );
          }
        },
        onAdFailedToLoad: (error) {
          if (kDebugMode) {
            print(error);
          }
        },
      ),
      orientation: AppOpenAd.orientationPortrait,
    );
  }
}
