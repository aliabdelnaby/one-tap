import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_tap/core/utils/app_text_styles.dart';
import 'package:one_tap/features/home/home_cubit/home_cubit.dart';
import 'package:one_tap/features/home/presentation/widgets/custom_btn.dart';
import 'package:one_tap/features/home/presentation/widgets/custom_text_field.dart';

class CustomEnterNumberAndOPenTeleAndWhatsAppForm extends StatefulWidget {
  const CustomEnterNumberAndOPenTeleAndWhatsAppForm({super.key});

  @override
  State<CustomEnterNumberAndOPenTeleAndWhatsAppForm> createState() =>
      _CustomEnterNumberAndOPenTeleAndWhatsAppFormState();
}

class _CustomEnterNumberAndOPenTeleAndWhatsAppFormState
    extends State<CustomEnterNumberAndOPenTeleAndWhatsAppForm> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Form(
      key: cubit.phoneFormKey,
      autovalidateMode: cubit.autovalidateMode,
      child: Column(
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
              controller: cubit.phoneController,
              onSaved: (value) {
                cubit.phone = value;
              },
            ),
          ),
          const SizedBox(height: 20),
          CustomBtn(
            onPressed: () {
              if (cubit.phoneFormKey.currentState!.validate()) {
                cubit.phoneFormKey.currentState!.save();
                cubit.openWhatsapp(
                  context: context,
                  number: cubit.phoneController.text,
                );
              } else {
                cubit.autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            text: "Open In WhatsApp".tr(),
          ),
          const SizedBox(height: 15),
          CustomBtn(
            onPressed: () {
              if (cubit.phoneFormKey.currentState!.validate()) {
                cubit.phoneFormKey.currentState!.save();
                cubit.openTelegram(
                  phone: cubit.phoneController.text,
                );
              } else {
                cubit.autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            text: "Open In Telegram".tr(),
          ),
        ],
      ),
    );
  }
}
