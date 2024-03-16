import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomHomeBodyTexts extends StatelessWidget {
  const CustomHomeBodyTexts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "title".tr(),
          style: CustomTextStyle.signikastyle28,
        ),
        const SizedBox(height: 5),
        Text(
          "subTitle".tr(),
          textAlign: TextAlign.center,
          style: CustomTextStyle.signikastyle15,
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
