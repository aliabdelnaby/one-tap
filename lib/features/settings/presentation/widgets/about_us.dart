import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../../core/admob/ad_manager.dart';
import '../../../../core/utils/app_colors.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  BannerAd? bannerAd;
  bool isLoaded = false;

  @override
  void initState() {
    loadAd();
    super.initState();
  }

  @override
  void dispose() {
    if (isLoaded) {
      bannerAd!.dispose();
    }
    super.dispose();
  }

  void loadAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdManager.bannerHome,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About This Application'.tr(),
          style: TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: isLoaded
                  ? SizedBox(
                      height: bannerAd!.size.height.toDouble(),
                      width: bannerAd!.size.width.toDouble(),
                      child: AdWidget(ad: bannerAd!),
                    )
                  : const SizedBox(),
            ),
            SizedBox(height: 15.h),
            Text(
              'Description'.tr(),
              style: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10.0.h),
            Text(
              'description'.tr(),
              style: TextStyle(fontSize: 16.0.sp),
            ),
            SizedBox(height: 20.0.h),
            Text(
              'Features'.tr(),
              style: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10.0.h),
            Text(
              'features'.tr(),
              style: TextStyle(fontSize: 16.0.sp),
            ),
            SizedBox(height: 20.0.h),
            Text(
              'Usage'.tr(),
              style: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10.0.h),
            Text(
              'usage'.tr(),
              style: TextStyle(fontSize: 16.0.sp),
            ),
            SizedBox(height: 20.0.h),
            Text(
              'Developer'.tr(),
              style: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10.0.h),
            Text(
              'developer'.tr(),
              style: TextStyle(fontSize: 16.0.sp),
            ),
            SizedBox(height: 20.0.h),
            Text(
              'Feedback'.tr(),
              style: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 10.0.h),
            Text(
              'feedback'.tr(),
              style: TextStyle(fontSize: 16.0.sp),
            ),
            SizedBox(height: 20.0.h),
            Text(
              'ThankYouMessage'.tr(),
              style: TextStyle(
                fontSize: 16.0.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
