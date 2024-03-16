import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/admob/ads_functions.dart';
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
              Ads().showAd();
              customNavigate(context, "/settingsView");
            },
            child: Icon(
              FontAwesomeIcons.gear,
              color: AppColors.primaryColor,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}
