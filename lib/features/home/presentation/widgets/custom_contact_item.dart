import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_tap/core/models/contact_model.dart';
import 'package:one_tap/core/utils/app_colors.dart';
import 'package:one_tap/core/utils/app_text_styles.dart';

class CustomContactItem extends StatelessWidget {
  const CustomContactItem({super.key, required this.contact});
  final ContactModel contact;
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
        title: Text(
          contact.number,
        ),
        subtitle: Text(
          contact.date,
          style: CustomTextStyle.signikaTimestyle,
        ),
        leading: CircleAvatar(
          backgroundColor: AppColors.gray200,
          child: Icon(
            FontAwesomeIcons.user,
            color: AppColors.primaryColor,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            contact.delete();
          },
          icon: Icon(
            Icons.delete,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
