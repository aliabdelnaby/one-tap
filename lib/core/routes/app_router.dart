import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:one_tap/features/onBoarding/presentation/views/on_boarding_view.dart';
import '../../features/home/cubits/home_cubit/home_cubit.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/settings/presentation/views/select_language_view.dart';
import '../../features/settings/presentation/views/settings_view.dart';
import '../../features/settings/presentation/widgets/about_us.dart';
import '../../features/settings/settings_cubit/settings_cubit.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: ((context, state) => const OnBoardnigView()),
    ),
    GoRoute(
      path: '/homeView',
      builder: ((context, state) => BlocProvider(
            create: (context) => HomeCubit()
              ..removeSpaces()
              ..fetchAllContacts(),
            child: const Directionality(
              textDirection: TextDirection.ltr,
              child: HomeView(),
            ),
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
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const AboutUs(),
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
  ],
);
