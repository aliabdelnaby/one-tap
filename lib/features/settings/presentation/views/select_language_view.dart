import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/functions/localization.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../home/presentation/widgets/custom_btn.dart';

class SelectLanguageView extends StatelessWidget {
  const SelectLanguageView({super.key});

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
                    LocalizationChecker.changeLanguageToArabic(context);
                    customReplacementNavigate(context, "/homeView");
                  },
                  text: "Arabic".tr(),
                ),
                CustomBtn(
                  height: MediaQuery.of(context).size.height * .065,
                  width: MediaQuery.of(context).size.width * .45,
                  onPressed: () {
                    LocalizationChecker.changeLanguageToEnglish(context);
                    customReplacementNavigate(context, "/homeView");
                  },
                  text: "English".tr(),
                ),
              ],
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }
}
