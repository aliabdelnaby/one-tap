import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
    this.width,
    this.height,
  });

  final String text;
  final void Function()? onPressed;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? MediaQuery.sizeOf(context).height * .065,
      width: width ?? MediaQuery.sizeOf(context).width * .45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          text,
          style: CustomTextStyle.signikaBtnstyle16,
        ),
      ),
    );
  }
}
