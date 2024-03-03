import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:via_whatsapp/core/functions/navigation.dart';
import 'package:via_whatsapp/core/utils/app_colors.dart';
import 'package:via_whatsapp/core/utils/app_text_styles.dart';

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
        backgroundColor: AppColors.gray200,
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
        size: 20,
      ),
    );
  }
}
