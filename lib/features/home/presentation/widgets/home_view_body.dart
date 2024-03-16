import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../../core/admob/ad_manager.dart';
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
  BannerAd? bannerAd;
  bool isLoaded = false;

  @override
  void initState() {
    loadAd();
    super.initState();
  }

  @override
  void dispose() {
    if (isLoaded) {
      bannerAd!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const SizedBox(height: 10),
          const CustomHomeAppBar(),
          const SizedBox(height: 15),
          Center(
            child: isLoaded
                ? SizedBox(
                    height: bannerAd!.size.height.toDouble(),
                    width: bannerAd!.size.width.toDouble(),
                    child: AdWidget(ad: bannerAd!),
                  )
                : const SizedBox(),
          ),
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

  void loadAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdManager.bannerHome,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    )..load();
  }
}
