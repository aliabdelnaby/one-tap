import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_tap/features/home/cubits/home_cubit/home_cubit.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: BlocProvider.of<HomeCubit>(context).scaffoldHomekey,
        // drawer: const CustomDrawer(),
        body: const HomeViewBody(),
      ),
    );
  }
}
