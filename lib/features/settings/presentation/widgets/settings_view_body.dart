import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_about_list_tile.dart';
import 'custom_language_list_tile.dart';
import 'custom_support_list_tile.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({super.key});

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const CustomLanguageListTile(),
        Divider(endIndent: 15.w, indent: 15.w),
        const CustomAboutListTile(),
        Divider(endIndent: 15.w, indent: 15.w),
        const CustomSupportListTile(),
        Divider(endIndent: 15.w, indent: 15.w),
        SizedBox(height: 15.h),
      ],
    );
  }
}
