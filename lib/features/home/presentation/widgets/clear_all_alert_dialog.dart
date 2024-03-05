import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:one_tap/core/functions/custom_snack_bar.dart';
import 'package:one_tap/core/functions/navigation.dart';
import 'package:one_tap/core/utils/app_colors.dart';
import 'package:one_tap/core/utils/app_text_styles.dart';
import 'package:one_tap/features/home/cubits/home_cubit/home_cubit.dart';

class CustomAlertDialogClearAll extends StatelessWidget {
  const CustomAlertDialogClearAll({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Warnning!!!".tr(),
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
      ),
      content: Text(
        "Are you sure you want to delete all contacts?".tr(),
        style: CustomTextStyle.signikastyle15,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            customPopNavigate(context);
          },
          child: Text(
            "Close".tr(),
          ),
        ),
        const SizedBox(
          width: 25,
        ),
        GestureDetector(
          onTap: () {
            if (cubit.contacts!.isEmpty) {
              customSnackBar(
                context,
                "There are no contacts to delete".tr(),
                AppColors.primaryColor,
              );
              customPopNavigate(context);
            } else {
              cubit.deleteAllData();
              customPopNavigate(context);
            }
          },
          child: Text(
            "Clear All".tr(),
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
