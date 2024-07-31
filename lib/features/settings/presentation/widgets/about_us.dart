import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

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
