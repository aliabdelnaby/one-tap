import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:one_tap/core/utils/app_text_styles.dart';
import 'package:one_tap/features/home/home_cubit/home_cubit.dart';
import 'package:one_tap/features/home/presentation/widgets/custom_btn.dart';
import 'package:one_tap/features/home/presentation/widgets/custom_text_field.dart';

class CustomEnterMobileNumberAndOPenTeleAndWhatsApp extends StatelessWidget {
  const CustomEnterMobileNumberAndOPenTeleAndWhatsApp({
    super.key,
    required this.phoneController,
    required this.cubit,
  });

  final TextEditingController phoneController;
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "title".tr(),
          style: CustomTextStyle.signikastyle24,
        ),
        const SizedBox(height: 5),
        Text(
          "subTitle".tr(),
          textAlign: TextAlign.center,
          style: CustomTextStyle.signikastyle15,
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: CustomTextFormField(
            controller: phoneController,
          ),
        ),
        const SizedBox(height: 20),
        CustomBtn(
          onPressed: () {
            if (cubit.phoneFormKey.currentState!.validate()) {
              cubit.openWhatsapp(
                context: context,
                number: phoneController.text,
              );
            }
          },
          text: "Open In WhatsApp".tr(),
        ),
        const SizedBox(height: 15),
        CustomBtn(
          onPressed: () {
            if (cubit.phoneFormKey.currentState!.validate()) {
              cubit.openTelegram(
                phone: phoneController.text,
              );
            }
          },
          text: "Open In Telegram".tr(),
        ),
      ],
    );
  }
}
