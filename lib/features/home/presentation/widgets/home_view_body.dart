import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:one_tap/core/utils/app_text_styles.dart';
import 'package:one_tap/features/home/presentation/widgets/contact_list_view.dart';
import 'package:one_tap/features/home/presentation/widgets/custom_enter_mobile_nember_and_open_tele_whatsapp.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EnterMobileNumberSection(),
          const SizedBox(height: 20),
          const Divider(),
          Text(
            "Recent Conversation".tr(),
            style: CustomTextStyle.signikastyle18,
          ),
          const SizedBox(height: 15),
          const Expanded(child: ContactsListView()),
        ],
      ),
    );
  }
}
