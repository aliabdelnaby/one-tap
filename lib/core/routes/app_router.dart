import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/home_cubit/home_cubit.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/settings/settings_cubit/settings_cubit.dart';
import '../../features/settings/presentation/views/select_language_view.dart';
import '../../features/settings/presentation/views/settings_view.dart';
import '../../features/settings/presentation/widgets/about_us.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: ((context, state) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeView(),
          )),
    ),
    GoRoute(
      path: '/settingsView',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => SettingsCubit(),
            child: const SettingsView(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(2.0, 0.0), // Start position (right)
                end: Offset.zero, // End position (left)
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/selectLanguageView',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const SelectLanguageView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(2.0, 0.0), // Start position (right)
                end: Offset.zero, // End position (left)
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/about',
      builder: ((context, state) => const AboutUs()),
    ),
  ],
);
