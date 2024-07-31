import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_tap/core/utils/assets.dart';

class SplashLoadingView extends StatefulWidget {
  const SplashLoadingView({super.key});

  @override
  State<SplashLoadingView> createState() => _SplashLoadingViewState();
}

class _SplashLoadingViewState extends State<SplashLoadingView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 1),
      () {
        GoRouter.of(context).go('/homeView');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.imagesSplashLight,
        ),
      ),
    );
  }
}
