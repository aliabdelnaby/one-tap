import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_tap/core/functions/custom_snack_bar.dart';
import 'package:one_tap/features/home/presentation/widgets/recent_conversation_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../cubits/home_cubit/home_cubit.dart';
import '../../cubits/home_cubit/home_state.dart';
import 'contact_list_view.dart';
import 'custom_enter_mobile_nember_and_open_tele_whatsapp.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocConsumer<HomeCubit, HomeState>(
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
              return const EnterMobileNumberSection();
            },
          ),
          const SizedBox(height: 20),
          const Divider(),
          CustomRecentConversationBar(cubit: cubit),
          const SizedBox(height: 15),
          const Expanded(child: ContactsListView()),
        ],
      ),
    );
  }
}
