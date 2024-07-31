import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:one_tap/core/utils/app_text_styles.dart';
import '../../../../core/utils/app_colors.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.language,
          color: AppColors.grey,
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                side: BorderSide(color: AppColors.grey),
              ),
            ),
            child: Text(
              "En".tr(),
              style: CustomTextStyle.signikastyle18
                  .copyWith(color: AppColors.grey),
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                side: BorderSide(color: AppColors.grey),
              ),
            ),
            child: Text(
              "Ar".tr(),
              style: CustomTextStyle.signikastyle18
                  .copyWith(color: AppColors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
