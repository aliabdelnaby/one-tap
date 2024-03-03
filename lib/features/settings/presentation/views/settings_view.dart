import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:via_whatsapp/core/functions/navigation.dart';
import 'package:via_whatsapp/core/utils/app_colors.dart';
import 'package:via_whatsapp/core/utils/app_text_styles.dart';
import 'package:via_whatsapp/features/settings/presentation/widgets/settings_view_body.dart';

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
        onPressed: () {
          customPopNavigate(context);
        },
        icon: Icon(
          Icons.close,
          color: AppColors.primaryColor,
          size: 24,
        ),
      ),
    );
  }
}
