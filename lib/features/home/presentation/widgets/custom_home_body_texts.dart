import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomHomeBodyTexts extends StatelessWidget {
  const CustomHomeBodyTexts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "title".tr(),
          style: CustomTextStyle.signikastyle28,
        ),
        SizedBox(height: 15.h),
        Text(
          "subTitle".tr(),
          textAlign: TextAlign.center,
          style: CustomTextStyle.signikastyle15.copyWith(
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
