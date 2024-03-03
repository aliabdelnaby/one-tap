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
        "One Tap WhatsApp",
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
