import 'package:flutter/material.dart';
import 'package:one_tap/core/cache/cache_helper.dart';
import 'package:one_tap/core/functions/navigation.dart';
import 'package:one_tap/core/utils/app_colors.dart';
import 'package:one_tap/core/utils/assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isOnBoardingVisited =
        CacheHelper().getData(key: "isOnBoardingVisited") ?? false;
    if (isOnBoardingVisited == true) {
      delayedNavigate(context, "/homeView");
    } else {
      delayedNavigate(context, "/onBoardingView");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(
          Assets.imagesSplashLight,
        ),
      ),
    );
  }

  void delayedNavigate(context, path) {
    Future.delayed(const Duration(seconds: 1), () {
      customReplacementNavigate(context, path);
    });
  }
}
