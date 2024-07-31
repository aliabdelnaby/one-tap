import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../cubits/home_cubit/home_cubit.dart';
import '../../cubits/home_cubit/home_state.dart';
import '../../../../core/utils/app_colors.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
          children: [
            Icon(
              Icons.language,
              color: AppColors.grey,
            ),
            const SizedBox(width: 10),
            _buildLanguageButton(
              context,
              'En',
              () {
                context.read<HomeCubit>().changeLanguageToEnglish(context);
              },
            ),
            const SizedBox(width: 10),
            _buildLanguageButton(
              context,
              'Ar',
              () {
                context.read<HomeCubit>().changeLanguageToArabic(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildLanguageButton(
      BuildContext context, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            side: BorderSide(color: AppColors.grey),
          ),
        ),
        child: Text(
          label.tr(),
          style: CustomTextStyle.signikastyle18.copyWith(color: AppColors.grey),
        ),
      ),
    );
  }
}
