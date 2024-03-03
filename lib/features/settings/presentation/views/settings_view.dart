import 'package:flutter/material.dart';
import 'package:via_whatsapp/core/functions/navigation.dart';
import 'package:via_whatsapp/features/settings/presentation/views/settings_view_body.dart';

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
      title: const Text(
        "One Tap WhatsApp",
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          customPopNavigate(context);
        },
        icon: const Icon(
          Icons.close,
          color: Colors.red,
          size: 30,
        ),
      ),
    );
  }
}
