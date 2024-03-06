import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_tap/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:one_tap/features/home/presentation/widgets/enter_mobile_number_section.dart';
import 'package:one_tap/features/home/presentation/widgets/recent_conversation_bar.dart';
import '../../cubits/home_cubit/home_cubit.dart';
import 'contact_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          CustomHomeAppBar(cubit: cubit),
          EnterMobileNumberSection(cubit: cubit),
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

