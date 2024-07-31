import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.onSaved,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      cursorColor: AppColors.primaryColor,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Please enter the phone number".tr();
        } else if (value!.length <= 10) {
          return "Enter a valid number".tr();
        } else if (!value.startsWith("+")) {
          return 'Write the country code such as (+20)'.tr();
        } else if (value.contains(' ')) {
          return "Please delete the spaces in the phone number".tr();
        } else {
          return null;
        }
      },
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        hintText: 'ex: +20 12XXXXXXXX',
        hintStyle: CustomTextStyle.signikaTextFieldstyle,
      ),
    );
  }
}
