import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:via_whatsapp/features/home/presentation/home_cubit/home_cubit.dart';
import 'package:via_whatsapp/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              size: 30,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share_outlined,
            size: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: const HomeViewBody(),
      ),
    );
  }
}
