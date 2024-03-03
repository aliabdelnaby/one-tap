import 'package:flutter/material.dart';
import 'package:via_whatsapp/core/utils/app_colors.dart';
import 'package:via_whatsapp/core/utils/app_text_styles.dart';
import 'package:via_whatsapp/features/home/presentation/widgets/custom_btn.dart';

class SelectLanguageView extends StatelessWidget {
  const SelectLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Text(
                "Choose Language",
                style: CustomTextStyle.signikastyle24.copyWith(
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBtn(
                    onPressed: () {},
                    text: "Arabic",
                  ),
                  CustomBtn(
                    onPressed: () {},
                    text: "English",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
