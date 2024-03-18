import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_tap/features/settings/presentation/widgets/contact_us_dialog.dart';
import 'package:one_tap/features/settings/settings_cubit/settings_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomSupportListTile extends StatelessWidget {
  const CustomSupportListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SettingsCubit>(context);
    return ListTile(
      onTap: () {
        showDialog(
          useSafeArea: true,
          context: context,
          builder: (context) {
            return CustomContactUsDialog(
              cubit: cubit,
            );
          },
        );
      },
      leading: CircleAvatar(
        backgroundColor: AppColors.grey200,
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
        size: 20.sp,
      ),
    );
  }
}
