import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:one_tap/core/functions/custom_snack_bar.dart';
import 'package:one_tap/core/utils/app_colors.dart';
import 'package:one_tap/features/home/cubits/home_cubit/home_state.dart';
import 'enter_mobile_number_section.dart';
import 'recent_conversation_bar.dart';
import '../../cubits/home_cubit/home_cubit.dart';
import 'contact_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is ChangeLanguageFailure) {
          customSnackBar(
            context,
            state.errMessage,
            AppColors.primaryColor,
          );
        } else if (state is ChangeLanguageSuccess) {
          GoRouter.of(context).pushReplacement("/splashView");
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              EnterMobileNumberSection(cubit: context.read<HomeCubit>()),
              SizedBox(height: 20.h),
              const Divider(),
              CustomRecentConversationBar(cubit: context.read<HomeCubit>()),
              SizedBox(height: 15.h),
              const ContactsListView(),
            ],
          ),
        );
      },
    );
  }
}
