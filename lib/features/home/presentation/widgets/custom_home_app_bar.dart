import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_tap/core/admob/ads_functions.dart';
import 'package:one_tap/core/functions/navigation.dart';
import 'package:one_tap/core/utils/app_colors.dart';
import 'package:one_tap/features/home/cubits/home_cubit/home_cubit.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // GestureDetector(
        //   onTap: () {
        //     cubit.scaffoldHomekey.currentState!.openDrawer();
        //   },
        //   child: Icon(
        //     FontAwesomeIcons.bars,
        //     color: AppColors.primaryColor,
        //     size: 25,
        //   ),
        // ),
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
