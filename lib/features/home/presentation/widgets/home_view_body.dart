import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'enter_mobile_number_section.dart';
import 'recent_conversation_bar.dart';
import '../../cubits/home_cubit/home_cubit.dart';
import 'contact_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          EnterMobileNumberSection(cubit: cubit),
          SizedBox(height: 20.h),
          const Divider(),
          CustomRecentConversationBar(cubit: cubit),
          SizedBox(height: 15.h),
          const ContactsListView(),
        ],
      ),
    );
  }
}
