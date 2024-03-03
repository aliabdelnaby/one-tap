import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:via_whatsapp/features/home/presentation/home_cubit/home_cubit.dart';
import 'package:via_whatsapp/features/home/presentation/home_cubit/home_state.dart';
import 'package:via_whatsapp/features/home/presentation/widgets/custom_btn.dart';
import 'package:via_whatsapp/features/home/presentation/widgets/custom_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        TextEditingController phoneController = TextEditingController();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: cubit.phoneFormKey,
            child: Column(
              children: [
                const Align(
                  child: Text(
                    "Enter Mobile Number",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Align(
                  child: Text(
                    "To start a WhatsApp Chat without saving the number to contacts",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
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
                  text: "Open In WhatsApp",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
