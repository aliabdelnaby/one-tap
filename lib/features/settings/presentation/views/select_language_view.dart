import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Align(
              child: Flexible(
                child: Text(
                  "Choose Language".tr(),
                  style: CustomTextStyle.signikastyle28.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomBtn(
                    onPressed: () async {
                      LocalizationChecker.changeLanguageToArabic(context);
                      context.pushReplacement("/homeView");
                    },
                    text: "Arabic".tr(),
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: CustomBtn(
                    onPressed: () async {
                      LocalizationChecker.changeLanguageToEnglish(context);
                      context.pushReplacement("/homeView");
                    },
                    text: "English".tr(),
                  ),
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
