import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_tap/core/utils/app_colors.dart';
import '../../../../core/models/contact_model.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../cubits/home_cubit/home_cubit.dart';
import 'custom_btn.dart';
import 'custom_text_field.dart';

class EnterMobileNumberSection extends StatefulWidget {
  const EnterMobileNumberSection({super.key});

  @override
  State<EnterMobileNumberSection> createState() =>
      _EnterMobileNumberSectionState();
}

class _EnterMobileNumberSectionState extends State<EnterMobileNumberSection> {
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
            style: CustomTextStyle.signikastyle28,
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
                int iconCode = FontAwesomeIcons.whatsapp.codePoint;
                ContactModel contactModel = dateFormat(cubit, iconCode);
                cubit.addContact(contactModel);
                cubit.openWhatsapp(
                  // context: context,
                  number: cubit.phoneController.text,
                );
              } else {
                cubit.autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            text: "Open In WhatsApp".tr(),
          ),
          const SizedBox(height: 8),
          Text(
            "-Or using-".tr(),
            style: CustomTextStyle.signikastyle15.copyWith(
              color: AppColors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  if (cubit.phoneFormKey.currentState!.validate()) {
                    cubit.phoneFormKey.currentState!.save();
                    int iconCode = FontAwesomeIcons.telegram.codePoint;
                    ContactModel contactModel = dateFormat(cubit, iconCode);
                    cubit.addContact(contactModel);
                    cubit.openTelegram(
                      phone: cubit.phoneController.text,
                    );
                  } else {
                    cubit.autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                icon: const Icon(
                  FontAwesomeIcons.telegram,
                  color: Colors.blue,
                ),
                label: Text(
                  "Telegram".tr(),
                  style: CustomTextStyle.signikaOptionstyle14,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.phone,
                  color: Colors.blue,
                ),
                label: Text(
                  "Call".tr(),
                  style: CustomTextStyle.signikaOptionstyle14,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.solidMessage,
                  color: Colors.blue,
                ),
                label: Text(
                  "SMS".tr(),
                  style: CustomTextStyle.signikaOptionstyle14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ContactModel dateFormat(HomeCubit cubit, int iconCode) {
    var currentDate = DateTime.now();
    var formattedCurrentDate =
        DateFormat("dd/M/yyyy hh:mm a").format(currentDate);
    var contactModel = ContactModel(
      number: cubit.phoneController.text,
      date: formattedCurrentDate,
      iconCode: iconCode,
    );
    return contactModel;
  }
}
