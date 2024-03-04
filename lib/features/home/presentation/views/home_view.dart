import 'package:flutter/material.dart';

import '../../../../core/functions/navigation.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const HomeViewBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            customNavigate(context, "/settingsView");
          },
          icon: const Icon(
            Icons.settings,
            size: 30,
            color: Colors.red,
          ),
        ),
      ],
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
          size: 30,
          color: Colors.red,
        ),
      ),
    );
  }
}
