import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.onSaved,
  });

  final TextEditingController? controller;
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        onSaved: onSaved,
        cursorColor: AppColors.primaryColor,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "This field is required".tr();
          } else if (value!.length <= 11) {
            return 'write the country code such as (+20)'.tr();
          } else {
            return null;
          }
        },
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          hintText: 'Ex: +20 1234567890',
          hintStyle: CustomTextStyle.signikaTextFieldstyle,
        ),
      ),
    );
  }
}
