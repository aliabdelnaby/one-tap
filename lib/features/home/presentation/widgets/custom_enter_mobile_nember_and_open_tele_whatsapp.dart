import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/app_colors.dart';
import 'custom_home_body_texts.dart';
import '../../../../core/models/contact_model.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../cubits/home_cubit/home_cubit.dart';
import 'custom_btn.dart';
import 'custom_text_field.dart';

class EnterMobileNumberWidgets extends StatefulWidget {
  const EnterMobileNumberWidgets({super.key});

  @override
  State<EnterMobileNumberWidgets> createState() =>
      _EnterMobileNumberWidgetsState();
}

class _EnterMobileNumberWidgetsState extends State<EnterMobileNumberWidgets> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Form(
      key: cubit.phoneFormKey,
      autovalidateMode: cubit.autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 24),
          const CustomHomeBodyTexts(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomTextFormField(
              controller: cubit.phoneController,
              onSaved: (value) {
                cubit.phone = value;
              },
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    cubit.phoneController.clear();
                  });
                },
                child: Icon(
                  Icons.clear,
                  size: 18.sp,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          TextButton.icon(
            onPressed: () {
              cubit.checkClipboard();
            },
            icon: Icon(
              FontAwesomeIcons.paste,
              size: 16.sp,
              color: AppColors.primaryColor,
            ),
            label: Text(
              "Paste".tr(),
              style: CustomTextStyle.signikaOptionstyle14.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Tooltip(
            message: "Open In WhatsApp".tr(),
            child: CustomBtn(
              height: MediaQuery.of(context).size.width * .15,
              width: MediaQuery.of(context).size.height * .25,
              onPressed: () {
                if (cubit.phoneFormKey.currentState!.validate()) {
                  cubit.phoneFormKey.currentState!.save();
                  int iconCode = FontAwesomeIcons.whatsapp.codePoint;
                  ContactModel contactModel = dateFormat(cubit, iconCode);
                  cubit.addContact(contactModel);
                  cubit.openWhatsapp(
                    number: cubit.phoneController.text,
                  );
                } else {
                  cubit.autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: "Open In WhatsApp".tr(),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "-Or using-".tr(),
            style: CustomTextStyle.signikastyle15.copyWith(
              color: AppColors.grey,
              fontSize: 13.sp,
            ),
          ),
          SizedBox(height: 5.h),
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
                onPressed: () {
                  if (cubit.phoneFormKey.currentState!.validate()) {
                    cubit.phoneFormKey.currentState!.save();
                    cubit.makeCall(phone: cubit.phoneController.text);
                  } else {
                    cubit.autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                icon: const Icon(
                  FontAwesomeIcons.phone,
                  color: Colors.blue,
                ),
                label: Text(
                  "Call".tr(),
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
