import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomLanguageListTile extends StatelessWidget {
  const CustomLanguageListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        customNavigate(context, "/selectLanguageView");
      },
      leading: CircleAvatar(
        backgroundColor: AppColors.grey200,
        child: Icon(
          Icons.language,
          color: AppColors.primaryColor,
        ),
      ),
      title: Text(
        "Language".tr(),
        style: CustomTextStyle.signikastyle18,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.primaryColor,
        size: 20.sp,
      ),
    );
  }
}
