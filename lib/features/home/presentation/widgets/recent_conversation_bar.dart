import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_tap/core/functions/custom_snack_bar.dart';
import 'package:one_tap/core/utils/app_colors.dart';
import 'package:one_tap/core/utils/app_text_styles.dart';
import 'package:one_tap/features/home/cubits/home_cubit/home_cubit.dart';
import 'package:one_tap/features/home/cubits/home_cubit/home_state.dart';
import 'package:one_tap/features/home/presentation/widgets/clear_all_alert_dialog.dart';

class CustomRecentConversationBar extends StatelessWidget {
  const CustomRecentConversationBar({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Recent Conversations".tr(),
          style: CustomTextStyle.signikastyle18,
        ),
        BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is DeleteAllContactsFailure) {
              customSnackBar(
                context,
                state.errMessage,
                AppColors.primaryColor,
              );
            } else if (state is DeleteAllContactstSuccess) {
              cubit.fetchAllContacts();
              customSnackBar(
                context,
                "All deleted successfully".tr(),
                AppColors.green,
              );
            }
          },
          builder: (context, state) {
            return TextButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomAlertDialogClearAll(cubit: cubit);
                  },
                );
              },
              label: Text(
                "Clear All".tr(),
                style: TextStyle(
                  color: AppColors.grey,
                ),
              ),
              icon: Icon(
                Icons.delete,
                color: AppColors.grey,
                size: 18,
              ),
            );
          },
        ),
      ],
    );
  }
}
