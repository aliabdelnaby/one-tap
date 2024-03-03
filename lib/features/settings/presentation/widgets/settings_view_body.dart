import 'package:flutter/material.dart';
import 'package:via_whatsapp/features/settings/presentation/widgets/custom_about_list_tile.dart';
import 'package:via_whatsapp/features/settings/presentation/widgets/custom_language_list_tile.dart';
import 'package:via_whatsapp/features/settings/presentation/widgets/custom_support_list_tile.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CustomLanguageListTile(),
        Divider(endIndent: 15, indent: 15),
        CustomAboutListTile(),
        Divider(endIndent: 15, indent: 15),
        CustomSupportListTile(),
        Divider(endIndent: 15, indent: 15),
      ],
    );
  }
}
