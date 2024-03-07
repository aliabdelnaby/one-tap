import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const SettingsViewBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "appName".tr(),
        style: CustomTextStyle.signikastyle20,
      ),
      centerTitle: true,
      leading: IconButton(
        tooltip: "Back".tr(),
        onPressed: () {
          customPopNavigate(context);
        },
        icon: Icon(
          Icons.close,
          color: AppColors.primaryColor,
          size: 25,
        ),
      ),
    );
  }
}
