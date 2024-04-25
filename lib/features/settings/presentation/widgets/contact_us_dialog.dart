import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../settings_cubit/settings_cubit.dart';

class CustomContactUsDialog extends StatelessWidget {
  const CustomContactUsDialog({super.key, required this.cubit});

  final SettingsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Align(
        child: Text(
          "contactUsVia".tr(),
          style: CustomTextStyle.signikastyle15,
        ),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              cubit.openWhatsapp(
                number: "+201224863876",
              );
            },
            icon: const Icon(
              FontAwesomeIcons.whatsapp,
              color: Colors.green,
            ),
          ),
          IconButton(
            onPressed: () {
              cubit.sendEmail(
                emailAddress: "aliabdelnabi239@gmail.com",
              );
            },
            icon: Icon(
              FontAwesomeIcons.envelope,
              color: Colors.red.shade200,
            ),
          ),
        ],
      ),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
