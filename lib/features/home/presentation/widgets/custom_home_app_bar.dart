import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Tooltip(
          message: "Settings".tr(),
          child: GestureDetector(
            onTap: () {
              customNavigate(context, "/settingsView");
            },
            child: Icon(
              FontAwesomeIcons.gear,
              color: AppColors.primaryColor,
              size: 22.sp,
            ),
          ),
        ),
      ],
    );
  }
}
