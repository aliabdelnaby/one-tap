import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_state.dart';
import 'custom_btn.dart';
import 'custom_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        TextEditingController phoneController = TextEditingController();
        return Form(
          key: cubit.phoneFormKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
