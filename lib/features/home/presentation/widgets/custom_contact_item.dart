import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_tap/core/utils/app_colors.dart';
import 'package:one_tap/core/utils/app_text_styles.dart';

class CustomContactItem extends StatelessWidget {
  const CustomContactItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: ListTile(
        title: const Text(
          "+20 1224863876",
        ),
        subtitle: Text(
          "4/3/2024 at 03:20 PM",
          style: CustomTextStyle.signikaTimestyle,
        ),
        leading: CircleAvatar(
          backgroundColor: AppColors.gray200,
          child: Icon(
            FontAwesomeIcons.whatsapp,
            color: AppColors.primaryColor,
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
          ),
        ),
      ),
    );
  }
}
