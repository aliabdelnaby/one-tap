import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_tap/core/functions/custom_toast.dart';
import 'package:one_tap/core/utils/app_colors.dart';
import 'package:one_tap/core/utils/app_text_styles.dart';
import 'package:one_tap/features/home/cubits/home_cubit/home_cubit.dart';
import 'package:one_tap/features/home/cubits/home_cubit/home_state.dart';
import 'package:one_tap/features/home/presentation/widgets/contact_list_view.dart';
import 'package:one_tap/features/home/presentation/widgets/custom_enter_mobile_nember_and_open_tele_whatsapp.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is AddContactFailure) {
                showToast(state.errMessage, AppColors.primaryColor);
              } else if (state is AddContactSuccess) {
                BlocProvider.of<HomeCubit>(context).fetchAllContacts();
              }
            },
            builder: (context, state) {
              return const EnterMobileNumberSection();
            },
          ),
          const SizedBox(height: 20),
          const Divider(),
          Text(
            "Recent Conversation".tr(),
            style: CustomTextStyle.signikastyle18,
          ),
          const SizedBox(height: 15),
          const Expanded(child: ContactsListView()),
        ],
      ),
    );
  }
}
