
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/custom_snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../cubits/home_cubit/home_cubit.dart';
import '../../cubits/home_cubit/home_state.dart';
import 'custom_enter_mobile_nember_and_open_tele_whatsapp.dart';

class EnterMobileNumberSection extends StatelessWidget {
  const EnterMobileNumberSection({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is AddContactFailure) {
          customSnackBar(
            context,
            state.errMessage,
            AppColors.primaryColor,
          );
        } else if (state is AddContactSuccess) {
          cubit.fetchAllContacts();
        }
      },
      builder: (context, state) {
        return const EnterMobileNumberWidgets();
      },
    );
  }
}