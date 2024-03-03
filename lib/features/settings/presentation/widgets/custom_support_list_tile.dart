import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:via_whatsapp/core/utils/app_colors.dart';
import 'package:via_whatsapp/core/utils/app_text_styles.dart';

class CustomSupportListTile extends StatelessWidget {
  const CustomSupportListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        backgroundColor:  AppColors.gray200,
        child: Icon(
          Icons.support_agent_outlined,
          color: AppColors.primaryColor,
        ),
      ),
      title: Text(
        "Support".tr(),
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
