import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_tap/core/admob/ads_functions.dart';
import 'custom_home_app_bar.dart';
import 'enter_mobile_number_section.dart';
import 'recent_conversation_bar.dart';
import '../../cubits/home_cubit/home_cubit.dart';
import 'contact_list_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  Timer? timer;

  @override
  void initState() {
    delayedShowAd();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const SizedBox(height: 20),
          const CustomHomeAppBar(),
          const SizedBox(height: 10),
          EnterMobileNumberSection(cubit: cubit),
          const SizedBox(height: 20),
          const Divider(),
          CustomRecentConversationBar(cubit: cubit),
          const SizedBox(height: 15),
          const ContactsListView(),
        ],
      ),
    );
  }

  void delayedShowAd() {
    timer = Timer.periodic(
      const Duration(seconds: 90),
      (timer) {
        //! Call delayedShowAd every 90 second
        Ads().showAd();
      },
    );
  }
}
