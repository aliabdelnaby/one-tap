import 'package:flutter/material.dart';
import 'package:one_tap/features/home/presentation/widgets/custom_home_app_bar.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const CustomHomeAppBar(),
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
