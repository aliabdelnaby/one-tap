import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:via_whatsapp/core/functions/navigation.dart';
import 'package:via_whatsapp/core/utils/app_colors.dart';
import 'package:via_whatsapp/core/utils/app_text_styles.dart';

class CustomAboutListTile extends StatelessWidget {
  const CustomAboutListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        customNavigate(context, "/about");
      },
      leading: CircleAvatar(
        backgroundColor: AppColors.gray200,
        child: Icon(
          Icons.info_outline,
          color: AppColors.primaryColor,
        ),
      ),
      title: Text(
        "About".tr(),
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
